shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'bodacious'
game 'gta5'

--[[ Resource Information ]]--

Author 'Ayazwai#3900'
version '1.0.0'
scriptname 'wais-hudv3'

--[[ Resource Information ]]--

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    'vcheck.lua'
}

ui_page "html/index.html"

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/img/*.png',
    'html/weapons/*.png',
    'html/fonts/*.ttf',
    'html/fonts/*.otf',
    'html/fonts/*.woff',
}

lua54 'yes'

escrow_ignore {
    'config.lua',
}