ZGEG = nil

TriggerEvent('esx:getSharedObject', function(obj) ZGEG = obj end)

RegisterNetEvent('shop:checkoutShop', function(item, quantity, price, typo, label)
    local source = source
    local xPlayer = ZGEG.GetPlayerFromId(source)
    if (xPlayer.getAccount('bank').money < price) then
        return TriggerClientEvent('esx:showNotification', xPlayer.source, '~r~Erreur~s~: Vous n\'avez pas les fonds nécessaires')
    end
    if typo == 'item' then
        if item == 'kevlar' then
            if xPlayer.getInventoryItem(item).count >= 1 then return TriggerClientEvent('esx:showNotification', source, 'Vous ne pouvez pas acheté deux kevlar') end
        end
        TriggerClientEvent('esx:showNotification', xPlayer.source, ('Vous avez acheté pour ~g~%s$~s~ d\'article(s)'):format(price))
        xPlayer.addInventoryItem(item, quantity)
        xPlayer.removeAccountMoney('bank', price)
    elseif typo == 'weapon' then
        TriggerClientEvent('esx:showNotification', xPlayer.source, ('Vous avez acheté pour ~g~%s$~s~ d\'article(s)'):format(price))
        xPlayer.removeAccountMoney('bank', price)
        xPlayer.addWeapon(item, quantity)
    elseif typo == 'props' then
        for i = 1, quantity do
            MySQL.Async.execute('INSERT INTO players_props (UniqueID, data, name) VALUES (@UniqueID, @data, @name)', {
                ['@UniqueID'] = xPlayer.UniqueID,
                ['@data'] = json.encode({label = label, name = item, owner = xPlayer.UniqueID, count = 1}),
                ['@name'] = item
            }, function()
                
            end)
            i = i + 1
        end

        xPlayer.removeAccountMoney('bank', price)
    end
end)