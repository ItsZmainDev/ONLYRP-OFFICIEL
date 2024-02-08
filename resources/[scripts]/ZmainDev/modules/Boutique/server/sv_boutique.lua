RegisterNetEvent('shopBoutique:vehicule', function(vehicleProps, plate_625, price, label, type)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local authorized = false
    MySQL.Async.fetchAll(("SELECT onlycoins, totalCoins FROM users WHERE UniqueID = %s"):format(xPlayer.UniqueID) , {}, function (result)
        print(price)
        if result[1].onlycoins >= tonumber(price) then
            authorized = true
            newpoint = result[1].onlycoins - price
            newTotal = result[1].totalCoins + price
        end
    end) 
    Wait(50)
    if authorized then
        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, state, plate, vehicle, label, type, job, garageid, boutique) VALUES (@owner, @state, @plate, @vehicle, @label, @type, @job, @garageid, @boutique)', {
            ['@owner']   = xPlayer.UniqueID,
            ['@state'] = 1,
            ['@plate']   = plate_625,
            ['@vehicle'] = json.encode(vehicleProps),
            ['@label'] = label,
            ['@type'] = tostring(type),
            ['@job'] = 'unemployed',
            ['@garageid'] = type == 'car' and 1 or type == 'boat' and  3 or type == 'aircraft' and 2,
            ['boutique'] = 1,
        }, function(rowsChange)
            TriggerClientEvent('esx:showNotification', xPlayer.source, 'véhicule acheté avec succès.')
            MySQL.Async.execute('INSERT INTO boutique_history (uniqueid, data) VALUE (@uniqueid, @data)', {
                ['@uniqueid'] = xPlayer.UniqueID,
                ['@data'] = ('Vous avez acheté %s pour %s coins'):format(label, price)
            }, function()
            sendLog(('Achat véhicule boutique (%s - %s) (%s) (%s)'):format(xPlayer.name, xPlayer.UniqueID, vehicleProps.model.. ' | '..label, price), {
                author = xPlayer.name,
                fields = {
                    {title = 'Joueur', subtitle = xPlayer.name},
                    {title = 'ID Unique', subtitle = xPlayer.UniqueID},
                    {title = 'Identifier', subtitle = xPlayer.identifier},
                    {title = 'Véhicule', subtitle = vehicleProps.model.. ' | '..label},
                    {title = 'Prix', subtitle = price}
                },
                channel = 'vehicle_buy_boutique'
            })
            end)
        end)
            MySQL.Async.execute(("UPDATE users SET onlycoins = '".. newpoint .."' WHERE UniqueID = @UniqueID"), {
                ['@UniqueID'] = xPlayer.UniqueID
            }, function() 
            end)
            MySQL.Async.execute(("UPDATE users SET totalcoins = '".. newTotal .."' WHERE UniqueID = @UniqueID"), {
                ['@UniqueID'] = xPlayer.UniqueID
            }, function() 
        end)
        TriggerClientEvent('boutique:update', source, newpoint, newTotal)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous ne possédez pas les coins nécessaires.')
    end
end)

ESX.RegisterServerCallback('boutique:verifierplaquedispo', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)