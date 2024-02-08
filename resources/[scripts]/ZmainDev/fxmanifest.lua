shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'cerulean'
game 'gta5'

lua54 'yes'

ui_page 'UI/index.html'

files {
    'UI/index.html',
    'UI/style.css',
    'UI/main.js',
    'UI/images/*.png'
}

shared_scripts {
    'modules/**/shared/*.lua',

    'UI/shared/*.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    "RageUIv2/RMenu.lua",
    "RageUIv2/menu/RageUI.lua",
    "RageUIv2/menu/Menu.lua",
    "RageUIv2/menu/MenuController.lua",
    "RageUIv2/components/*.lua",
    "RageUIv2/menu/elements/*.lua",
    "RageUIv2/menu/items/*.lua",
    "RageUIv2/menu/panels/*.lua",
    "RageUIv2/menu/windows/*.lua",

    "ContextUI/components/*.lua",
    "ContextUI/ContextUI.lua",

    'init/cl_esx.lua',
    'fr.lua',

    'functions/functions.lua',
    'modules/**/client/*.lua',

    'zones.lua',
    'blips.lua',
    'peds.lua',
    'UI/client/*.lua',
}

server_scripts {
    '@es_extended/locale.lua',
    '@oxmysql/lib/MySQL.lua',
    'init/sv_esx.lua',
    'fr.lua',

    'modules/**/server/*.lua',
    'modules/Boutique/server/object/*.lua',
    'modules/Staff/shared/sv_admin.js',

    'UI/server/*.lua',
}