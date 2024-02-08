shared_scripts {"@SeaShield/resource/antitrigger.lua"} 

shared_scripts {"@SeaShield/resource/security.lua"} 

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Clip'

version '1.0.0'

server_scripts {
  'server/sv_clip.lua'
}

client_scripts {
  'client/cl_clip.lua'
}
