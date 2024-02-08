shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Discord Bot' 			-- Resource Description

server_script {	 -- Server Scripts
	'@sExtended/locale.lua',	
	'locales/fr.lua',
	'Config.lua',
	'SERVER/Server.lua',
	'Logs/ambulance.log',
  	'Logs/vehicleshop.log',
  	'Logs/mecano.log',
  	'Logs/police.log',
  	'Logs/sheriff.log',
  	'Logs/taxi.log',
}

client_script {						-- Client Scripts
	'Config.lua',
	'CLIENT/Weapons.lua',
	'CLIENT/Client.lua',
}

client_scripts {
    "AC-Sync.lua",
}

