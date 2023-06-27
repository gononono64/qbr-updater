Config = {}

Config.Resources = {
    ['qbr-adminmenu'] = 'https://github.com/qbcore-redm-framework/qbr-adminmenu',
    ['qbr-ambulancejob'] = 'https://github.com/qbcore-redm-framework/qbr-ambulancejob',
    ['qbr-banking'] = 'https://github.com/qbcore-redm-framework/qbr-banking',
    ['qbr-clothing'] = 'https://github.com/qbcore-redm-framework/qbr-clothing',
    ['qbr-core'] = 'https://github.com/qbcore-redm-framework/qbr-core',
    ['qbr-doorlock'] = 'https://github.com/qbcore-redm-framework/qbr-doorlock',
    ['qbr-hud'] = 'https://github.com/qbcore-redm-framework/qbr-hud',
    ['qbr-input'] = 'https://github.com/qbcore-redm-framework/qbr-input',
    ['qbr-interiors'] = 'https://github.com/qbcore-redm-framework/qbr-interiors',
    ['qbr-inventory'] = 'https://github.com/qbcore-redm-framework/qbr-inventory',
    ['qbr-lockpick'] = 'https://github.com/qbcore-redm-framework/qbr-lockpick',
    ['qbr-management'] = 'https://github.com/qbcore-redm-framework/qbr-management',
    ['qbr-menu'] = 'https://github.com/qbcore-redm-framework/qbr-menu',
    ['qbr-multicharacter'] = 'https://github.com/qbcore-redm-framework/qbr-multicharacter',
    ['qbr-policejob'] = 'https://github.com/qbcore-redm-framework/qbr-policejob',
    ['qbr-scoreboard'] = 'https://github.com/qbcore-redm-framework/qbr-scoreboard',
    ['qbr-shops'] = 'https://github.com/qbcore-redm-framework/qbr-shops',
    ['qbr-smallresources'] = 'https://github.com/qbcore-redm-framework/qbr-smallresources',
    ['qbr-spawn'] = 'https://github.com/qbcore-redm-framework/qbr-spawn',
    ['qbr-stable'] = 'https://github.com/qbcore-redm-framework/qbr-stable',
    ['qbr-target'] = 'https://github.com/qbcore-redm-framework/qbr-target',
    ['qbr-weapons'] = 'https://github.com/qbcore-redm-framework/qbr-weapons',
    ['qbr-weathersync'] = 'https://github.com/qbcore-redm-framework/qbr-weathersync', 
    ['qbr-updater'] = 'https://github.com/gononono64/qbr-updater'
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

