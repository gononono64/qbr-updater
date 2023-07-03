RegisterCommand('qb-update', function(source, args, rawCommand)
    local password = args[1]
    if Config.EnableAdditionalSecurity then
        assert(password, "No password provided!")
        assert(password == Config.Password, "Invalid password provided!")
    end
    UpdateServer()
end, true)

RegisterCommand('qb-freshupdate', function(source, args, rawCommand)
    local password = args[1]
    if Config.EnableAdditionalSecurity then
        assert(password, "No password provided!")
        assert(password == Config.Password, "Invalid password provided!")
    end
    RemoveAllResources()
    UpdateServer()
end, true)

RegisterCommand('qb-install', function(source, args, rawCommand)
    local url = args[1]
    assert(url, "No URL provided!")

    local branch = args[2]
    local password = args[3]
    if not password then
        if branch and branch == Config.Password then
            password = branch
            branch = "main"
        end
    end

    local username, repository = url:match("github.com/([^/]+)/([^/]+)")
    assert(username and repository, "Invalid URL provided!")

    if not branch then
        local config = Config.Resources[repository]
        if config then
            branch = config.branch or "main"
        else
            branch = "main"
        end
    end

    local resourcePath = GetResourcePath(repository)
    if Config.EnableAdditionalSecurity and not resourcePath then
        assert(password, "No password provided!")
        assert(password == Config.Password, "Invalid password provided!")
    end

    if not resourcePath then
        resourcePath = GetResourcePath(GetCurrentResourceName())
        assert(resourcePath, "Error getting fallback path!")
        local pattern = 'qb%-updater'
        resourcePath = string.gsub(resourcePath, pattern, repository)
    end

    resourcePath = string.gsub(resourcePath, "//", "/")
    resourcePath = string.gsub(resourcePath, "/", "\\")
    print("Installing " .. repository .. " to " .. resourcePath)
    RetrieveResourceVersionAndDownload( repository, resourcePath, branch, url, false)
end, true)

RegisterCommand('qb-installrelease', function(source, args, rawCommand)
    local url = args[1]
    assert(url, "No URL provided!")

    local branch = args[2] or 'main'
    local password = args[3]
    if not password then
        if branch and branch == Config.Password then
            password = branch
            branch = 'main'
        end
    end

    local username, repository = url:match("github.com/([^/]+)/([^/]+)")
    assert(username and repository, "Invalid URL provided!")
    if not branch then
        local config = Config.Resources[repository]
        if config then
            branch = config.branch or "main"
        else
            branch = "main"
        end
    end

    local resourcePath = GetResourcePath(repository)
    if Config.EnableAdditionalSecurity and not resourcePath then
        assert(password, "No password provided!")
        assert(password == Config.Password, "Invalid password provided!")
    end

    if not resourcePath then
        resourcePath = GetResourcePath(GetCurrentResourceName())
        assert(resourcePath, "Error getting fallback path!")
        local pattern = 'qbr%-updater'
        resourcePath = string.gsub(resourcePath, pattern, repository)
    end

    resourcePath = string.gsub(resourcePath, "//", "/")
    resourcePath = string.gsub(resourcePath, "/", "\\")
    print("Installing " .. repository .. " to " .. resourcePath)
    RetrieveResourceVersionAndDownload(repository, resourcePath, branch, url, true)
end, true)


function TriggerSuggestion(src)
    TriggerClientEvent('chat:addSuggestion', src, '/qb-update', 'Update all qb resources', {
        { name="password", help="OPTIONAL: The password set in qb-updater. [Required] if enabled in config.lua." },
    })
    TriggerClientEvent('chat:addSuggestion', src, '/qb-freshupdate', 'Remove all qb resources and update them', {
        { name="password", help="OPTIONAL: The password set in qb-updater. [Required] if enabled in config.lua." },
    })
    TriggerClientEvent('chat:addSuggestion', src, '/qb-install', 'Download and soft-install GitHub resource', {
        { name="url", help="The GitHub URL of the resource you want to install. Example: 'https://github.com/gononono64/qb-updater'" },
        { name="branch/password", help="[Branch] OPTIONAL: The branch of the resource you want to install. Example: 'main' or 'master' (DEFAULT: 'main') [Password] OPTIONAL: The password set in qb-updater. *Required* if enabled in config.lua AND the resource is not already installed."},
        { name="password", help="OPTIONAL: The password set in qb-updater. [Required] if enabled in config.lua AND the resource is not already installed." },
    })
    TriggerClientEvent('chat:addSuggestion', src, '/qb-installrelease', 'Download and soft-install GitHub resource from latest release', {
        { name="url", help="The GitHub URL of the resource you want to install. Example: 'https://github.com/gononono64/qb-updater'"},
        { name="branch/password", help="[Branch] OPTIONAL: The branch of the resource you want to install. Example: 'main' or 'master' (DEFAULT: 'main') [Password] OPTIONAL: The password set in qb-updater. *Required* if enabled in config.lua AND the resource is not already installed."},
        { name="password", help="OPTIONAL: The password set in qb-updater. [Required] if enabled in config.lua AND the resource is not already installed." },
    })
end

RegisterNetEvent('playerJoining', function(oldId)
    local src = source
    TriggerSuggestion(src)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        TriggerSuggestion(-1)
    end
end)

