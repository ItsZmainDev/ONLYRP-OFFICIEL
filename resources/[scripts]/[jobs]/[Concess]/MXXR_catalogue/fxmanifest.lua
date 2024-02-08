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

client_scripts {
	'client/cl_catalogue.lua',
	'dependencies/pmenu.lua'
}

server_scripts {
	'server/sv_catalogue.lua',
	'@oxmysql/lib/MySQL.lua',
}


dependency '/assetpacks'