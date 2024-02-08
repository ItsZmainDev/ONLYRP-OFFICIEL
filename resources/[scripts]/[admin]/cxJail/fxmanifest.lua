shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version "adamant"
game "gta5"

shared_scripts {
    "shared/config.lua"
}

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    "shared/functions.lua",
    "client/main.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/logs.lua",
    "server/server.lua"
}