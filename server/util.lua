Path = {}
local OS = nil
function IsWindows()
    if OS == 1 then
        return true
    elseif OS == nil then
        local windir = os.getenv("windir") ~= nil
        if windir then
            OS = 1
        end
    end
    return OS == 1
end

function Path.CorrectPath(path)
    if IsWindows() then
        local removeDoubleForwardSlashes = string.gsub(path, "//", "/")
        local convert = string.gsub(removeDoubleForwardSlashes, "/", "\\")
        local removeDoubleBackSlashes = string.gsub(convert, "\\\\", "\\")
        return removeDoubleBackSlashes
    else
        return string.gsub(path, "\\", "/")
    end
end

function Path.GetResourcePath(resourceName)
    local path = GetResourcePath(resourceName)
    if not path then
        path = GetResourcePath(GetCurrentResourceName())
        local pattern = 'qbr%-updater'
        path = string.gsub(path, pattern, resourceName)
    end
    return Path.CorrectPath(path)
end

function Path.GetParentDirectory(path)
    local pattern = "(.+)%\\([^\\]-)$"
    local parentDirectory = Path.CorrectPath(string.match(path, pattern))
    return parentDirectory
end


function Path.GetCacheDirectory()
    local path = Path.GetResourcePath(GetCurrentResourceName())
    local categoryFolder = Path.GetParentDirectory(path)
    local resourcesFolder = Path.GetParentDirectory(categoryFolder)
    local baseFolder = Path.GetParentDirectory(resourcesFolder)
    return Path.CorrectPath(baseFolder .. "\\cache\\")
end

function Path.GetFXManifestPath(resourcePath)
    local fxmanifestPath = Path.CorrectPath(resourcePath .. "\\fxmanifest.lua")
    return fxmanifestPath
end

