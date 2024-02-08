shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'adamant'

game 'gta5'

description 'Zmain Inventory'

version '1.0.0'

lua54 'yes'

shared_scripts {
  "locales/*.lua",
  'config/*.lua',

}


client_scripts {
  "inventory.lua",
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',

  "sv_inventory.lua"
}

ui_page 'src/html/ui.html'


files {

  "locales/*.js",

  'src/html/*.html',

  'config/config.js',
  'src/html/assets/js/*.js',

  'config/config.css',
  'src/html/assets/css/*.css',
  
  'src/html/assets/images/*.png',
  'src/html/assets/items/*.png',
  'src/html/assets/icons/*.png',

  'src/html/assets/fonts/*.ttf',
  'src/html/assets/fonts/*.otf',
  'src/html/assets/fonts/justsignature/JustSignature.woff',

}

dependency '/assetpacks'