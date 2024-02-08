RegisterNetEvent('zmain:selling:sellItem', function(price, itemName, count, player)
    print('zmain:selling:sellItem', price, itemName, count, player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(player)

    TriggerClientEvent('zmain:selling:bill', player, price, itemName, count, source)
end)

RegisterNetEvent('zmain:selling:payBill', function(price, itemName, count, vendeur)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local seller = ESX.GetPlayerFromId(vendeur)

    if not xPlayer then return end
    if not seller then return end

    local price = tonumber(price)

    if xPlayer.getAccount('bank').money < price then
        TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas asser d\'argent en banque~s~')
        TriggerClientEvent('esx:showNotifcaton', vendeur, '~r~La personne n\'a pas asser d\'argent en banque~s~')
        return
    end

    xPlayer.removeAccountMoney('bank', price)
    xPlayer.addInventoryItem(itemName, count)

    if not VIP.haveVip(seller.UniqueID) then
        seller.addAccountMoney('bank', price)
    else
        seller.addAccountMoney('bank', price/100*133)
    end

    TriggerClientEvent('esx:showNotification', source, ('Vous avez payé ~y~%s~s~ pour ~y~%s$~s~'):format(count, price))

    TriggerClientEvent('esx:showNotification', vendeur, '~g~La personne a bien payé~s~')
end)

RegisterNetEvent('zmain:sellin:notPayBill', function(vendeur)
    print('zmain:sellin:notPayBill', vendeur)
    local source = source

    TriggerClientEvent('esx:showNotification', source, '~r~Vous avez refusé la facture~s~')
    TriggerClientEvent('esx:showNotification', vendeur, '~r~La personne a refusé la facture~s~')
end)