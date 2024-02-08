RegisterNetEvent('zmain:craft:fond', function(count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        xPlayer.removeInventoryItem('treatedsteel', count)
        xPlayer.addInventoryItem('melted_steel', count)

        TriggerClientEvent(('💴 Vous avez fondue ~y~%s~s~ acier tratié'):format(count))
    end
end)

RegisterNetEvent('zmain:weapons:paid', function(price, acierFondue, filFer, label)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        xPlayer.removeAccountMoney('black_money', price)
        xPlayer.removeInventoryItem('melted_steel', acierFondue)
        xPlayer.removeInventoryItem('wire', filFer)
    end
end)

RegisterNetEvent('zmain:weapons:give', function(weapon)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        xPlayer.addWeapon(weapon, 255)
        TriggerClientEvent('esx:showNotification', source, ('🔫 Vous avez crée ~y~%s~s~'):format(label))
    end
end)

ESX.RegisterServerCallback('zmain:getIem', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem('treatedsteel').count <= 0 and xPlayer.getInventoryItem('soudeuse') then cb(false) else cb(true) end
end)

ESX.RegisterServerCallback('zmain:getItem2', function(source, cb)
    local source = source
    
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem('melted_steel').count <= 0 then cb(false) else cb(true) end
end)

ESX.RegisterServerCallback('zmain:getItem3', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem('wire').count <= 0 then cb(false) else cb(true) end
end)