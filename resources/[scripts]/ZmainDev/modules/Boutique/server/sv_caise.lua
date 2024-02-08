CreateThread(function()
    for k,v in pairs(BoutiqueConfig['Case']) do
        ESX.RegisterUsableItem(k, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeInventoryItem(k, 1)
            TriggerClientEvent('Zmain:OpenCase', source,k)
        end)
    end
end)

RegisterNetEvent('zmain:boutique:sendVehicleWithCase', function(vehicle)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, label, vehicle, plate, type, boutique, garageid) VALUE (@owner, @label, @vehicle, @plate, @type, @boutique, @garageid)', {
        ['@owner'] = xPlayer.UniqueID,
        ['@label'] = vehicle.label,
        ['@vehicle'] = json.encode(vehicle.properties),
        ['@plate'] = vehicle.plate,
        ['@type'] = 'car',
        ['@boutique'] = 1,
        ['@garageid'] = 1
    }, function()
        MySQL.Async.execute('INSERT INTO boutique_history (uniqueid, data) VALUE (@uniqueid, @data)', {
            ['@uniqueid'] = xPlayer.UniqueID,
            ['@data'] = ('%s'):format(vehicle.message)
        }, function()
            
        end)
    end)
end)

RegisterNetEvent('zmain:boutique:case:buy', function(case, price, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local authorized = false
    MySQL.Async.fetchAll(("SELECT onlycoins, totalCoins FROM users WHERE UniqueID = %s"):format(xPlayer.UniqueID) , {}, function (result)
        if result[1].onlycoins >= tonumber(price) then
            authorized = true
            newpoint = result[1].onlycoins - price
            newTotal = result[1].totalCoins + price
        end
    end) 
    Wait(50)

    xPlayer.addInventoryItem(case, count)

    MySQL.Async.execute(("UPDATE users SET onlycoins = '".. newpoint .."' WHERE UniqueID = @UniqueID"), {
        ['@UniqueID'] = xPlayer.UniqueID
    }, function() 
    end)
    MySQL.Async.execute(("UPDATE users SET totalcoins = '".. newTotal .."' WHERE UniqueID = @UniqueID"), {
        ['@UniqueID'] = xPlayer.UniqueID
    }, function() 
        TriggerClientEvent('boutique:update', source, newpoint, newTotal)
    end)
end)