Config = {}
Config.OS = "windows"
Config.InstallMissingResources = false -- If true, on update will install resources listed below that are not present on the server.

--To make sure resources are as up to date as possible.
--Please remove any ignored files that you have not modified from the resource list below
Config.Resources = {
    ['qbr-adminmenu'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-adminmenu',
    },
    ['qbr-ambulancejob'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-ambulancejob',
        ignore = {'config.lua'},
    },
    ['qbr-banking'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-banking',
        ignore = {'config.lua'},
    },
    ['qbr-clothing'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-clothing',
        ignore = {'shared/config.lua'},
    },
    ['qbr-core'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-core',
        ignore = {'shared/*.lua', 'config.lua'},
    },
    ['qbr-doorlock'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-doorlock',
        ignore = {'config.lua'},
    },
    ['qbr-hud'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-hud',
        ignore = {'config.lua'},
    },
    ['qbr-input'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-input',
    },
    ['qbr-interiors'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-interiors',
    },
    ['qbr-inventory'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-inventory',
        ignore = {'html/images/*.png', 'config.lua'},
    },
    ['qbr-lockpick'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-lockpick',
    },
    ['qbr-management'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-management',
        ignore = {'config.lua'},
    },
    ['qbr-menu'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-menu',
    },
    ['qbr-multicharacter'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-multicharacter',
        ignore = {'config.lua'},
    },
    ['qbr-policejob'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-policejob',
        ignore = {'config.lua'},
    },
    ['qbr-scoreboard'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-scoreboard',
        ignore = {'config.lua'},
    },
    ['qbr-shops'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-shops',
        ignore = {'config.lua'},
    },
    ['qbr-smallresources'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-smallresources',
        ignore = {'config.lua'},
    },
    ['qbr-spawn'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-spawn',
        ignore = {'config.lua'},
    },
    ['qbr-stable'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-stable',
        ignore = {'config.lua'},
    },
    ['qbr-target'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-target',
    },
    ['qbr-weapons'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-weapons',
        ignore = {'config.lua'},
    },
    ['qbr-weathersync'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-weathersync',
        ignore = {'config.lua'},
    },
    ['qbr-updater'] = {
        url = 'https://github.com/gononono64/qbr-updater',
    },
    ['oxmysql'] = {
        url = 'https://github.com/overextended/oxmysql',
        useLatestReleaseLink = true,
    },
}

-- ______________________________________________________________________________________________________________________________
-- /_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/
--   _________                    .__  __  .__               .___        _____                            __  .__
--  /   _____/ ____   ____   _____|__|/  |_|__|__  __ ____   |   | _____/ ____\___________  _____ _____ _/  |_|__| ____   ____
--  \_____  \_/ __ \ /    \ /  ___/  \   __\  \  \/ // __ \  |   |/    \   __\/  _ \_  __ \/     \\__  \\   __\  |/  _ \ /    \
--  /        \  ___/|   |  \\___ \|  ||  | |  |\   /\  ___/  |   |   |  \  | (  <_> )  | \/  Y Y  \/ __ \|  | |  (  <_> )   |  \
-- /_______  /\___  >___|  /____  >__||__| |__| \_/  \___  > |___|___|  /__|  \____/|__|  |__|_|  (____  /__| |__|\____/|___|  /
--         \/     \/     \/     \/                       \/           \/                        \/     \/                    \/
--   ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.    ._.
--   | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |
--   |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|
--   |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|    |-|
--   | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |    | |
--   |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|    |_|

-- ___  _____  _____  _____  _____  _____  _____  _____  _____  _____  _____  _____  _____  _____  _____  _____  _____  _____  __
-- \  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /\  \/ /
--  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /  \   /
--   \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/    \_/
--   ______   ______   ______   ______   ______   ______   ______   ______   ______   ______   ______   ______   ______   ______
--  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/

Config.EnableAdditionalSecurity = true -- Enable additional security features (recommended)
Config.Password = 'mrcaseasyas123' -- Password to install resources not listed above

