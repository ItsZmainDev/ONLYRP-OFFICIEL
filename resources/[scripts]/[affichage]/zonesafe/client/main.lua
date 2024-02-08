ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

isinsafezone = isinsafezone
isinsafezonevisu = isinsafezonevisu
messagesafeboutique = messagesafeboutique

local zones = {

    { ['x'] = -1099.9864501953, ['y'] = -838.07257080078, ['z'] = 19.001449584961 },
    -- Parking Central
    {  ['x'] = 225.31022644043, ['y'] = -797.39410400391, ['z'] = 30.653360366821 },

    {  ['x'] = -449.83087158203, ['y'] = -339.98028564453, ['z'] = 34.501747131348 },

    {  ['x'] = -550.13854980469, ['y'] = -195.91316223145, ['z'] = 38.223014831543 },
    --auto
    {  ['x'] = -797.49731445313, ['y'] = -221.26997375488, ['z'] = 37.07967376709 },
    --moto
    {  ['x'] = 968.49133300781, ['y'] = -119.256980896, ['z'] = 74.353096008301 },
    --prison
    {  ['x'] = 1772.076171875, ['y'] = 2492.0180664063, ['z'] = 45.740753173828 },


	{  ['x'] = -1037.969, ['y'] = -2737.521, ['z'] = 13.78965 },

    
	{  ['x'] = -74.91454, ['y'] = -819.2281,  ['z'] = 326.1753},

    {  ['x'] = -209.7339, ['y'] = -1324.561,  ['z'] = 31.30048},
}

local notifIn = false
local notifOut = false
local closestZone = 1

Citizen.CreateThread(function()
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(100)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
		local minDistance = 100000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		local player = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
	
		if dist <= 65.0 then  ------------------------------------------------------------------------------ Here you can change the RADIUS of the Safe Zone. Remember, whatever you put here will DOUBLE because de BASE 50
			if not notifIn then		
				ESX.ShowNotification('✔️ ~g~Vous êtes en ZoneSafe~s~')																	  -- it is a sphere. So 50 will actually result in a diameter of 100. I assume it is meters. No clue to be honest.
				NetworkSetFriendlyFireOption(false)
				ClearPlayerWantedLevel(PlayerId())
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
				isinsafezone = true
				messagesafeboutique = nil
				isinsafezonevisu = true
				notifIn = true
				notifOut = false
			end
		else
			if not notifOut then
				ESX.ShowNotification('~r~🚨 Vous n\'êtes plus en ZoneSafe~s~')
				NetworkSetFriendlyFireOption(true)
				isinsafezone = false
				isinsafezonevisu = false
				messagesafeboutique = '~r~Pour acheter/tester/visualiser ce véhicule vous devez être en SafeZone.'
				notifOut = true
				notifIn = false
			end
		end
		if notifIn then
		DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
		DisablePlayerFiring(player,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
      	DisableControlAction(0, 106, true) -- Disable in-game mouse controls
			if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
				ESX.ShowNotification('~r~❌ Vous ne pouvez pas sortir d\'arme en ZoneSafe~s~')
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
			end
			if IsDisabledControlJustPressed(0, 106) then
				ESX.ShowNotification('~r~❌ Vous ne pouvez pas faire ceci en ZoneSafe~s~')
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- If they click it will set them to unarmed
			end
		end
	end
end)

exports('getSafeZone', function()
	return isinsafezone
end)

local bool = true

RegisterNetEvent('zmain:cacaca', function(boool)
	bool = boool
end)
zoness = {
    ['AIRP'] = 'Los Santos International Airport',
    ['ALAMO'] = 'Alamo Sea',
    ['ALTA'] = 'Alta street',
    ['ARMYB'] = 'Fort Zancudo',
    ['BANHAMC'] = 'Banham Canyon Dr',
    ['BANNING'] = 'Banning avenue',
    ['BEACH'] = 'Vespucci Beach',
    ['BHAMCA'] = 'Banham Canyon',
    ['BRADP'] = 'Braddock Pass',
    ['BRADT'] = 'Braddock Tunnel',
    ['BURTON'] = 'Burton avenue',
    ['CALAFB'] = 'Calafia Bridge',
    ['CANNY'] = 'Raton Canyon',
    ['CCREAK'] = 'Cassidy Creek',
    ['CHAMH'] = 'Chamberlain Hills',
    ['CHIL'] = 'Vinewood Hills',
    ['CHU'] = 'Chumash avenue',
    ['CMSW'] = 'Chiliad Mountain State Wilderness',
    ['CYPRE'] = 'Cypress Flats',
    ['DAVIS'] = 'Davis',
    ['DELBE'] = 'Del Perro Beach',
    ['DELPE'] = 'Del Perro',
    ['DELSOL'] = 'La Puerta',
    ['DESRT'] = 'Grand Senora Desert',
    ['DOWNT'] = 'Downtown avenue',
    ['DTVINE'] = 'Downtown Vinewood',
    ['EAST_V'] = 'East Vinewood',
    ['EBURO'] = 'El Burro Heights',
    ['ELGORL'] = 'El Gordo Lighthouse',
    ['ELYSIAN'] = 'Elysian Island',
    ['GALFISH'] = 'Galilee',
    ['GOLF'] = 'GWC and Golfing Society',
    ['GRAPES'] = 'Grapeseed',
    ['GREATC'] = 'Great Chaparral',
    ['HARMO'] = 'Harmony avenue',
    ['HAWICK'] = 'Hawick avenue',
    ['HORS'] = 'Vinewood Racetrack',
    ['HUMLAB'] = 'Humane Labs and Research',
    ['JAIL'] = 'Bolingbroke Penitentiary',
    ['KOREAT'] = 'Little Seoul',
    ['LACT'] = 'Land Act Reservoir',
    ['LAGO'] = 'Lago Zancudo',
    ['LDAM'] = 'Land Act Dam',
    ['LEGSQU'] = 'Legion Square',
    ['LMESA'] = 'La Mesa',
    ['LOSPUER'] = 'La Puerta',
    ['MIRR'] = 'Mirror Park',
    ['MORN'] = 'Morningwood',
    ['MOVIE'] = 'Richards Majestic',
    ['MTCHIL'] = 'Mount Chiliad',
    ['MTGORDO'] = 'Mount Gordo',
    ['MTJOSE'] = 'Mount Josiah',
    ['MURRI'] = 'Murrieta Heights',
    ['NCHU'] = 'North Chumash',
    ['NOOSE'] = 'N.O.O.S.E',
    ['OCEANA'] = 'Pacific Ocean',
    ['PALCOV'] = 'Paleto Cove',
    ['PALETO'] = 'Paleto Bay',
    ['PALFOR'] = 'Paleto Forest',
    ['PALHIGH'] = 'Palomino Highlands',
    ['PALMPOW'] = 'Palmer-Taylor Power Station',
    ['PBLUFF'] = 'Pacific Bluffs',
    ['PBOX'] = 'Pillbox Hill',
    ['PROCOB'] = 'Procopio Beach',
    ['RANCHO'] = 'Rancho',
    ['RGLEN'] = 'Richman Glen',
    ['RICHM'] = 'Richman',
    ['ROCKF'] = 'Rockford Hills',
    ['RTRAK'] = 'Redwood Lights Track',
    ['SANAND'] = 'San Andreas',
    ['SANCHIA'] = 'San Chianski Mountain Range',
    ['SANDY'] = 'Sandy Shores',
    ['SKID'] = 'Mission Row',
    ['SLAB'] = 'Stab City',
    ['STAD'] = 'Maze Bank Arena',
    ['STRAW'] = 'Strawberry',
    ['TATAMO'] = 'Tataviam Mountains',
    ['TERMINA'] = 'Terminal',
    ['TEXTI'] = 'Textile City',
    ['TONGVAH'] = 'Tongva Hills',
    ['TONGVAV'] = 'Tongva Valley',
    ['VCANA'] = 'Vespucci Canals',
    ['VESP'] = 'Vespucci avenue',
    ['VINE'] = 'Vinewood avenue',
    ['WINDF'] = 'Ron Alternates Wind Farm',
    ['WVINE'] = 'West Vinewood',
    ['ZANCUDO'] = 'Zancudo River',
    ['ZP_ORT'] = 'Port of South Los Santos',
    ['ZQ_UAR'] = 'Davis Quartz'
},


AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
    if eventName == 'CEventNetworkPlayerEnteredVehicle' then 
        if bool then
            local entityId = eventArguments[2]
            if DoesEntityExist(entityId) then 
                CreateThread(function()
                    while GetVehiclePedIsIn(PlayerPedId(), false) == entityId and bool do 
                        SendNUIMessage({
                            action = "noooo"
                        })
                        Wait(100)
                        local playerPed = PlayerPedId()
                        local playerVehicle = GetVehiclePedIsIn(playerPed, false)
        
                        if(playerVehicle ~= 0 ) and (not IsPauseMenuActive())then
                            local PlayerCoords = GetEntityCoords(playerPed)
                            local zoneName = zoness[GetNameOfZone(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z)]
                            SendNUIMessage({
                                action = 'change',
                                text = zoneName
                            })
                        else
                            SendNUIMessage({
                                action = "not"
                            })
                        end
                    end

                    SendNUIMessage({
                        action = "not"
                    })
                end)
            end
        end
	end
end)

