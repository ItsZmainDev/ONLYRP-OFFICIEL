RegisterNetEvent('zmain:drugs:drugs', function(item, type)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end

    local count = 0

    if type == 'recolte' then
        if (xPlayer) then
            count = math.random(1, 3)
            xPlayer.addInventoryItem(Config.Drugs.Items[item][type].name, count)
    
            TriggerClientEvent('esx:showNotification', source, ('🌿 Vous avez récolté ~y~+%s~s~ %s'):format(count, Config.Drugs.Items[item][type].label))
        end
    elseif type == 'traitement' then
        if (xPlayer) then
            if xPlayer.getInventoryItem(Config.Drugs.Items[item]['recolte'].name).count < 3 then return TriggerClientEvent('esx:showNotification', source, ('⚠️ Vous ne possédez pas assez de ~y~%s~s~ pour traiter'):format(item)) end

            xPlayer.removeInventoryItem(Config.Drugs.Items[item]['recolte'].name, 3)
            xPlayer.addInventoryItem(Config.Drugs.Items[item][type].name, 1)

            TriggerClientEvent('esx:showNotification', source, ('🌿 ~y~x%s~s~ %s'):format(1, Config.Drugs.Items[item][type].label))
        end
    end
end)

RegisterNetEvent('zmain:drugs:addTable', function(table)
    Config.Drugs.Items = table
end)