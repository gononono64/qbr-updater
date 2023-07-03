--100 to 199 = reserved for windows
-- negative numbers are fatal errors
-- 0 = no error
Errors = {
    ['no_error'] = {
        code = 0,
        emoji = Emojis.success,
        message = "No error!",
    },
    ['unknown_error'] = {
        code = -1,
        emoji = Emojis.error,
        message = "[FATAL ERROR(-1)]: Unknown error!",
    },
    ['resolve_install_resource_path'] = {
        code = -2,
        emoji = Emojis.error,
        message = "[FATAL ERROR(-2)]: Error resolving resource path for %s!",
    },
    ['soft_resolve_install_resource_path'] = {
        code = 2,
        emoji = Emojis.error,
        message = "[ERROR(2) SKIPPING \"%s\"]: Error resolving resource path for %s!",
    },
    ['missing_resource_no_force_install'] = {
        code = 3,
        emoji = Emojis.info,
        message = "[Info(3) SKIPPING \"%s\"]: Missing resource %s and Config.InstallMissingResources is disabled!",
    },
    ['recipe_not_found'] = {
        code = -3,
        emoji = Emojis.error,
        message = "[FATAL ERROR(-3)]: Recipe not found!",
    },
    --windows
    ['windows_no_temp_folder'] = {
        code = -100,
        emoji = Emojis.error,
        message = "[FATAL ERROR(-100)]: Windows-Could not find temp folder!",
    },
    ['windows_no_temp_resource_folder'] = {
        code = 100,
        emoji = Emojis.error,
        message = "[ERROR(100) SKIPPING \"%s\"]: Windows-Could not create temp resource folder!",

    },
    ['windows_curl_download_failed'] = {
        code = 101,
        emoji = Emojis.error,
        message = "[ERROR(101) SKIPPING \"%s\"]: Windows-Curl download failed! | %s | %d",
    },
    ['windows_tar_unpack_failed'] = {
        code = 102,
        emoji = Emojis.error,
        message = "[ERROR(102) SKIPPING \"%s\"]: Windows-Tar unpack failed! | %s | %d",
    },
    ['windows_move_ignored_to_unzip_path_failed'] = {
        code = -101,
        emoji = Emojis.error,
        message = "[FATAL ERROR(-101) \"%s\"]: Windows-Move ignored to unzip path failed! | %s | %d",
    },
    ['windows_delete_resource_failed'] = {
        code = -102,
        emoji = Emojis.error,
        message = "[FATAL ERROR(-102) \"%s\"]: Windows-Delete resource failed! | %s | %d",
    },
    ['windows_rename_and_move_failed'] = {
        code = -103,
        emoji = Emojis.error,
        message = "[FATAL ERROR(-103) \"%s\"]: Windows-Rename and move failed! | %s | %d",
    },
    ['windows_cleanup_failed'] = {
        code = -104,
        emoji = Emojis.error,
        message = "[FATAL ERROR(-104) \"%s\"]: Windows-Cleanup failed! | %s | %d",
    },
    ['github_fxmanifest_not_found'] = {
        code = 404,
        emoji = Emojis.warning,
        message = "[ERROR(404) SKIPPING \"%s\"]: GitHub fxmanifest.lua not found!",
    },
    ['github_rate_limit'] = {
        code = 403,
        emoji = Emojis.warning,
        message = "[ERROR(403) SKIPPING \"%s\"]: GitHub rate limit reached!",
    },
    ['github_unauthorized'] = {
        code = 401,
        emoji = Emojis.warning,
        message = "[ERROR(401) SKIPPING \"%s\"]: GitHub unauthorized!",
    },
    ['github_internal_server_error'] = {
        code = 500,
        emoji = Emojis.warning,
        message = "[ERROR(500) SKIPPING \"%s\"]: GitHub internal server error!",
    },
    ['fxmanifest_version_not_found'] = {
        code = 1,
        emoji = Emojis.warning,
        message = "[ERROR(1) SKIPPING \"%s\"]: fxmanifest.lua version not found!",
    }

}

function Errors.GetErrorCode(errorIndex)
    local _error = Errors[errorIndex]
    if _error then
        return _error.code
    else
        return Errors.unknown_error.code
    end
end

function Errors.GetErrorEmoji(errorIndex)
    local _error = Errors[errorIndex]
    if _error then
        return _error.emoji
    else
        return Errors.unknown_error.emoji
    end
end

function Errors.GetErrorMessage(errorIndex, ...)
    local _error = Errors[errorIndex]
    if _error then
        return string.format(_error.message, ...)
    else
        _error = Errors.unknown_error or {}
        return string.format(_error.message or "Unknown Error and unable to resolve! Did you modify or delete errorcodes.lua?", ...)
    end
end

