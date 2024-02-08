Garages = {
    my_garage = {
        VehiclesList = {},
        PaidGarage = {},
        VehiclesGroupList = {},
        VehiclesEntrepriseList = {},
        SortedVehicle = {},
        RateLimit = {},
    },

    garage_data = {
        garages = {},
        data = {},
        positions = {},
    },

    fuels = {},
}

-- Citizen.CreateThread(function()
--     MySQL.Async.execute([[
--         CREATE TABLE IF NOT EXISTS t1 (
--             c1 INT,
--             c2 VARCHAR(10)
--         );
--     ]])
-- end)

function Garages:load()
    MySQL.Async.fetchAll('SELECT * FROM garages', {}, function(garage)

        if json.encode(garage) == '[]' then goto continue end

        for k,v in pairs(garage) do

            Garages.garage_data.garages[v.id] = {
                id = v.id,
                name = v.name,
                label = v.label,
                type = v.type,

                defaultpos = json.decode(v.defaultpos),
                deletepos = json.decode(v.deletepos),
                spawnpos = json.decode(v.spawnpos),
                headingspawnpos = v.headingspawnpos,
                activeblip = v.activeblip
            }

            ESX.toConsole(('^3Load^0 du garage ^3%s^0 id ^3%i^0'):format(v.name, v.id))
        end

        ::continue::
    end)
end

function Garages:CreateVehicle(src, nameSpawn, plate, vehicleProperties, position, heading)

    local vehicleId = CreateVehicle(nameSpawn, position.x , position.y, position.z, heading, true, false)

    if DoesEntityExist(vehicleId) then
        ESX.Notifi(src, ('Failed to spawn %s %s %s %s %s'):format(nameSpawn, plate, vehicleProperties, position, heading))
        return ESX.toConsole(('Failed to spawn %s %s %s %s %s'):format(nameSpawn, plate, vehicleProperties, position, heading))
    end

    local failedAttempt = 0
    while not DoesEntityExist(vehicleId) do
        Citizen.Wait(200) 
        failedAttempt = failedAttempt + 1
        if failedAttempt > 5 then
            ESX.toConsole(('Failed to spawn %s %s %s %s %s'):format(nameSpawn, plate, vehicleProperties, position, heading))
        end
    end

    return vehicleId, NetworkGetNetworkIdFromEntity(vehicleId)
end

RegisterNetEvent('zmain:garages:sortVehicle', function(vehicles, veh, defaultpos, defautheading, plate, garageid, fuel)
    local source = source
    local self = {}
    self[source] = {}
    if Garages.my_garage.SortedVehicle[plate] ~= nil then
        if DoesEntityExist(Garages.my_garage.SortedVehicle[plate].vehicleId) then
            return TriggerClientEvent('esx:showNotification', source, 'Ce véhicule est déjà sur la map')
        end
    end

    self[source].vehicleId, self[source].netId = Garages:CreateVehicle(source, vehicles, plate, veh, vector3(defaultpos.x, defaultpos.y, defaultpos.z), tonumber(defautheading))

    if Garages.my_garage.SortedVehicle[plate] == nil then
        Garages.my_garage.SortedVehicle[plate] = {}
        Garages.my_garage.SortedVehicle[plate].vehicleId = self[source].vehicleId
        Garages.my_garage.SortedVehicle[plate].vehiclePlate = plate
    else
        Garages.my_garage.SortedVehicle[plate].vehicleId = self[source].vehicleId
    end

    print(Garages.fuels[plate])

    TriggerClientEvent('zmain:garages:setvehicleProperties', -1, self[source].netId, veh, self[source].vehicleId)
    TriggerClientEvent('zmain:garages:setvehicleFuel', -1, self[source].vehicleId, Garages.fuels[plate])
    TriggerClientEvent('esx:showNotification', source, '✔️ Véhicule sorti avec succès')
end)

ESX.RegisterServerCallback('zmain:garages:checkPlateInMap', function(source, cb, plate)
    if Garages.my_garage.SortedVehicle[plate] == nil then return cb(true) end
    if DoesEntityExist(Garages.my_garage.SortedVehicle[plate].vehicleId) then
        cb(false)
    else
        cb(true)
    end
end)

RegisterNetEvent('main:garages:syncEntityId', function(plate, entityId)
    Garages.my_garage.SortedVehicle[plate].vehicleId = entityId
end)

function Garages:refresh()
    Wait(500)
    TriggerClientEvent('zmain:garage:refresh', -1, Garages.garage_data.garages)
end

CreateThread(function()
    Garages:load()
end)

RegisterNetEvent('zmain:garage:load', function()
    local source = source
    Wait(500)
    TriggerClientEvent('zmain:garage:refresh', source, Garages.garage_data.garages)
end)

RegisterNetEvent('zmain:garage:create', function(name, label, type, defaultpos, deletepos, spawnpos, headingspawnpos, activeblip)
    local source = source

    MySQL.Async.execute('INSERT INTO garages (name, label, type, defaultpos, deletepos, spawnpos, headingspawnpos, activeblip) VALUES (@name, @label, @type, @defaultpos, @deletepos, @spawnpos, @headingspawnpos, @activeblip)', {
        ['@name'] = name,
        ['@label'] = label,
        ['@defaultpos'] = json.encode(defaultpos),
        ['@deletepos'] = json.encode(deletepos),
        ['@spawnpos'] = json.encode(spawnpos),
        ['@headingspawnpos'] = headingspawnpos,
        ['@activeblip'] = activeblip,
        ['@type'] = type,
    }, function()
        Garages:load()
        Garages:refresh()
    end)
end)

RegisterNetEvent('zmain:garage:edit', function(id, Table)
    local source = source

    MySQL.Async.execute('UPDATE garages SET name = @name, label = @label, defaultpos = @defaultpos, deletepos = @deletepos, spawnpos = @spawnpos, headingspawnpos = @headingspawnpos, activeblip = @activeblip WHERE id = @id', {['@id'] = id, ['@name'] = Table.name, ['@label'] = Table.label, ['@defaultpos'] = json.encode(Table.defaultpos), ['@deletepos'] = json.encode(Table.deletepos), ['@spawnpos'] = json.encode(Table.spawnpos), ['@headingspawnpos'] = Table.headingspawnpos, ['@activeblip'] = Table.activeblip}, function()
        Garages.garage_data.garages[id] = {
            id = id,
            name = Table.name,
            label = Table.label,
            type = Table.type,

            defaultpos = Table.defaultpos,
            deletepos = Table.deletepos,
            spawnpos = Table.spawnpos,
            headingspawnpos = Table.headingspawnpos,
            activeblip = Table.activeblip
        }
        Wait(100)
        Garages:refresh()
    end)
end)

RegisterNetEvent('zmain:garages:edit:blips', function(value, id)
    TriggerClientEvent('zmain:garages:edit:blips', -1, value, id)
end)

ESX.RegisterServerCallback('zmain:garage:myvehicle', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    Garages.my_garage.VehiclesList[xPlayer.UniqueID] = {}

    TriggerClientEvent('esx:showNotification', source, 'Récupération des vos véhicules en cours...')

    Wait(400)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = xPlayer.getUniqueID() }, function(result)
        for k,v in pairs(result) do
            table.insert(Garages.my_garage.VehiclesList[xPlayer.UniqueID], v)
            Garages.fuels[v.plate] = v.fuel
        end
        cb(Garages.my_garage.VehiclesList[xPlayer.UniqueID])
    end)
end)

ESX.RegisterServerCallback('zmain:garage:myvehicle_group', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    Garages.my_garage.VehiclesGroupList[xPlayer.getJob2().name] = {}

    TriggerClientEvent('esx:showNotification', source, 'Récupération des vos véhicules en cours...')

    Wait(400)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = xPlayer.getJob2().name}, function(result)
        for k,v in pairs(result) do
            table.insert(Garages.my_garage.VehiclesGroupList[xPlayer.getJob2().name], v)
            Garages.fuels[v.plate] = v.fuel
        end
        cb(Garages.my_garage.VehiclesGroupList[xPlayer.getJob2().name])
    end)
end)

ESX.RegisterServerCallback('zmain:garage:myvehicle_entreprise', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    Garages.my_garage.VehiclesEntrepriseList[xPlayer.getJob().name] = {}

    TriggerClientEvent('esx:showNotification', source, 'Récupération des vos véhicules en cours...')

    Wait(400)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = xPlayer.getJob().name}, function(result)
        for k,v in pairs(result) do
            table.insert(Garages.my_garage.VehiclesEntrepriseList[xPlayer.getJob().name], v)
            Garages.fuels[v.plate] = v.fuel
        end
        cb(Garages.my_garage.VehiclesEntrepriseList[xPlayer.getJob().name])
    end)
end)

ESX.RegisterServerCallback("zmain:garage:getType", function(source, cb, plate, properties)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', { ['@plate'] = plate }, function(result)
        if result[1] == nil then cb(false) return end
        if tonumber(result[1].owner) == xPlayer.getUniqueID() or result[1].owner == xPlayer.getJob().name or result[1].owner == xPlayer.getJob2().name then
            for k,v in pairs(result) do
                if v.type == 'car' then
                    cb('car')
                elseif v.type == 'boat' then
                    cb('boat')
                elseif v.type == 'aircraft' then
                    cb( 'aircraft')
                end
            end
        else
            cb(false)
        end
    end)
end)

RegisterNetEvent('zmain:garages:my_vehicles:setmygroup', function(plate, job)
    local source = source

    MySQL.Async.execute('UPDATE owned_vehicles SET owner = @owner WHERE plate = @plate', {
        ['@plate'] = plate,
        ['@owner'] = job
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Votre véhicule a bien été attribué à votre group illégal')
    end)
end)

RegisterNetEvent('zmain:garages:my_vehicles:setmyentreprise', function(plate, job)
    local source = source

    MySQL.Async.execute('UPDATE owned_vehicles SET owner = @owner WHERE plate = @plate', {
        ['@plate'] = plate,
        ['@owner'] = job
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Votre véhicule a bien été attribué à votre entreprise')
    end)
end)

RegisterNetEvent('zmain:garage:state', function(plate, value, type, id, properties)
    if properties ~= false then
        if value then
            MySQL.Async.execute('UPDATE owned_vehicles SET state = @state, garageid = @garageid, propertiesID = @propertiesID, vehicle = @vehicle WHERE plate = @plate', {
                ['@state'] = value,
                ['@plate'] = plate,
                ['@garageid'] = id,
                ['@propertiesID'] = 0,
                ['@vehicle'] = json.encode(properties)
            })
        else
            MySQL.Async.execute('UPDATE owned_vehicles SET state = @state, garageid = @garageid, propertiesID = @propertiesID, vehicle = @vehicle WHERE plate = @plate', {
                ['@state'] = value,
                ['@plate'] = plate,
                ['@garageid'] = id,
                ['@propertiesID'] = 0,
                ['@vehicle'] = json.encode(properties)
            })
        end
    else
        if value then
            MySQL.Async.execute('UPDATE owned_vehicles SET state = @state, garageid = @garageid, propertiesID = @propertiesID WHERE plate = @plate', {
                ['@state'] = value,
                ['@plate'] = plate,
                ['@garageid'] = id,
                ['@propertiesID'] = 0,
            })
        else
            MySQL.Async.execute('UPDATE owned_vehicles SET state = @state, garageid = @garageid, propertiesID = @propertiesID WHERE plate = @plate', {
                ['@state'] = value,
                ['@plate'] = plate,
                ['@garageid'] = id,
                ['@propertiesID'] = 0,
            })
        end
    end
end)

ESX.RegisterServerCallback('zmain:garage:paidPound', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('cash').money >= 500 then
        xPlayer.removeAccountMoney('cash', 500)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez payer la fourrière ~g~500$~s~')
        cb(true)
    elseif xPlayer.getAccount('bank').money >= 500 then
        xPlayer.removeAccountMoney('bank', 500)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez payer la fourrière ~g~500$~s~')
        cb(true)
    else
        cb(false)
        return TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez d\'argent sur vous ou en bank~s~')
    end
end)

RegisterNetEvent('zmain:garage:delete', function(id)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE garageid = @garageid', {['@garageid'] = id}, function(result)
        for k,v in pairs(result) do
            MySQL.Async.execute('UPDATE owned_vehicles SET garageid = @garageid WHERE plate = @plate', {['@garageid'] = 1, ['@plate'] = v.plate}, function()
            end)
        end
    end)
    MySQL.Async.execute('DELETE FROM garages WHERE id = @id', { ['@id'] = id }, function()
        Garages.garage_data.garages[id] = nil
        Wait(100)
        Garages:refresh()
    end)
end)

ESX.RegisterServerCallback('zmain:garage:getInfoPlayer', function(source, cb, uniqueid)
    if source == nil and cb == nil and uniqueid == nil then goto continue end
    local source = source
    local UniqueIdInfo = {}

    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', { ['@UniqueID'] = uniqueid}, function(rs)
        if rs[1] == nil then return TriggerClientEvent('esx:showNotification', source, ('Aucun joueurs portant l\'uniqueID %s n\'a pue être trouvé'):format(uniqueid)) end

        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = uniqueid }, function(result)
            if result[1] == nil then return TriggerClientEvent('esx:showNotification', source, ('Aucun joueurs portant l\'uniqueID %s n\'a pue être trouvé'):format(uniqueid)) end

            for i,p in pairs(result) do
                p.ownerName = rs[1].playerName or '**Invalid**'
                table.insert(UniqueIdInfo, p)
            end

            cb(UniqueIdInfo)
        end)
    end)

    ::continue::
end)

ESX.RegisterServerCallback('zmain:garage:getInfoEntreprise', function(source, cb, uniqueid)
    local source = source
    local UniqueIdInfo = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', { ['@owner'] = uniqueid }, function(result)
        for i,p in pairs(result) do
            table.insert(UniqueIdInfo, p)
        end

        cb(UniqueIdInfo)
    end)
end)

RegisterNetEvent('zmain:garages:renamemy_vehicle', function(plate, newName)
    local source = source

    MySQL.Async.execute('UPDATE owned_vehicles SET label = @label WHERE plate = @plate', {
        ['@plate'] = plate,
        ['@label'] = newName
    }, function()
        TriggerClientEvent('esx:showNotification', source, '✔️ Véhicule renommer avec succès')
    end)
end)

RegisterNetEvent('zmain:garages:attribuevehiculetosociety', function(plate, label, type, vehicleProps, s)
    local source = source
    
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, state, plate, vehicle, label, type, job, garageid, boutique) VALUES (@owner, @state, @plate, @vehicle, @label, @type, @job, @garageid, @boutique)', {
        ['@owner'] = s,
        ['@state'] = 1,
        ['@plate']  = plate,
        ['@vehicle'] = json.encode(vehicleProps),
        ['@label'] = label,
        ['@type'] = type,
        ['@job'] = 'unemployed',
        ['@garageid'] = type == 'car' and 1 or type == 'boat' and  3 or type == 'aircraft' and 2,
        ['@boutique'] = 0,
    }, function()
        TriggerClientEvent('esx:showNotification', source, ('✔️ Véhicule attribué à ~p~%s~s~ avec succès'):format(s))
    end) 
end)

RegisterNetEvent('zmain:garages:delVeh', function(plate)
    local source = source
    MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function()
        ESX.Notifi(source, 'Véhicule supprimé avec succès')
    end)
end)

RegisterNetEvent('zmain:garages:setVehicleFuel', function(plate, fuel)
    MySQL.Async.execute('UPDATE owned_vehicles SET fuel = @fuel WHERE plate = @plate', {
        ['@plate'] = plate,
        ['@fuel'] = fuel
    })
end)