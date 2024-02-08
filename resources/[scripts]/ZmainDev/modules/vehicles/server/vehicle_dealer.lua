local VehicleDealer = {

}

ESX.RegisterServerCallback('zmain:vehicle_dealer:sendCategorieList', function(source, cb, job)
    local vehicle_categorie = {}
    if job == 'motorcycles' then
        MySQL.Async.fetchAll('SELECT * FROM moto_categories', {}, function(result)
            for k,v in pairs(result) do
                table.insert(vehicle_categorie, v)
            end

            cb(vehicle_categorie)
        end)
    elseif job == 'boat' then
        MySQL.Async.fetchAll('SELECT * FROM boat_categories', {}, function(result)
            for k,v in pairs(result) do
                table.insert(vehicle_categorie, v)
            end

            cb(vehicle_categorie)
        end)
    elseif job == 'aircraft' then
        MySQL.Async.fetchAll('SELECT * FROM aircraft_categorie', {}, function(result)
            for k,v in pairs(result) do
                table.insert(vehicle_categorie, v)
            end

            cb(vehicle_categorie)
        end)
    else
        MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(result)
            for k,v in pairs(result) do
                table.insert(vehicle_categorie, v)
            end

            cb(vehicle_categorie)
        end)
    end
end)

ESX.RegisterServerCallback('zmain:vehicle_dealer:sendVehicleWithCategorie', function(source, cb, categorieName)
    local vehicles = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicules WHERE category = @category', {
        ['@category'] = categorieName
    }, function(result)
        for k,v in pairs(result) do
            table.insert(vehicles, v)
        end          
        
        cb(vehicles)
    end)
end)

ESX.RegisterServerCallback('zmain:vehicle_dealer:sendBill', function(source, cb, price, price2, target)
    local source = source
    local targetPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent('zmain:vehicle_dealer:sendBill', targetPlayer.source, source, price2, price)
end)

RegisterNetEvent('zmain:vehicle_dealer_paybill', function(vendeur,price,price2)
    local source = source
    local seller = ESX.GetPlayerFromId(vendeur)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('bank').money < price2/100*135 then TriggerClientEvent('esx:showNotification', xPlayer.source, '💲 Vous n\'avez pas assez ~g~d\'argent~s~ en banque') return TriggerClientEvent('esx:showNotification', vendeur, '💲 La personne n\'a pas assez de sous en banque') end

    local society = Society:getSociety(seller.job.name)

    if not society then return end

    if society.coffre['accounts'].society < price then return TriggerClientEvent('esx:showNotification', seller.source, 'Il n\'y pas assez de sous sur le compte de la société') end

    xPlayer.removeAccountMoney('bank', price2/100*135)
    society.removeSocietyMoney(price)
    society.addSocietyMoney(price2/100*135)

    -- TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..seller.job.name, function(account)
    --     account.removeMoney(price)
    --     account.addMoney(price2)
    -- end)

    TriggerClientEvent('zmain:vehicle_dealer:spawnVehicle', seller.source, source)
end)

RegisterNetEvent('zmain:vehicle_dealer_refuseBill', function(vendeur)
    TriggerClientEvent('esx:showNotification', vendeur, 'La personne a ~r~refusé~s~ la facture')
end)

RegisterNetEvent('zmain:vehicle_dealer:sendVehicleKey', function(player, vehicleData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(player)
    
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, label, vehicle, plate, type, state, boutique, garageid) VALUE (@owner, @label, @vehicle, @plate, @type, @state, @boutique, @garageid)', {
        ['@owner'] = targetPlayer.UniqueID,
        ['@label'] = vehicleData.label,
        ['@vehicle'] = json.encode(vehicleData.vehicle),
        ['@plate'] = vehicleData.plate,
        ['@type'] = vehicleData.type,
        ['@state'] = 0,
        ['@boutique'] = 0,
        ['@garageid'] = 1
    }, function()
        TriggerClientEvent('esx:showNotification', targetPlayer.source, ('Vous avez recus les clés du véhicule avec la plaque [~y~%s~s~]'):format(vehicleData.plate))
        TriggerClientEvent('esx:showNotification', source, ('~r~%s$~s~ on été retiré du compte de la société'):format(vehicleData.price))
    end)
end)

RegisterNetEvent('zmain:vehicle_dealer:moneyBoss', function(society, amount, action)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local society = Society:getSociety(xPlayer.job.name)

    if not society then return end

    if action == 'deposit' then
        if xPlayer.getAccount('bank').money < amount then return TriggerClientEvent('esx:showNotification', source, 'Votre solde banquaire n\'es pas assez élevé') end

        society.addSocietyMoney(amount)
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
        --     if account.money < amount then return TriggerClientEvent('esx:showNotification', source, 'Il n\'y a pas assez de sous dans le coffre') end
        --     account.removeMoney(amount)
        --     xPlayer.addAccountMoney('bank', amount)
    
        --     TriggerClientEvent('esx:showNotification', source, ('Vous avez pris ~y~%s$~s~'):format(amount))
        -- end)
    end
end)