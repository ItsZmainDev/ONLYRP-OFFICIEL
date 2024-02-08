RegisterNetEvent('zmain:supermarket:paidItem', function(data, item, price, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local type = 'cash';

    if data == 'B' or data == 'b' then
        type = 'bank'
    else
        type = 'cash'
    end

    local price = tonumber(price)

    if xPlayer.getAccount(type).money < price then return TriggerClientEvent('esx:showNotification', source, 'Vous ne diposez pas des fonds nécessaire') end

    xPlayer.removeAccountMoney(type, price)
    xPlayer.addInventoryItem(item, count)
end)

RegisterNetEvent('zmain:supermarket:paidWeapon', function(data, item, price, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local type = 'cash'

    if (xPlayer) then
        if data == 'B' or data == 'b' then
            type = 'bank'
        else
            type = 'cash'
        end
    
        local price = tonumber(price)
    
        if xPlayer.getAccount(type).money < price then return TriggerClientEvent('esx:showNotification', source, 'Vous ne diposez pas des fonds nécessaire') end
    
        if item == 'clip' then
            xPlayer.addInventoryItem(item, coun )
            xPlayer.removeAccountMoney(type, price)
        elseif item == 'kevlar' then
            if xPlayer.getInventoryItem(item).count >= 1 then return TriggerClientEvent('esx:showNotification', source, 'Vous ne pouvez pas acheté deux kevlar') end
            xPlayer.addInventoryItem(item, 1)
            xPlayer.removeAccountMoney(type, price)
        else
            xPlayer.addWeapon(item, 255)
            xPlayer.removeAccountMoney(type, price)
        end
    
        local type = 'cash';
    end
end)

ESX.RegisterServerCallback('zmain:getMoney', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('cash').money < 50 then cb(false) else cb (true) xPlayer.removeAccountMoney('bank', 50) end
end)