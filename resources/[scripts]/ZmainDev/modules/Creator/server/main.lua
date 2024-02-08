RegisterNetEvent("zmain:creator:save:identity", function(ident)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute("UPDATE users SET firstname = @firstname, lastname = @lastname, height = @height, sex = @sex, dateofbirth = @dateofbirth, playerName = @playerName, accounts = @accounts, inventory = @inventory, loadout = @loadout WHERE UniqueID = @UniqueID", {
        ["@UniqueID"] = xPlayer.UniqueID,
        ['@firstname'] = ident.firstname,
        ['@lastname'] = ident.lastname,
        ['@height'] = ident.height,
        ['@sex'] = ident.sex,
        ['@dateofbirth'] = ident.age,
        ['@playerName'] = xPlayer.getName(),
        ['@accounts'] = '[]',
        ['@inventory'] = '[]',
        ['@loadout'] = '[]',
    }, function()
    end)
end)

RegisterNetEvent('creator:finishPersonnage', function(skinn)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    Wait(100)
    ESX.toConsole(('Player %s finished character'):format(GetPlayerName(source)))

    sendLog(('Création de personnage (%s - %s)'):format(xPlayer.name, xPlayer.UniqueID), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
        },
        channel = 'creator_finisCharacter'
    })
    SetPlayerRoutingBucket(source, 0)
end)

TriggerEvent('esx:getSharedObject', function(obj) ZGEG = obj end)

-- RegisterCommand('register', function(source, args)
--     TriggerClientEvent('zmain:createPlayer', source)
-- end)

RegisterNetEvent('zmain:caca:setInstance', function()
    local source = source
    Wait(100)
    SetPlayerRoutingBucket(source, source)
end)

RegisterNetEvent('zmain:caca:sortInstance', function()
    local source = source
    SetPlayerRoutingBucket(source, 0)
end)

RegisterCommand('register', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getGroup() ~= 'fondateur' then return end

    local player = ReturnPlayerId(args[1])

    if player then
        TriggerClientEvent('zmain:createPlayer', player.id)
    else
        TriggerClientEvent('zmain:createPlayer', xPlayer.source)
    end
end)