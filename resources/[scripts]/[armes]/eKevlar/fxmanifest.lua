shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'cerulean'
game 'gta5'

author 'Ewen'
description 'Advanced Kevlar System'
version '1.0.0'

lua54 'yes'

shared_scripts {
    'configs/config.lua'
}

client_scripts {
    "load.lua",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "configs/config.lua",
    "server.lua",
}

escrow_ignore {
    'configs/*.lua',
}
dependency '/assetpacks'