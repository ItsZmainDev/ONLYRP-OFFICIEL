Bennys = {
    inService = {}
}

RegisterNetEvent('zmain:bennys:service', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local players = ESX.GetExtendedPlayers('job', 'mecano')

    if not Bennys.inService[xPlayer.UniqueID] then
        Bennys.inService[xPlayer.UniqueID] = {
            UniqueID = xPlayer.UniqueID,
            service = true,
            name = xPlayer.name
        }

        for k,v in pairs(players) do
            TriggerClientEvent('esx:showNotification', v.source, ('L\'employé ~y~%s~s~ a pris sont service'):format(xPlayer.name))
        end
    else
        Bennys.inService[xPlayer.UniqueID] = nil
        
        for k,v in pairs(players) do
            TriggerClientEvent('esx:showNotification', v.source, ('L\'employé ~y~%s~s~ a finis sont service'):format(xPlayer.name))
        end
    end
end)

-- ESX.RegisterServerCallback('zmain:custom:getVehiclesPrices', function(source, cb)
--     local vehicle = {}

--     MySQL.Async.fetchAll('SELECT * FROM vehicules', {}, function(result)
--         for k,v in pairs(result) do
--             table.insert(vehicle, v)
--         end

--         cb(vehicle)
--     end)
-- end)

RegisterNetEvent('zmain:bennys:repairVehicle', function(plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    sendLog(('Réparation de véhicule bennys (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Plaque du véhicule', subtitle = plate}
        },
        channel = 'bennys_repair_vehicle'
    })
end)