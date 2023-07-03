Config = {}
Config.OS = "windows"
Config.InstallMissingResources = false -- If true, on update will install resources listed below that are not present on the server.

Config.Resources = {
    ['qbr-adminmenu'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-adminmenu',
    },
    ['qbr-ambulancejob'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-ambulancejob',
    },
    ['qbr-banking'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-banking',
    },
    ['qbr-clothing'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-clothing',
    },
    ['qbr-core'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-core',
    },
    ['qbr-doorlock'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-doorlock',
    },
    ['qbr-hud'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-hud',
    },
    ['qbr-input'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-input',
    },
    ['qbr-interiors'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-interiors',
    },
    ['qbr-inventory'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-inventory',
    },
    ['qbr-lockpick'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-lockpick',
    },
    ['qbr-management'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-management',
    },
    ['qbr-menu'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-menu',
    },
    ['qbr-multicharacter'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-multicharacter',
    },
    ['qbr-policejob'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-policejob',
    },
    ['qbr-scoreboard'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-scoreboard',
    },
    ['qbr-shops'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-shops',
    },
    ['qbr-smallresources'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-smallresources',
    },
    ['qbr-spawn'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-spawn',
    },
    ['qbr-stable'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-stable',
    },
    ['qbr-target'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-target',
    },
    ['qbr-weapons'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-weapons',
    },
    ['qbr-weathersync'] = {
        url = 'https://github.com/qbcore-redm-framework/qbr-weathersync',
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

