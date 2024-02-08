shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'cerulean'
games { 'gta5' };

description "eDBank Discord : https://discord.gg/aurezia"

version "1.0"

Author "eDen"

shared_scripts {
    "shared/config.lua",
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

}

client_scripts {
    "@es_extended/locale.lua",
    "client/*.lua",

}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@es_extended/locale.lua",
    "server/*.lua",
}


