ESX.RegisterServerCallback('zmain:police:search', function(source, cb, player)
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

        TriggerClientEvent('esx:showNotification', targetPlayer.source, '👮 La police vous fouille')
    else
        cb(false)
    end
end)

RegisterNetEvent('zmain:police:menotter', function(target)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent('zmain:police:menotter', targetPlayer.source)
end)

RegisterNetEvent('zmain:police:plainte:register', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('INSERT INTO police_plainte (name, date, numberphone, reason, author) VALUES (@name, @date, @numberphone, @reason, @author)', {
        ['@name'] = data.name, 
        ['@date'] = data.date,
        ['@numberphone'] = data.numberphone, 
        ['@reason'] = data.reason,
        ['@author'] = ('%s %s'):format(xPlayer.firstname, xPlayer.lastname),
    }, function()
        TriggerClientEvent('esx:showNotification', source, '📝 Plainte enregistrée avec succès')
    end)
end)

ESX.RegisterServerCallback('zmain:police:plainte:get', function(source, cb)
    local plaintes = {}

    MySQL.Async.fetchAll('SELECT * FROM police_plainte', {}, function(result)
        for k,v in pairs(result) do
            table.insert(plaintes, v)
        end

        cb(plaintes)
    end)
end)

RegisterNetEvent('zmain:police:plainte:delete', function(id)
    local source = source
    MySQL.Async.execute('DELETE FROM police_plainte WHERE id = @id', {
        ['@id'] = id
    }, function()
        ESX.Notifi(source, 'Plainte supprimée avec succès')
    end)
end)

RegisterNetEvent('zmain:police:plainte:editReason', function(id, newReason)
    local source = source
    MySQL.Async.execute('UPDATE police_plainte SET reason = @reason WHERE id = @id', {
        ['@id'] = id,
        ['@reason'] = newReason
    }, function()
        ESX.Notifi(source, 'La raison de la plainte a bien était modifiée')
    end)
end)

RegisterNetEvent('zmain:police:escoter', function(target)
    local source = source
    TriggerClientEvent('zmain:police:escoter', target, source)
end)

RegisterNetEvent('zmain:police:playerVehicle', function(target, vehicle, value)
    TriggerClientEvent('zmain:police:playerVehicle', target, vehicle, value)
end)

ESX.RegisterServerCallback('zmain:police:vehicle:searchPlate', function(source, cb, plate)
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

local LSPD_SERVICES = {}

RegisterNetEvent('zmain:police:service', function(value)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local players = ESX.GetExtendedPlayers('job', 'police')

    LSPD_SERVICES[xPlayer.UniqueID] = value

    for k,v in pairs(players) do
        if value == true then
            TriggerClientEvent('esx:showNotification', v.source, ('L\'agent ~y~%s~s~ vient de prendre son service ~b~LSPD'):format(GetPlayerName(source)))
        else
            TriggerClientEvent('esx:showNotification', v.source, ('L\'agent ~y~%s~s~ vient de finir son service ~b~LSPD'):format(GetPlayerName(source)))
        end
    end
end)

RegisterNetEvent('zmain:police:giveweapon', function(name)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon(name, 255)
end)

RegisterNetEvent('zmain:police:renforts', function(coords, value)
    local players = ESX.GetExtendedPlayers('job', 'police')
    for k,v in pairs(players) do
        TriggerClientEvent('zmain:police:renforts', v.source, coords, value)
    end
end)

RegisterNetEvent('zmain:police:removeItem', function(count, name, player, label)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local m = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(name, count)
    m.addInventoryItem(name, count)

    TriggerClientEvent('esx:showNotification', player, ('La police vous a saisis ~r~x%s~s~ %s'):format(count, label))
end)

RegisterNetEvent('zmain:police:removeWeapon', function(name, player, label)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local m = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    xPlayer.removeWeapon(name)
    m.addWeapon(name)

    TriggerClientEvent('esx:showNotification', player, ('La police vous a saisis ~r~x%s~s~ %s'):format(1, label))
end)

RegisterNetEvent('zmain:police:removeMoney', function(count, player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local m = ESX.GetPlayerFromId(source)

    xPlayer.removeAccountMoney('black_money', count)
    m.addAccountMoney('black_money', count)

    TriggerClientEvent('esx:showNotification', player, ('La police vous a saisis ~r~x%s~s~ %s'):format(count, 'd\'argent sale'))
end)

RegisterNetEvent('zmain:police:ppa', function(player)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(player)

    if targetPlayer.getAccount('bank').money < 25000 then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'a a pas les sous néccéssaires') end

    targetPlayer.removeAccountMoney('bank', 25000)

    MySQL.Async.execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {
        ['@type'] = 'weapon',
        ['@owner'] = targetPlayer.identifier
    })

    local society = Society:getSociety('police')

    if not society then return end

    society.addSocietyMoney(25000)
end)

RegisterNetEvent('zmain:police:sendCode', function(message)
    local players = ESX.GetExtendedPlayers('job', 'police')

    for k,v in pairs(players) do
        TriggerClientEvent('esx:showNotification', v.source, ('~y~Code LSPD~s~\n%s'):format(message))

        TriggerClientEvent('zmain:police:sendCode', v.source)
    end
end)

ESX.RegisterServerCallback('zmain:police:amendes', function(source, cb, player)
    local xPlayer = ESX.GetPlayerFromId(player)

    if not xPlayer then cb({}) return end

    MySQL.Async.fetchAll('SELECT * FROM billing WHERE target = @target', {
        ['@target'] = 'society_police'
    }, function(result)
        local amendes = {}
        for k,v in pairs(result) do
            table.insert(amendes, v)
        end

        cb(amendes)
    end)
end)

RegisterNetEvent('zmain:police:removeWeapon', function(data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(data) do
        xPlayer.removeWeapon(v.name)
    end

    ESX.Notifi(source, 'Vous avez rendu vos armes de service')
end)