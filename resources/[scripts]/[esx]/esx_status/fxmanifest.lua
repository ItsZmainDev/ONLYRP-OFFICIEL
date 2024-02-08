shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'adamant'
game 'gta5'

client_scripts {
    "config.lua",
    "client/*.lua",
    "client/classes/*.lua",
}

server_scripts {
    '@oxmysql/lib/MySQL.lua', 
    "config.lua",
    "server/*.lua",
}