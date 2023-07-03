Windows = {}
function Windows.RunCommand(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    local success, reason, code = handle:close()
    if success then
        return true
    else
        return false, reason, code
    end
end
function Windows.DownloadCommand(zipPath, downloadUrl)
    local downloadCMD = string.format("curl -L -o \"%s\" \"%s\"", zipPath, downloadUrl)
    return Windows.RunCommand(downloadCMD)
end

function Windows.UnpackCommand(zipPath, tempZipFolder)
    local unpackCMD = string.format("tar -xf \"%s\" -C \"%s\"", zipPath, tempZipFolder)
    return Windows.RunCommand(unpackCMD)
end

function Windows.DeleteResourceCommand(path)
    local deleteResourceCMD = string.format("if exist \"%s\" rmdir /s /q \"%s\"", path, path)
    return Windows.RunCommand(deleteResourceCMD)
end

function Windows.RenameAndMoveCommand(tempZipFolder, path)
    local renameAndMoveCMD = string.format("move \"%s\" \"%s\"", tempZipFolder, path)
    return Windows.RunCommand(renameAndMoveCMD)
end

function Windows.CleanUpCommand(zipPath)
    local cleanupCMD = string.format("del /f \"%s\"", zipPath)
    return Windows.RunCommand(cleanupCMD)
end

function Windows.DirectoryExists(path)
    local directoryExistsCMD = string.format("if exist \"%s\" echo true", path)
    return Windows.RunCommand(directoryExistsCMD)
end

function Windows.CreateDirectoryIfNotExists(path)
    local createDirectoryCMD = string.format("if not exist \"%s\" mkdir \"%s\"", path, path)
    return Windows.RunCommand(createDirectoryCMD)
end

function Windows.MoveIgnoredToUnzipPath(ignorePaths, unzipPath)
    local moveResults = {}
    if not ignorePaths then return moveResults end
    for _, v in ipairs(ignorePaths or {}) do
        local ignoredPath = v.path
        local tempPath = unzipPath .. '\\' .. v.relativePath
        local moveResult, errorReason, errorCode = Windows.RenameAndMoveCommand(ignoredPath, tempPath)
        if not moveResult then
            moveResults = {result = false, reason = errorReason, code = errorCode}
        else
            moveResults = {result = true}
        end
    end
    return moveResult
end



function Windows.Recipe(url, branch, path, ignorePaths, useLatestReleaseLink)
    local username, repository = url:match("github.com/([^/]+)/([^/]+)")

    local downloadUrl = string.format("https://github.com/%s/%s/archive/refs/heads/%s.zip", username, repository, branch)
    local tempFolder = Path.GetCacheDirectory()
    if not Windows.DirectoryExists(tempFolder) then
        return "windows_no_temp_folder", Errors.windows_no_temp_folder
    end
    tempFolder = tempFolder .. '\\' .. GetCurrentResourceName()
    Windows.CreateDirectoryIfNotExists(tempFolder)
    if not Windows.DirectoryExists(tempFolder) then
        return "windows_no_temp_resource_folder", Errors.windows_no_temp_resource_folder
     end

    local zipPath = tempFolder .. '\\' .. repository .. '.zip'
    local tempZipFolder = tempFolder .. '\\' .. repository .. '-' .. branch
    if useLatestReleaseLink then
        downloadUrl = string.format("https://github.com/%s/%s/releases/latest/download/%s.zip", username, repository, repository)
        tempZipFolder = tempFolder .. '\\' .. repository
    end
    -- Download the file

    local downloadResult, downloadReason, downloadCode = Windows.DownloadCommand(zipPath, downloadUrl) -- Download the resource and place into temp folder
    if not downloadResult then return "windows_curl_download_failed", Errors.windows_curl_download_failed, downloadReason, downloadCode end

    local unpackResult, unpackReason, unpackCode = Windows.UnpackCommand(zipPath, tempFolder) -- Unpack the resource into temp folder
    if not unpackResult then return "windows_tar_unpack_failed", Errors.windows_tar_unpack_failed, unpackReason, unpackCode end

    local ignoreResults = Windows.MoveIgnoredToUnzipPath(ignorePaths, tempZipFolder)
    for _, v in ipairs(ignoreResults or {}) do
        if not v.result then return "windows_move_ignored_to_unzip_path_failed", Errors.windows_move_ignored_to_unzip_path_failed, v.reason, v.code end
    end

    local deleteResourceResult, deleteResourceReason, deleteResourceCode = Windows.DeleteResourceCommand(path) -- Delete the resource
    if not deleteResourceResult then return "windows_delete_resource_failed", Errors.windows_delete_resource_failed, deleteResourceReason, deleteResourceCode end

    local renameAndMoveResult, renameAndMoveReason, renameAndMoveCode = Windows.RenameAndMoveCommand(tempZipFolder, path) -- Move the resource to the new path
    if not renameAndMoveResult then return "windows_rename_and_move_failed", Errors.windows_rename_and_move_failed, renameAndMoveReason, renameAndMoveCode end

    local cleanupResult, cleanupReason, cleanupCode = Windows.CleanUpCommand(zipPath) -- Cleanup the temp folder
    if not cleanupResult then return "windows_cleanup_failed", Errors.windows_cleanup_failed, cleanupReason, cleanupCode end

    local result = [[
        ]] .. tostring(downloadResult) .. [[
        ]] .. tostring(unpackResult) .. [[
        ]] .. tostring(deleteResourceResult) .. [[
        ]] .. tostring(renameAndMoveResult) .. [[
        ]] .. tostring(cleanupResult) .. [[
    ]]

        print(
            "\n\t============================= Downloaded and Installed: " .. repository .. " =============================",
            "\n\tDownload URL:", downloadUrl,
            "\n\tDownload Path:", zipPath,
            "\n\tUnpack Path:", tempZipFolder,
            "\n\tMove Path:", path,
            "\n\tResult:", result,
            "\n\t=================================================================================================="
        )
    return 'no_error', Errors.no_error
end