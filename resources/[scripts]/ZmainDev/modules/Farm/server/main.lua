RegisterNetEvent('zmain:farm:farm', function(item, type)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end

    local count = 0

    if type == 'recolte' then
        if (xPlayer) then
            count = math.random(1, 3)
            xPlayer.addInventoryItem(Config_Farm.Items[item][type].name, count)
    
            TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~ %s'):format(count, Config_Farm.Items[item][type].label))
        end
    elseif type == 'traitement' then
        if (xPlayer) then
            if xPlayer.getInventoryItem(Config_Farm.Items[item]['recolte'].name).count < 3 then return TriggerClientEvent('esx:showNotification', source, ('⚠️ Vous ne possédez pas asser de ~y~%s~s~ pour traiter'):format(item)) end

            xPlayer.removeInventoryItem(Config_Farm.Items[item]['recolte'].name, 3)
            xPlayer.addInventoryItem(Config_Farm.Items[item][type].name, 1)

            TriggerClientEvent('esx:showNotification', source, ('🌿 ~y~x%s~s~ %s'):format(1, Config_Farm.Items[item][type].label))
        end
    end
end)

RegisterNetEvent('zmain:farm:sell', function(count, itemName, price, itemLabel)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.getInventoryItem(itemName).count < count then
        return
    end

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    xPlayer.removeInventoryItem(itemName, count)

    local pricePlayer =  price/100*80
    local totalPlayer = pricePlayer*count

    local priceSociety = price/100*20
    local totalSociety = priceSociety*count

    xPlayer.addAccountMoney('bank', totalPlayer)
    society.addSocietyMoney(totalSociety)

    ESX.Notifi(source, ('Vous avez vendu ~y~x%s~s~ %s\nVotre société a gagnée ~b~%s$~s~\nVous avez gagné ~g~%s$~s~'):format(count, itemLabel, totalSociety, totalPlayer))
end)