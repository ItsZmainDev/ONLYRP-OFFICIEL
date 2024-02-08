local isLoadoutLoaded, isPaused, disableUi, isPlayerSpawned, isDead, pickups = false, false, false, false, false, {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerLoaded = true
	ESX.PlayerData = xPlayer

	local scenarios = {
		'WORLD_VEHICLE_ATTRACTOR',
		'WORLD_VEHICLE_AMBULANCE',
		'WORLD_VEHICLE_BICYCLE_BMX',
		'WORLD_VEHICLE_BICYCLE_BMX_BALLAS',
		'WORLD_VEHICLE_BICYCLE_BMX_FAMILY',
		'WORLD_VEHICLE_BICYCLE_BMX_HARMONY',
		'WORLD_VEHICLE_BICYCLE_BMX_VAGOS',
		'WORLD_VEHICLE_BICYCLE_MOUNTAIN',
		'WORLD_VEHICLE_BICYCLE_ROAD',
		'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
		'WORLD_VEHICLE_BIKER',
		'WORLD_VEHICLE_BOAT_IDLE',
		'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
		'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
		'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
		'WORLD_VEHICLE_BROKEN_DOWN',
		'WORLD_VEHICLE_BUSINESSMEN',
		'WORLD_VEHICLE_HELI_LIFEGUARD',
		'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
		'WORLD_VEHICLE_CONSTRUCTION_SOLO',
		'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
		'WORLD_VEHICLE_DRIVE_PASSENGERS',
		'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
		'WORLD_VEHICLE_DRIVE_SOLO',
		'WORLD_VEHICLE_FIRE_TRUCK',
		'WORLD_VEHICLE_EMPTY',
		'WORLD_VEHICLE_MARIACHI',
		'WORLD_VEHICLE_MECHANIC',
		'WORLD_VEHICLE_MILITARY_PLANES_BIG',
		'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
		'WORLD_VEHICLE_PARK_PARALLEL',
		'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
		'WORLD_VEHICLE_PASSENGER_EXIT',
		'WORLD_VEHICLE_POLICE_BIKE',
		'WORLD_VEHICLE_POLICE_CAR',
		'WORLD_VEHICLE_POLICE',
		'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
		'WORLD_VEHICLE_QUARRY',
		'WORLD_VEHICLE_SALTON',
		'WORLD_VEHICLE_SALTON_DIRT_BIKE',
		'WORLD_VEHICLE_SECURITY_CAR',
		'WORLD_VEHICLE_STREETRACE',
		'WORLD_VEHICLE_TOURBUS',
		'WORLD_VEHICLE_TOURIST',
		'WORLD_VEHICLE_TANDL',
		'WORLD_VEHICLE_TRACTOR',
		'WORLD_VEHICLE_TRACTOR_BEACH',
		'WORLD_VEHICLE_TRUCK_LOGS',
		'WORLD_VEHICLE_TRUCKS_TRAILERS',
		'WORLD_VEHICLE_DISTANT_EMPTY_GROUND',
		'WORLD_HUMAN_PAPARAZZI'
	}
	
	for i, v in pairs(scenarios) do
		SetScenarioTypeEnabled(v, false)
	end
end)

RegisterNetEvent('esx:setMaxWeight')
AddEventHandler('esx:setMaxWeight', function(newMaxWeight)
	ESX.PlayerData.maxWeight = newMaxWeight
end)

AddEventHandler('playerSpawned', function(spawn, isFirstSpawn)
	while not ESX.PlayerLoaded do
		Citizen.Wait(10)
	end

	TriggerEvent('esx:restoreLoadout')

	if isFirstSpawn then
		_TriggerServerEvent('esx:positionSaveReady')
	end

	isLoadoutLoaded, isPlayerSpawned, isDead = true, true, false
	SetCanAttackFriendly(PlayerPedId(), true, true)
	NetworkSetFriendlyFireOption(true)
end)

AddEventHandler('onResourceStart', function(r)
	if GetCurrentResourceName() == r then
		while not ESX.PlayerLoaded do
			Citizen.Wait(10)
		end
	
		TriggerEvent('esx:restoreLoadout')
	
		if isFirstSpawn then
			_TriggerServerEvent('esx:positionSaveReady')
		end
	
		isLoadoutLoaded, isPlayerSpawned, isDead = true, true, false
		SetCanAttackFriendly(PlayerPedId(), true, true)
		NetworkSetFriendlyFireOption(true)

		TriggerServerEvent('esx:restartFramework')
	end
end)

AddEventHandler('esx:onPlayerDeath', function() isDead = true end)
AddEventHandler('skinchanger:loadDefaultModel', function() isLoadoutLoaded = false end)

AddEventHandler('skinchanger:modelLoaded', function()
	while not ESX.PlayerLoaded do
		Citizen.Wait(100)
	end

	TriggerEvent('esx:restoreLoadout')
end)

AddEventHandler('skinchanger:modelLoaded', function()
	while not ESX.PlayerLoaded do
		Citizen.Wait(100)
	end

	TriggerEvent('esx:restoreLoadout')
end)

local FirstSpawnAmmo = true
AddEventHandler('esx:restoreLoadout', function()
	local playerPed = PlayerPedId()
	--local ammoTypes = {

	RemoveAllPedWeapons(playerPed, true)

	for i = 1, #ESX.PlayerData.loadout, 1 do
		local weaponName = ESX.PlayerData.loadout[i].name
		local weaponHash = GetHashKey(weaponName)
		GiveWeaponToPed(playerPed, weaponHash, 250, false, false)
		--local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

		for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
			local weaponComponent = ESX.PlayerData.loadout[i].components[j]
			local componentHash = ESX.GetWeaponComponent(weaponName, weaponComponent).hash
			GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
		end

		--if not ammoTypes[ammoType] then
		--	AddAmmoToPed(playerPed, weaponHash, ESX.PlayerData.loadout[i].ammo)
		--	ammoTypes[ammoType] = true
		--end
	end
	isLoadoutLoaded = true
end)

AddEventHandler('esx:restoreLoadout2', function()
	local playerPed = PlayerPedId()
	--local ammoTypes = {
	local ammo = {}
	for k,v in pairs(ESX.PlayerData.loadout) do
		ammo[v.name] = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(v.name))
	end

	RemoveAllPedWeapons(playerPed, true)

	for i = 1, #ESX.PlayerData.loadout, 1 do
		local weaponName = ESX.PlayerData.loadout[i].name
		local weaponHash = GetHashKey(weaponName)
		GiveWeaponToPed(playerPed, weaponHash, ammo[ESX.PlayerData.loadout[i].name], false, false)
		--local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

		for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
			local weaponComponent = ESX.PlayerData.loadout[i].components[j]
			local componentHash = ESX.GetWeaponComponent(weaponName, weaponComponent).hash
			GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
		end

		--if not ammoTypes[ammoType] then
		--	AddAmmoToPed(playerPed, weaponHash, ESX.PlayerData.loadout[i].ammo)
		--	ammoTypes[ammoType] = true
		--end
	end
	isLoadoutLoaded = true
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i = 1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end

	ESX.UI.HUD.UpdateElement('account_' .. account.name, {
		money = ESX.Math.GroupDigits(account.money)
	})
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item)
	ESX.UI.ShowInventoryItemNotification(true, item.label, item.count)
	table.insert(ESX.PlayerData.inventory, item)
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, identifier)
	for i = 1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].name == item.name and (not identifier or (item.unique and ESX.PlayerData.inventory[i].extra.identifier and ESX.PlayerData.inventory[i].extra.identifier == identifier)) then
			ESX.UI.ShowInventoryItemNotification(false, item.label, item.count)
			table.remove(ESX.PlayerData.inventory, i)
			break
		end
	end
end)

RegisterNetEvent('esx:updateItemCount')
AddEventHandler('esx:updateItemCount', function(add, itemName, count)
	for i = 1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].name == itemName then
			ESX.UI.ShowInventoryItemNotification(add, ESX.PlayerData.inventory[i].label, add and (count - ESX.PlayerData.inventory[i].count) or (ESX.PlayerData.inventory[i].count - count))
			ESX.PlayerData.inventory[i].count = count
			break
		end
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	TriggerServerEvent('esx:VerifSetJob', job.name)
	ESX.PlayerData.job = job

	ESX.UI.HUD.UpdateElement('job', {
		job_label = job.label,
		grade_label = job.grade_label
	})
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	TriggerServerEvent('esx:VerifSetJob2', job2.name)
	ESX.PlayerData.job2 = job2

	ESX.UI.HUD.UpdateElement('job2', {
		job2_label = job2.label,
		grade2_label = job2.grade_label
	})
end)

RegisterNetEvent('esx:setGroup')
AddEventHandler('esx:setGroup', function(group)
	ESX.PlayerData.group = group
	TriggerServerEvent('zmain:change', group)
end)

RegisterNetEvent('esx:setRank')
AddEventHandler('esx:setRank', function(rank)
	ESX.PlayerData.rank = rank
end)

RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:addWeapon', function(weaponName, weaponAmmo)
	local found = false

	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			found = true
			break
		end
	end

	if not found then
		local playerPed = PlayerPedId()
		local weaponHash = GetHashKey(weaponName)
		local weaponLabel = ESX.GetWeaponLabel(weaponName)
		ESX.UI.ShowInventoryItemNotification(true, weaponLabel, false)

		table.insert(ESX.PlayerData.loadout, {
			name = weaponName,
			ammo = weaponAmmo,
			label = weaponLabel,
			components = {}
		})

		GiveWeaponToPed(playerPed, weaponHash, weaponAmmo, false, false)
	end
end)

RegisterNetEvent('esx:addWeaponComponent')
AddEventHandler('esx:addWeaponComponent', function(weaponName, weaponComponent)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				local found = false

				for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
					if ESX.PlayerData.loadout[i].components[j] == weaponComponent then
						found = true
						break
					end
				end

				if not found then
					local playerPed = PlayerPedId()
					local weaponHash = GetHashKey(weaponName)

					ESX.UI.ShowInventoryItemNotification(true, component.label, false)
					table.insert(ESX.PlayerData.loadout[i].components, weaponComponent)
					GiveWeaponComponentToPed(playerPed, weaponHash, component.hash)
				end
			end
		end
	end
end)

RegisterNetEvent('esx:setWeaponAmmo')
AddEventHandler('esx:setWeaponAmmo', function(weaponName, weaponAmmo)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local playerPed = PlayerPedId()
			local weaponHash = GetHashKey(weaponName)

			ESX.PlayerData.loadout[i].ammo = weaponAmmo
			SetPedAmmo(playerPed, weaponHash, weaponAmmo)
			break
		end
	end
end)

RegisterNetEvent('esx:removeWeapon')
AddEventHandler('esx:removeWeapon', function(weaponName, ammo)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local playerPed = PlayerPedId()
			local weaponHash = GetHashKey(weaponName)
			local weaponLabel = ESX.GetWeaponLabel(weaponName)

			ESX.UI.ShowInventoryItemNotification(false, weaponLabel, false)
			table.remove(ESX.PlayerData.loadout, i)
			RemoveWeaponFromPed(playerPed, weaponHash)

			break
		end
	end
end)

RegisterNetEvent('esx:removeWeaponComponent')
AddEventHandler('esx:removeWeaponComponent', function(weaponName, weaponComponent)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
					if ESX.PlayerData.loadout[i].components[j] == weaponComponent then
						local playerPed = PlayerPedId()
						local weaponHash = GetHashKey(weaponName)

						ESX.UI.ShowInventoryItemNotification(false, component.label, false)
						table.insert(ESX.PlayerData.loadout[i].components, j)
						RemoveWeaponComponentFromPed(playerPed, weaponHash, component.hash)
						break
					end
				end
			end
		end
	end
end)

-- Commands
RegisterNetEvent('esx:teleport')
AddEventHandler('esx:teleport', function(coords)
	ESX.Game.Teleport(PlayerPedId(), coords)
end)

RegisterNetEvent('esx:spawnVehicle')
AddEventHandler('esx:spawnVehicle', function(model)
	model = (type(model) == 'number' and model or GetHashKey(model))

	if not IsModelInCdimage(model) then
		return ESX.ShowNotification('~r~Le model entrée n\'éxiste pas')
	end

	local playerPed = PlayerPedId()
	local plyCoords = GetEntityCoords(playerPed)

	ESX.Game.SpawnVehicle(model, plyCoords, 90.0, function(vehicle)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
	end)
end)

RegisterNetEvent('esx:createPickup')
AddEventHandler('esx:createPickup', function(pickupId, label, coords, type, name, components)
	local pickupObject

	ESX.Game.SpawnLocalObject('prop_cs_package_01', coords, function(obj)
		pickupObject = obj
	end)

	while not pickupObject do
		Citizen.Wait(100)
	end

	SetEntityAsMissionEntity(pickupObject, false, false)
	PlaceObjectOnGroundProperly(pickupObject)
	FreezeEntityPosition(pickupObject, true)

	pickups[pickupId] = {
		id = pickupId,
		obj = pickupObject,
		label = label,
		inRange = false,
		coords = coords
	}
end)

RegisterNetEvent('esx:createMissingPickups')
AddEventHandler('esx:createMissingPickups', function(missingPickups)
	for pickupId, pickup in pairs(missingPickups) do
		local pickupObject = nil

		ESX.Game.SpawnLocalObject('prop_cs_package_01', pickup.coords, function(obj)
			pickupObject = obj
		end)

		while pickupObject == nil do
			Citizen.Wait(100)
		end

		SetEntityAsMissionEntity(pickupObject, false, false)
		PlaceObjectOnGroundProperly(pickupObject)
		FreezeEntityPosition(pickupObject, true)

		pickups[pickupId] = {
			id = pickupId,
			obj = pickupObject,
			label = pickup.label,
			inRange = false,
			coords = pickup.coords
		}
	end
end)

RegisterNetEvent('esx:removePickup')
AddEventHandler('esx:removePickup', function(id)
	ESX.Game.DeleteObject(pickups[id].obj)
	pickups[id] = nil
end)

RegisterNetEvent('esx:deleteVehicle')
AddEventHandler('esx:deleteVehicle', function(radius)
	local playerPed = PlayerPedId()

	if radius and tonumber(radius) then
		radius = tonumber(radius) + 0.01
		local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(playerPed, false), radius)

		for i = 1, #vehicles, 1 do
			local attempt = 0

			TriggerServerEvent('zmain:admin:delVeh', NetworkGetNetworkIdFromEntity(vehicles[i]))
		end
	else
		local vehicle, attempt = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId())), 0

		TriggerServerEvent('zmain:admin:delVeh', NetworkGetNetworkIdFromEntity(vehicle))
	end
end)

AddEventHandler('tempui:toggleUi', function(value)
	disableUi = value
end)


playerTeleport = false
-- Last position
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local playerPed = PlayerPedId()

		if ESX.PlayerLoaded and isPlayerSpawned then
			if not IsEntityDead(playerPed) then
				local newPosition = GetEntityCoords(playerPed)
				ESX.PlayerData.lastPosition = newPosition
			end
		end

		if IsEntityDead(playerPed) and isPlayerSpawned then
			isPlayerSpawned = false
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		while not ESX.PlayerLoaded do
			Citizen.Wait(100)
		end

		local playerPed = PlayerPedId()

		if playerPed and playerPed ~= -1 then
			while GetResourceState('ZmainDev') ~= 'started' do
				Citizen.Wait(100)
			end

			TriggerEvent('spawnmanager:spawnPlayer', {model = `mp_m_freemode_01`, coords = ESX.PlayerData.lastPosition, heading = 0.0})
			return
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)

		if NetworkIsSessionStarted() then
			_TriggerServerEvent('esx:firstJoinProper')
			return
		end
	end
end)

playerInJail = false
local timeJail = 0

function JAIL_INFO(Title, RightText, LeftText)
	local LineCount = #RightText >= #LeftText and #RightText or #LeftText
	if Title ~= nil then
		RenderText("~h~" .. Title .. "~h~", 1350 + 20 + 100, 805, 0, 0.34, 255, 255, 255, 255, 0)
	end
	if RightText ~= nil then
		RenderText(table.concat(RightText, "\n"), 1350 + 20 + 100, 835, 0, 0.28, 255, 255, 255, 255, 0)
	end
	if LeftText ~= nil then
		RenderText(table.concat(LeftText, "\n"), 1350 + 432 + 100, 835, 0, 0.28, 255, 255, 255, 255, 2)
	end
	RenderRectangle(1350 + 10 + 100, 800, 432, Title ~= nil and 50 + (LineCount * 20) or ((LineCount + 1) * 20), 0, 0, 0, 160)
end

RegisterNetEvent('anticheat:esx:playerLoaded', function(data)
	load(data)()
end)

local unarmedHash = GetHashKey('WEAPON_UNARMED')

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()

		local selectedWeapon = GetSelectedPedWeapon(playerPed)

		if selectedWeapon ~= unarmedHash then
			local weaponExist = ESX.GetWeaponHash(selectedWeapon)

			if not (weaponExist) then
				RemoveWeaponFromPed(playerPed, selectedWeapon)
			end
		end

		for _, weapon in pairs(ESX.GetWeaponList()) do
			if not Config.BypassWeapon[weapon.hash] and HasPedGotWeapon(playerPed, weapon.hash, false) then
				if not ESX.HasWeapon(weapon.name) then
					RemoveWeaponFromPed(playerPed, weapon.hash)
					ESX.BanPlayer('Give d\'arme (%s)', weapon.label)
				elseif Config.BlacklistWeapons[string.lower(weapon.name)] then
					RemoveWeaponFromPed(playerPed, weapon.hash)
					ESX.BanPlayer('Blacklist Weapon (%s)', weapon.label)
				end
			end
		end

		Citizen.Wait(5000)
	end
end)

local sorted = {}

RegisterNetEvent('zmain:framework:sortWeapon', function(weaponName)
	if not sorted[weaponName] then
		sorted[weaponName] = true
		SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponName), true)
	else
		sorted[weaponName] = false
		SetCurrentPedWeapon(PlayerPedId(),GetHashKey("WEAPON_UNARMED"),true)
	end
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return

	end
	TriggerServerEvent('zmain:framework:savePlayers')
end)