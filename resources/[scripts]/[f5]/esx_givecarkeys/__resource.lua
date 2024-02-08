shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

-- ESX GiveCarKeys script by codeina.pro
resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"
server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'client/main.lua'
}
