
function GetFileTextFromGitHubRepo(url, branch, filename, cb)
    if not cb or type(cb) ~= "function" then return end
    local username, repository = url:match("github.com/([^/]+)/([^/]+)")
    local fileURL = string.format("https://raw.githubusercontent.com/%s/%s/%s/%s", username, repository, branch, filename)
    PerformHttpRequest(fileURL, function(response, responseText, responseHeaders)
        cb(response, responseText, responseHeaders)
    end)
end

function GetVersionNumberFromFile(filePath)
    local file = io.open(filePath, "r")
    if not file then return end

    local fileContents = file:read("*a")
    file:close()

    local versionNumber = fileContents:match("version%s+'([%d%.]+)'")
    return versionNumber
end

function CompareVersionNumbers(version1, version2)
    local version1Parts = {}
    for part in version1:gmatch("%d+") do
        table.insert(version1Parts, tonumber(part))
    end

    local version2Parts = {}
    for part in version2:gmatch("%d+") do
        table.insert(version2Parts, tonumber(part))
    end

    for i = 1, math.max(#version1Parts, #version2Parts) do
        local part1 = version1Parts[i] or 0
        local part2 = version2Parts[i] or 0
        if part1 > part2 then
            return 1
        elseif part1 < part2 then
            return -1
        end
    end
    return 0
end

function GenerateIgnoredPaths(resourcePath, resourceName)
    local ignorePaths = {}
    local configResource = Config.Resources[resourceName]
    if not configResource then return ignoredPaths end

    local configIgnore = configResource.ignore
    if not configIgnore then return ignoredPaths end

    for _, ignoredPath in ipairs(configIgnore) do
        if string.find(ignoredPath, "*", 1, true) then
            local pattern = string.gsub(ignoredPath, "*", ".*")
            local files = io.popen("dir /b /s " .. resourcePath .. "\\" .. pattern):lines()
            for file in files do
                ignorePaths[#ignorePaths + 1] = {
                    path = file,
                    relativePath = string.gsub(file, resourcePath .. "\\", "")
                }

            end
        else
            local path = resourcePath .. '\\' .. ignoredPath
            ignorePaths[#ignorePaths + 1] = {
                path = path,
                relativePath = ignoredPath,
            }
        end
    end

    return ignorePaths
end

local couldNotPullFXManifest = {}
function RetrieveResourceVersionAndRunRecipe(resourceName, resourcePath, branch, url, useLatestReleaseLink, cb)
    local resourceVersionFilePath = Path.GetFXManifestPath(resourcePath)
    local resourceVersion = GetVersionNumberFromFile(resourceVersionFilePath)
    branch = branch or "main"

    local recipe = nil
    if IsWindows() then
        recipe = Windows.Recipe
    end
    if not recipe or type(recipe) ~= 'function' then
        return 'recipe_not_found', Errors.recipe_not_found, resourceName
    end

    GetFileTextFromGitHubRepo(url, branch, "fxmanifest.lua", function(_error, responseText, responseHeaders)
        if _error ~= 200 then
            local errorIndex = 'github_fxmanifest_not_found'
            if _error == 404 then
                errorIndex = 'github_fxmanifest_not_found'
            elseif _error == 403 then
                errorIndex = 'github_rate_limit'
            elseif _error == 401 then
                errorIndex = 'github_unauthorized'
            elseif _error == 500 then
                errorIndex = 'github_internal_server_error'
            end
            return cb(errorIndex, Errors[errorIndex], resourceName)
        end
        local versionNumber = responseText:match("version%s+'([%d%.]+)'")
        if not versionNumber then
            return cb("fxmanifest_version_not_found", Errors.fxmanifest_version_not_found, resourceName)
        end
        if not resourceVersion or CompareVersionNumbers(versionNumber, resourceVersion) > 0 then
            local ignoredPaths = GenerateIgnoredPaths(resourcePath, resourceName)
            local errorData = table.pack(recipe(url, branch, resourcePath, ignoredPaths, useLatestReleaseLink))
            local errorIndex = errorData[1]
            local errored = errorData[2]
            if errored and errored.code == Errors.no_error.code then
                LogSuccess('no_error', resourceName, "Successfully updated " .. resourceName .. " to version " .. versionNumber)
            else
                LogError(errorIndex, resourceName, table.unpack(errorData, 3))
                return
            end

            if cb and type(cb) == "function" then
                cb(errorIndex, errored, resourceName)
            end
        else
            LogSuccess('no_error', resourceName, "Already up to date")
        end
    end)
end

local terminate = false
function TerminateUpdater()
    terminate = true
end

function ResetUpdater()
    terminate = false
end

function UpdateServer(cb)
    local currentResourceName = string.gsub(GetCurrentResourceName(), " ", ""):lower()
    ResetUpdater()
    CreateThread(function()
        local fallbackPath = Path.CorrectPath(GetResourcePath(currentResourceName))
        if not fallbackPath then
            LogError('resolve_install_resource_path', currentResourceName)
            return TerminateUpdater()
        end

        for resourceName, v in pairs(Config.Resources) do
            if terminate then return end
            local url = v.url
            local branch = v.branch or "main"
            local useLatestReleaseLink = v.useLatestReleaseLink
            local resourcePathRaw = GetResourcePath(resourceName) or nil
            if not resourcePathRaw  then
                local pattern = "qbr%-updater"
                resourcePathRaw = string.gsub(fallbackPath, pattern, resourceName )
                Print.Warning("Could not find resource path for " .. resourceName .. "! Using fallback path: " .. resourcePathRaw)
                if resourcePathRaw == fallbackPath then
                    LogError('soft_resolve_install_resource_path', resourceName)
                    goto continue
                end
            end

            if not resourcePathRaw then
                LogError('resolve_install_resource_path', resourceName)
                TerminateUpdater()
                break
            end

            local resourcePath = Path.CorrectPath(resourcePathRaw)
            local _errorIndex, _errorData, _resourceName = RetrieveResourceVersionAndRunRecipe( resourceName, resourcePath, branch, url, useLatestReleaseLink,
                function(errorIndex, errorData, resourceName)
                    if errorData then
                        Log(errorIndex, errorData, resourceName)
                        local errorcode = errorData.code
                        if errorcode < 0 then
                            TerminateUpdater()
                            return errorData
                        end
                    else
                        LogNil(resourceName, "[RetrieveResourceVersionAndRunRecipe-ErrorCB] Triggered without error data")
                    end
                end
            )

            if _errorData then
                print(_errorIndex, _errorData, _resourceName)
                Log(_errorIndex, _errorData, _resourceName)
                local errorcode = _errorData.code
                if errorcode < 0 then
                    TerminateUpdater()
                    break
                end
            end
            Wait(100)
            ::continue::
        end
        print("Done updating resources")
        Print.Logs()
    end)
end

function RemoveResouce(resourceName)
    local resourcePathRaw = GetResourcePath(resourceName)
    if not resourcePathRaw then return end

    local resourcePath = string.gsub(resourcePathRaw, "//", "/")
    resourcePath = string.gsub(resourcePath, "/", "\\")

    local removeCMD = string.format("rmdir /s /q \"%s\"", resourcePath)
    local handle = io.popen(removeCMD)
    local result = handle:read("*a")
    handle:close()
    if result then
        print(
            "\n\t============================= Removed: " .. resourceName .. " =============================",
            "\n\tPath:", resourcePath,
            "\n\tResult:", result,
            "\n\t=================================================================================================="
        )
        return true
    end

    return false
end

RemoveAllResources = function()
    for resourceName, url in pairs(Config.Resources) do
        RemoveResouce(resourceName)
    end
    print("All registered resources removed!")
end
