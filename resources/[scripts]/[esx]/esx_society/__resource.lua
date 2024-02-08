shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Society'

version '1.0.4'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'cron',
	'ZmainDev'
}