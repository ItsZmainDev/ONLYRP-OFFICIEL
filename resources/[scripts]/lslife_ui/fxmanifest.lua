shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'bodacious'
game 'gta5'

name 'KeyboardInput'
description 'A simple keyboardInput in HTML for FiveM'
author 'Absolute'

ui_page {"web/index.html"}

file{
    "web/**",
}

client_scripts {'client.lua'}
