
Logs = {
    Success = {},
    Error = {},
}

function LogNil(resourceName, message)
    local emoji = Emojis.error
    local message = message or "Resource is nil!"
    Logs.Error[#Logs.Error + 1] = {emoji = emoji, message = message, resourceName = resourceName}
end

function LogSuccess(errorIndex, resourceName, message)
    local emoji = Errors.GetErrorEmoji(errorIndex)
    local message = message or Errors.GetErrorMessage(errorIndex, resourceName)
    Logs.Success[#Logs.Success + 1] = {emoji = emoji, message = message, resourceName = resourceName}
end

function LogError(errorIndex, resourceName, message, ...)
    local emoji = Errors.GetErrorEmoji(errorIndex)
    local message = message or Errors.GetErrorMessage(errorIndex, resourceName, ...)
    Logs.Error[#Logs.Error + 1] = {emoji = emoji, message = message, resourceName = resourceName}
end

function Log(errorIndex, errorData, resourceName)
    local success = errorData.code == 0
    if success then
        LogSuccess(errorIndex, resourceName)
    else
        LogError(errorIndex, resourceName)
    end
end

function GetLogs()
    return Logs
end

function ClearLogs()
    Logs = {
        Success = {},
        Error = {},
    }
end

Print = {
    Success = function(message)
        print(Emojis.success, message)
    end,
    Error = function(message)
        print(Emojis.error, message)
    end,
    Info = function(message)
        print(Emojis.info, message)
    end,
    Warning = function(message)
        print(Emojis.warning, message)
    end,
    Loading = function(message)
        print(Emojis.loading, message)
    end,
    Downloading = function(message)
        print(Emojis.downloading, message)
    end,
    Logs = function()
        local success = Logs.Success
        local errors = Logs.Error
        if success then
            for _, log in ipairs(success) do
                print(log.emoji, log.resourceName, log.message)
            end
        end
        if errors then
            for _, log in ipairs(errors) do
                print(log.emoji, log.resourceName, log.message)
            end
        end
    end,
    ErrorCode = function(errorIndex, ...)
        local errorcode = Errors.GetErrorCode(errorIndex)
        local emoji = Errors.GetErrorEmoji(errorIndex)
        local message = Errors.GetErrorMessage(errorIndex, ...)
        print(string.format("%s [%s] %s", emoji, errorcode, message))
    end
}


