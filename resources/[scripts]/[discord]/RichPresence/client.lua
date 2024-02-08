ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while ESX == nil do Wait(1) end
	
	local ped = PlayerId()
	local pName = GetPlayerName(ped)
	SetDiscordAppId(967416308406841354)
	SetDiscordRichPresenceAsset('bachirzmain')
	SetDiscordRichPresenceAssetText('OnlyRP')
	SetRichPresence(("%s"):format(pName))
end)