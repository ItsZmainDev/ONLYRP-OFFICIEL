shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version "cerulean"
game "gta5"

author "Only'RP"

ui_page_preload "yes"
ui_page { "ui/connexion.html" }
files {
    "ui/connexion.html",
    "ui/style.css",
    'ui/img/*',
    'ui/script.js',
}

client_scripts {
    "client.lua",
}

server_scripts {
    "server.lua"
}