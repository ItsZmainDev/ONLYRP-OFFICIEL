RegisterNetEvent('zmain:entreprise:Boss_recruterplayer', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer.getJob().name ~= 'unemployed' then return TriggerClientEvent('esx:showNotification', source, 'La personne est déja dans une entreprise') end

    if targetPlayer then
        targetPlayer.setJob(xPlayer.getJob().name, 0)
    end

    
    TriggerClientEvent('esx:showNotification', source, 'Joueur recruté avec succès')
end)


RegisterNetEvent('zmain:entreprise:Boss_virerplayer', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer.getJob().name ~= xPlayer.getJob().name then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'est pas dans votre entreprise') end

    if targetPlayer then
        targetPlayer.setJob('unemployed', 0)
    end

    
    TriggerClientEvent('esx:showNotification', source, 'Joueur viré avec succès')
end)

RegisterNetEvent('main:entreprise:Boss_promouvoirplayer', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer.getJob().name ~= xPlayer.getJob().name then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'est pas dans votre entreprise') end

    if targetPlayer then
        targetPlayer.setJob(xPlayer.getJob().name, targetPlayer.getJob().grade + 1)
    end

    TriggerClientEvent('esx:showNotification', source, 'Joueur promue avec succès')
end)

RegisterNetEvent('zmain:entreprise:Boss_destituerplayer', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)

    if targetPlayer.getJob().name ~= xPlayer.getJob().name then return TriggerClientEvent('esx:showNotification', source, 'La personne n\'est pas dans votre entreprise') end

    if targetPlayer then
        targetPlayer.setJob(xPlayer.getJob().name, targetPlayer.getJob().grade - 1)
    end

    TriggerClientEvent('esx:showNotification', source, 'Joueur destitué avec succès')
end)

local talbe = {}

RegisterNetEvent('zmain:personalmenu:getpropspropss', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT * FROM players_props WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = xPlayer.UniqueID
    }, function(result)
        table[xPlayer.UniqueID] = {}
        for k,v in pairs(result) do
            v.data = json.decode(v.data)
            if not table[xPlayer.UniqueID][v.data.name] then
                table[xPlayer.UniqueID][v.data.name] = {
                    label = v.data.label,
                    name = v.data.name,
                    owner = v.data.owner,
                    id = v.id,
                    count = 1
                }
            else
                table[xPlayer.UniqueID][v.data.name].count += 1
            end
        end

        TriggerClientEvent('zmain:recieveProps', source, table[xPlayer.UniqueID])
    end)
end)

RegisterNetEvent('zmain:bill:pay', function(v)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.getAccount('bank').money < tonumber(v.amount) then return end

    local society = Society:getSociety(v.target)

    if not society then return end

    sendLog(('Paiment facture société (%s - %s) Data (%s- %s) Type (%s) (Coffre)'):format(xPlayer.name, xPlayer.UniqueID, society.name, society.label, type), {
        author = xPlayer.name,
        fields = {
            {title = 'Joueur', subtitle = xPlayer.name},
            {title = 'ID Unique', subtitle = xPlayer.UniqueID},
            {title = 'Identifier', subtitle = xPlayer.identifier},
            {title = 'Prix de la facture', subtitle = v.amount},
            {title = 'Nouvelle somme dans le coffre', subtitle = ('%s$'):format(society.coffre['accounts']['society'])},
            {title = 'Type', subtitle = 'society'}
        },
        channel = 'society_deposit_money'
    })

    xPlayer.removeAccountMoney('bank', v.amount)
    society.addSocietyMoney(v.amount)

    MySQL.Async.execute('DELETE from billing WHERE id = @id', {
        ['@id'] = v.id
    }, function(rowsChanged)

    end)

    ESX.Notifi(source, ('Vous avez payé une facture d\'un montant de ~y~%s$~s~'):format(v.amount))

    local players = ESX.GetExtendedPlayers('job', society.name)

    for k,v in pairs(players) do
        if Bennys.inService[v.UniqueID] then
            ESX.Notifi(v.source, ('Une nouvelle personne vient de payer une facture d\'un montant de ~y~%s$~s~'):format(v.amount))
        end
    end
end)