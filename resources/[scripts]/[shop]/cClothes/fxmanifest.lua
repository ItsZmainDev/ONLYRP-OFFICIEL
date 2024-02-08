shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'adamant'
games { 'gta5' }


client_scripts {
  'menu.lua',
  'config.lua',
  "client/*.lua",
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
  'config.lua',
  "server/*.lua",
}