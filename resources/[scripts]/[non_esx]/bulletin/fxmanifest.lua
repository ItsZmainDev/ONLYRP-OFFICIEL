shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

fx_version 'adamant'

game 'gta5'

description 'bulletin'

author 'ZinZinDeLeSpace'

version '1.1.9'

client_scripts {
    'config.lua',
    'bulletin.lua',
    'demo.lua'
}

ui_page 'ui/ui.html'

files {
    'ui/ui.html',
    'ui/images/*.jpg',
    'ui/images/*.png',
    'ui/audio/*.ogg',
    'ui/audio/*.mp3',
    'ui/audio/*.wav',
    'ui/fonts/*.ttf',
    'ui/css/*.css',
    'ui/js/*.js'
    
}

exports {
    'Send',
    'SendAdvanced',
    'SendSuccess',
    'SendInfo',
    'SendWarning',
    'SendError',
    'SendPinned',
    'Unpin',
    'UpdatePinned'
}
