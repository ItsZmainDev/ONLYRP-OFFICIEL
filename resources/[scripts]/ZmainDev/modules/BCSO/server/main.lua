ESX.RegisterServerCallback('zmain:bcso:search', function(source, cb, player)
    local targetPlayer = ESX.GetPlayerFromId(player)

    if targetPlayer then
        local data = {}
        data[player] = {
            inventory = targetPlayer.inventory,
            loadout = targetPlayer.loadout,
            cash = targetPlayer.getAccount('cash').money,
            black_money = targetPlayer.getAccount('black_money').money,
            id = targetPlayer.source
        }
        cb(data[player])

        TriggerClientEvent('esx:showNotification', targetPlayer.source, '👮 La bcso vous fouille')
    else
        cb(false)
    end
end)

RegisterNetEvent('zmain:bcso:menotter', function(target)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent('zmain:bcso:menotter', targetPlayer.source)
end)

RegisterNetEvent('zmain:bcso:plainte:register', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('INSERT INTO bcso_plainte (name, date, numberphone, reason, author) VALUES (@name, @date, @numberphone, @reason, @author)', {
        ['@name'] = data.name, 
        ['@date'] = data.date,
        ['@numberphone'] = data.numberphone, 
        ['@reason'] = data.reason,
        ['@author'] = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname),
    }, function()
        TriggerClientEvent('esx:showNotification', source, '📝 Plainte enregistrée avec succès')
    end)
end)

ESX.RegisterServerCallback('zmain:bcso:plainte:get', function(source, cb)
    local plaintes = {}

    MySQL.Async.fetchAll('SELECT * FROM bcso_plainte', {}, function(result)
        for k,v in pairs(result) do
            table.insert(plaintes, v)
        end

        cb(plaintes)
    end)
end)

RegisterNetEvent('zmain:bcso:plainte:delete', function(id)
    local source = source
    MySQL.Async.execute('DELETE FROM bcso_plainte WHERE id = @id', {
        ['@id'] = id
    }, function()
        ESX.Notifi(source, 'Plainte supprimée avec succès')
    end)
end)

RegisterNetEvent('zmain:bcso:plainte:editReason', function(id, newReason)
    local source = source
    MySQL.Async.execute('UPDATE bcso_plainte SET reason = @reason WHERE id = @id', {
        ['@id'] = id,
        ['@reason'] = newReason
    }, function()
        ESX.Notifi(source, 'La raison de la plainte a bien était modifiée')
    end)
end)

RegisterNetEvent('zmain:bcso:escoter', function(target)
    local source = source
    TriggerClientEvent('zmain:bcso:escoter', target, source)
end)

RegisterNetEvent('zmain:bcso:playerVehicle', function(target, vehicle, value)
    TriggerClientEvent('zmain:bcso:playerVehicle', target, vehicle, value)
end)

ESX.RegisterServerCallback('zmain:bcso:vehicle:searchPlate', function(source, cb, plate)
    local vehicle = {}
    vehicle[plate] = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] == nil then
            vehicle[plate] = {
                plate = plate,
                owner = 'Inconnu'
            }
            cb(vehicle[plate])
            return
        end
        for k,v in pairs(result) do
            MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = v.owner
            }, function(reuslt2)
                vehicle[plate] = {
                    plate = plate,
                    owner = ('%s %s'):format(reuslt2[1].firstname, reuslt2[1].lastname)
                }
                cb(vehicle[plate])
            end)
        end
    end)
end)

RegisterNetEvent('zmain:bcso:service', function(value)
    local source = source
    local players = ESX.GetExtendedPlayers('job', 'bcso')

    for k,v in pairs(players) do
        if value == true then
            TriggerClientEvent('esx:showNotification', v.source, ('L\'agent ~y~%s~s~ vient de prendre son service ~o~BCSO'):format(GetPlayerName(source)))
        else
            TriggerClientEvent('esx:showNotification', v.source, ('L\'agent ~y~%s~s~ vient de finir son service ~o~BCSO'):format(GetPlayerName(source)))
        end
    end
end)

RegisterNetEvent('zmain:bcso:giveweapon', function(name)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon(name, 255)
end)

RegisterNetEvent('zmain:bcso:renforts', function(coords, value)
    local players = ESX.GetExtendedPlayers('job', 'bcso')
    for k,v in pairs(players) do
        TriggerClientEvent('zmain:bcso:renforts', v.source, coords, value)
    end
end)

RegisterNetEvent('zmain:bcso:removeItem', function(count, name, player, label)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local m = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(name, count)
    m.addInventoryItem(name, count)

    TriggerClientEvent('esx:showNotification', player, ('La bcso vous a saisis ~r~x%s~s~ %s'):format(count, label))
end)

RegisterNetEvent('zmain:bcso:removeWeapon', function(name, player, label)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local m = ESX.GetPlayerFromId(source)

    xPlayer.removeWeapon(name)
    m.addWeapon(name)

    TriggerClientEvent('esx:showNotification', player, ('La bcso vous a saisis ~r~x%s~s~ %s'):format(1, label))
end)

RegisterNetEvent('zmain:bcso:removeMoney', function(count, player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local m = ESX.GetPlayerFromId(source)

    xPlayer.removeAccountMoney('black_money', count)
    m.addAccountMoney('black_money', count)

    TriggerClientEvent('esx:showNotification', player, ('La bcso vous a saisis ~r~x%s~s~ %s'):format(count, 'd\'argent sale'))
end)

RegisterNetEvent('zmain:bcso:ppa', function(player)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(player)

    if targetPlayer.getAccount('bank') < 25000 then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'a a pas les sous néccéssaires') end

    targetPlayer.removeAccountMoney('bank', 25000)

    local society = Society:getSociety('bcso')

    if not society then return end

    society.addSocietyMoney(25000)
end)

RegisterNetEvent('zmain:bcso:sendCode', function(message)
    local players = ESX.GetExtendedPlayers('job', 'bcso')

    for k,v in pairs(players) do
        TriggerClientEvent('esx:showNotification', v.source, ('~y~Code BCSO~s~\n%s'):format(message))

        TriggerClientEvent('zmain:bcso:sendCode', v.source)
    end
end)