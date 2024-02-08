shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description "ESX Inventory HUD"

lua54 'yes'

author 'Redyy'
version '1.0'

ui_page {'html/index.html'}

client_script {'client/main.lua','functions/main.lua','functions/events.lua'}
server_script {'@oxmysql/lib/MySQL.lua', 'server/main.lua'}

shared_scripts {'config.lua'}

files {'html/index.html','html/js/*.js','html/css/*.css', 'html/assets/*.png', 'html/assets/*.jpg'}