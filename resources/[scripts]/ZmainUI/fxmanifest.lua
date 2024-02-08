shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'cerulean'
game 'gta5'

lua54 'yes'

ui_page('index.html') 

files({
    'index.html',
    'assets/index.js',
    'assets/css/fonts.css',
    'assets/css/style.css',
})

client_scripts {
    'main.lua'
}