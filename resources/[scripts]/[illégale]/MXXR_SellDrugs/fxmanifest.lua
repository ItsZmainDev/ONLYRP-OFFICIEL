shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'adamant'
game 'gta5'
author 'MXXR'
lua54 'yes'

escrow_ignore {
    'Config.lua',
}

shared_scripts {
	'Config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}

client_scripts {
	'client/*.lua',
	'Config.lua',
	'dependencies/pmenu.lua'
}
dependency '/assetpacks'