Ambulance = {
    Service = {},
    Appelles = {},
    IsDead = {},

    Employeds = {}
}

RegisterNetEvent('zmain:ambulance:service', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    Ambulance.Service[xPlayer.UniqueID] = not Ambulance.Service[xPlayer.UniqueID]

    TriggerClientEvent('zmain:ambulance:service', source, Ambulance.Service[xPlayer.UniqueID])

    if Ambulance.Service[xPlayer.UniqueID] then
        Ambulance.Employeds[xPlayer.UniqueID] = {
            name = xPlayer.name
        }
        TriggerClientEvent('zmain:ambulance:addEmployed', -1, xPlayer.UniqueID, Ambulance.Employeds[xPlayer.UniqueID])

        ESX.toConsole(('%s take his service ems'):format(GetPlayerName(source)))
    else
        Ambulance.Service[xPlayer.UniqueID] = nil
        TriggerClientEvent('zmain:ambulance:removeEmployed', -1, xPlayer.UniqueID)

        ESX.toConsole(('%s finished his service ems'):format(GetPlayerName(source)))
    end
end)


RegisterNetEvent('zmain:ambulance:death', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE users SET is_dead = @i WHERE UniqueID = @u', {['@u'] = xPlayer.UniqueID, ['@i'] = true}, function()

        ESX.toConsole(('%s is dead'):format(xPlayer.name))

    end)

    TriggerClientEvent('zmain:ambulance:death', source)
end)

RegisterNetEvent('zmain:ambulance:call', function(playerCoords)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    print(playerCoords)

    Ambulance.Appelles[xPlayer.UniqueID] = {
        name = xPlayer.name,
        UniqueID = xPlayer.UniqueID,
        position = playerCoords,
        take = false
    }

    local xPlayers = ESX.GetExtendedPlayers('job', 'ambulance')

    for k,v in pairs(xPlayers) do
        TriggerClientEvent('zmain:ambulance:addCall', v.source, xPlayer.UniqueID, Ambulance.Appelles[xPlayer.UniqueID])

        if not Ambulance.Service[v.UniqueID] then goto continue end

        TriggerClientEvent('esx:showNotification', v.source, '📞 Un nouvel appelle a été recus #'..xPlayer.UniqueID)

        ::continue::
    end

    ESX.toConsole(('%s call ems'):format(GetPlayerName(source)))

end)

RegisterNetEvent('zmain:ambulance:takeAppel', function(k)
    local source = source

    Ambulance.Appelles[k].take = true

    local players = ESX.GetExtendedPlayers('job', 'ambulance')

    for i,v in pairs(players) do

       TriggerClientEvent('zmain:ambulance:updateCall', i, k, Ambulance.Appelles[k])

        if not Ambulance.Service[v.UniqueID] then goto continue end

        TriggerClientEvent('esx:showNotification', k, ('📞 %s a pris en charge l\'appel '..i):format(GetPlayerName(source)))

        ::continue::
    end

    TriggerClientEvent('zmain:ambulance:takeMyCall', source, k)

    if not ReturnPlayerId(Ambulance.Appelles[k].UniqueID) then return end

    TriggerClientEvent('esx:showNotification', ReturnPlayerId(Ambulance.Appelles[k].UniqueID).id, '🚑 Un médecin est en route !')

    ESX.toConsole(('%s take call ems #%s'):format(GetPlayerName(source), k))
end)

RegisterNetEvent('zmain:ambulance:closeAppel', function(k)
    local source = source

    if Ambulance.Service[k] ~= nil then
        Ambulance.Appelles[k] = nil
    end

    TriggerClientEvent('zmain:ambulance:removeCall', -1, k)

    local players = ESX.GetExtendedPlayers('job', 'ambulance')

    for k,v in pairs(players) do
        if not Ambulance.Service[v.UniqueID] then goto continue end

        TriggerClientEvent('esx:showNotification', k, ('📞 %s a terminé l\'appel '..k):format(GetPlayerName(source)))

        ESX.toConsole('New call ems')

        ::continue::
    end
end)

RegisterNetEvent('zmain:ambulance:revive', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    local society = Society:getSociety('ambulance')

    if not society then return end

    if (targetPlayer) then
        if xPlayer.getInventoryItem('medikit').count <= 0 then TriggerClientEvent('esx:showNotification', source, 'Vous ne possezdez pas assez de Médikit') ESX.toConsole(('%s has not medikit'):format(GetPlayerName(source))) return end
        targetPlayer.removeAccountMoney('bank', 1000)
        TriggerClientEvent('esx:showNotification', target, '💲 Vous avez été débité de ~y~1000$~s~ sur votre compte banquaire')
        TriggerClientEvent('zmain:ambulance:revive', target)

        xPlayer.addAccountMoney('bank', 500)
        society.addSocietyMoney(500)

        ESX.Notifi(source, 'Le joueur a éé débiter de ~y~1000$~s~\n~y~500$~s~ pour vous\n~y~500$~s~ pour l\'entreprise')

        if Ambulance.Service[xPlayer.UniqueID] ~= nil then
            Ambulance.Appelles[targetPlayer.UniqueID] = nil
        end

        TriggerClientEvent('zmain:ambulance:removeCall', -1, targetPlayer.UniqueID)

        ESX.toConsole(('%s was revived'):format(GetPlayerName(target)))

        xPlayer.removeInventoryItem('medikit', 1)
    else
        ESX.toConsole('Attemp to revive a player')
    end
end)

RegisterNetEvent('zmain:ambulance:heal', function(target, type)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if (targetPlayer) then
        if xPlayer.getInventoryItem('bandage').count <= 0 then ESX.Notifi('Vous ne possezdez pas assez de Bandage') ESX.toConsole(('%s has not bandage'):format(GetPlayerName(source))) return end
        if type == 'p' then
            targetPlayer.removeAccountMoney('bank', 50)
        else
            targetPlayer.removeAccountMoney('bank', 100)
        end
        TriggerClientEvent('zmain:ambulance:heal', target, type)

        ESX.toConsole(('%s was heal'):format(GetPlayerName(target)))

        xPlayer.removeInventoryItem(bandage, 1)
    else
        ESX.toConsole('Attemp to heal a player')
    end
end)

RegisterNetEvent('zmain:ambulance:sql:removedead', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Sync.execute('UPDATE users SET is_dead = @i WHERE UniqueID = @u', {['@u'] = xPlayer.UniqueID, ['@i'] = false}, function()

        ESX.toConsole(('%s is revive'):format(xPlayer.name))

    end)
end)

ESX.RegisterServerCallback('zmain:ambulance:getPlayerDead', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    
    if (xPlayer) then
        MySQL.Async.fetchAll('SELECT is_dead FROM users WHERE UniqueID = @u', {['@u'] = xPlayer.UniqueID}, function(r)
            if r[1].is_dead == 1 or r[1].is_dead == true then cb(true) else cb(false) end

            ESX.toConsole(('%s is dead'):format(xPlayer.name))
        end)
    end
end)

RegisterNetEvent('zmain:ambulance:onPlayerDeath', function()
    local source = source

    TriggerClientEvent('zmain:ambulance:onPlayerDeath', source)
end)

RegisterNetEvent('zmain:ambulance:buyitem', function(item)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.getInventoryItem(item).count >= 10 then return TriggerClientEvent('esx:showNotification', source, 'Vous en possédez trop !') end

        xPlayer.addInventoryItem(item, 1)
    end
end)

RegisterNetEvent('zmain:ambulance:respawn', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeAccountMoney('bank', 750)
    TriggerClientEvent('esx:showNotification', source, '💲 Vous avez été débité de ~y~750$~s~ sur votre compte banquaire')

    MySQL.Sync.execute('UPDATE users SET is_dead = @i WHERE UniqueID = @u', {['@u'] = xPlayer.UniqueID, ['@i'] = false}, function()

        ESX.toConsole(('%s i respawn to hospital'):format(xPlayer.name))

    end)

    TriggerClientEvent('zmain:admin:teleport', source, vec3(-467.2668, -286.6292, 34.91178))

    SetEntityHeading(source, 285.02185058594)
end)

RegisterNetEvent('zmain:ambulance:moneyBoss', function(society, amount, action)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    if action == 'deposit' then
        if xPlayer.getAccount('bank').money < amount then return TriggerClientEvent('esx:showNotification', source, 'Votre solde bancaire n\'est pas assez élevé') end

        society.addMoney(amount)
        xPlayer.removeAccountMoney('bank', amount)

        TriggerClientEvent('esx:showNotification', source, ('Vous avez déposé ~y~%s$~s~'):format(amount))

        -- TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
        --     account.addMoney(amount)
        --     xPlayer.removeAccountMoney('bank', amount)
    
        --     TriggerClientEvent('esx:showNotification', source, ('Vous avez déposez ~y~%s$~s~'):format(amount))
        -- end)
    elseif action == 'remove' then
        society.removeSocietyMoney(amount)
        xPlayer.addAccountMoney('bank', amount)

        TriggerClientEvent('esx:showNotification', source, ('Vous avez pris ~y~%s$~s~'):format(amount))

        -- TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
        --     if account.money < amount then return TriggerClientEvent('esx:showNotification', source, 'Il n\'y a pas assez d\'argent dans le coffre') end
        --     account.removeMoney(amount)
        --     xPlayer.addAccountMoney('bank', amount)
    
        --     TriggerClientEvent('esx:showNotification', source, ('Vous avez pris ~y~%s$~s~'):format(amount))
        -- end)
    end
end)