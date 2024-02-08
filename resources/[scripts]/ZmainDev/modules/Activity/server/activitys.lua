local ItemFarm = {
    steellingo = 'L\'ingot D\'acier',
    treatedsteel = 'L\'ingot D\'acier Traité'
}

RegisterNetEvent('zmain:activitys:pickUpItem', function(item)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        local total =  math.random( 1, 5 - math.random( 1,3 ))

        xPlayer.addInventoryItem(item, total)

        TriggerClientEvent('esx:showNotification', source, ('📦 ~y~+%s~s~ %s'):format(total, ItemFarm[item]))
    end
end)

RegisterNetEvent('zmain:activitys:traitementItem', function(item, itemt)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.getInventoryItem(item).count < 3 then return TriggerClientEvent('esx:showNotification', source, ('🚨 Vous ne disposez pas de suffisement de %s'):format(ItemFarm[item])) end

        xPlayer.removeInventoryItem(item, 3)

        xPlayer.addInventoryItem(itemt, 1)

        TriggerClientEvent('esx:showNotification', source, ('📦 ~y~+%s~s~ %s'):format(1, ItemFarm[itemt]))
    end
end)

RegisterNetEvent('zmain:activitys:venteItem', function(item)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.getInventoryItem(item).count < 1 then return TriggerClientEvent('esx:showNotification', source, ('🚨 Vous ne disposez pas de suffisement de %s'):format(ItemFarm[item])) end

        local total;
        if not VIP.haveVip(xPlayer.UniqueID) then
            total =  math.random( 80, 130 )
        else
            total =  math.random( 160, 260 )
        end
        
        xPlayer.removeInventoryItem(item, 1)
        xPlayer.addAccountMoney('cash', total)

        TriggerClientEvent('esx:showNotification', source, ('💲 Vous avez vendue ~y~x%s~s~ %s pour %s$'):format(1, ItemFarm[item], total))
    end
end)