RegisterNetEvent('zmain:garage:spawnVehiclePound', function(vehicle, spawnPoint)
    ESX.Game.SpawnVehicle(vehicle.model, vector3(spawnPoint.x, spawnPoint.y, spawnPoint.z), 90.0, function(vehicleSpawn)
        ESX.Game.SetVehicleProperties(vehicleSpawn, vehicle)
        SetVehRadioStation(vehicleSpawn, 'OFF')
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicleSpawn, -1)
    end)
end)

RegisterNetEvent('zmain:garages:edit:blips', function(value, id)
    if value == 'add' then
        local GarageBlip = AddBlipForCoord(Garages.garage_data.garages[id].defaultpos.x, Garages.garage_data.garages[id].defaultpos.y, Garages.garage_data.garages[id].defaultpos.z)
        SetBlipSprite(GarageBlip, Garages.garage_data.garages[id].type == 'car' and 357 or Garages.garage_data.garages[id].type == 'boat' and 427 or Garages.garage_data.garages[id].type == 'aircraft' and 557)
        SetBlipDisplay(GarageBlip, 4)
        SetBlipScale(GarageBlip, Garages.garage_data.garages[id].type == 'boat' and 0.7 or 0.6)
        SetBlipColour(GarageBlip, 42)
        SetBlipAsShortRange(GarageBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Garages.garage_data.garages[id].type == 'car' and '[TERRESTRE] Parking Public' or Garages.garage_data.garages[id].type == 'boat' and '[NAUTIQUE] Parking Public' or Garages.garage_data.garages[id].type == 'aircraft' and '[AÉRIEN] Parking Public')
        EndTextCommandSetBlipName(GarageBlip)

        Garages.garage_data.blips[id] = {
            id = GarageBlip
        }
    elseif value == 'remove' then
        RemoveBlip(Garages.garage_data.blips[id].id)
        Garages.garage_data.blips[id] = nil
    end
end)

RegisterNetEvent('zmain:garages:setvehicleProperties', function(vehicleNetworkID, tuning, entityId)
    print('fuel', fuel)
    while not NetworkDoesEntityExistWithNetworkId(vehicleNetworkID) do Citizen.Wait(200) end

    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetworkID)
    while vehicle == 0 or not DoesEntityExist(vehicle) do Citizen.Wait(200) end

    CreateThread(function()
        ESX.Game.SetVehicleProperties(vehicle, tuning)
    end)

    TriggerServerEvent('zmain:garages:syncEntityId' ,GetVehicleNumberPlateText(vehicle), entityId)
end)

function SetFuel(vehicle, fuel)
	if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
		SetVehicleFuelLevel(vehicle, fuel + 0.0)
		DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
	end
end

RegisterNetEvent('zmain:garages:setvehicleFuel', function(vehicleNetworkID, fuel)
    while not NetworkDoesEntityExistWithNetworkId(vehicleNetworkID) do Citizen.Wait(200) end

    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetworkID)
    while vehicle == 0 or not DoesEntityExist(vehicle) do Citizen.Wait(200) end

    SetFuel(vehicle, fuel)
end)