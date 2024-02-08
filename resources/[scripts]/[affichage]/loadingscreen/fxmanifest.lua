shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'adamant'
game 'gta5'

author 'highrider#2873'
description 'DineroCity-Loading'
version '0.1'

files {
    '*.html',
    'assets/**/*.*',
    'assets/**/**/*.*'
}

client_script 'client.lua'

--loadscreen_manual_shutdown "yes"
loadscreen 'index.html'