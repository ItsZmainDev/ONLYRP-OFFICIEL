local Leboncoin = {
    Vehicles = {},
    Items = {},
    Weapons = {},

    SellProduct = {
        VehiclesList = {},
        ItemsList = {},
    }
}

function Leboncoin:getSellVehicleList()
    Leboncoin.Vehicle = {}
    MySQL.Async.fetchAll('SELECT * FROM leboncoin', {

    }, function(result)
        for k,v in pairs(result) do
            if v.type == 'vehicle' then
                table.insert(Leboncoin.Vehicles, v)
            end
        end
    end)

    while json.encode(Leboncoin.Vehicles) == '[]' do Wait(1) end

    return Leboncoin.Vehicles
end

ESX.RegisterServerCallback('zmain:leboncoin:getVehicleList', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    Leboncoin.SellProduct.VehiclesList[xPlayer.UniqueID] = {}

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
        ['@owner'] = xPlayer.UniqueID
    }, function(result)
        for i,p in pairs(result) do
            table.insert(Leboncoin.SellProduct.VehiclesList[xPlayer.UniqueID], p)
        end

        cb(Leboncoin.SellProduct.VehiclesList[xPlayer.UniqueID])
    end)
end)

ESX.RegisterServerCallback('zmain:leboncoin:getItemsList', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    Leboncoin.SellProduct.ItemsList[xPlayer.UniqueID] = {}

    MySQL.Async.fetchAll('SELECT * FROM leboncoin', {

    }, function(result)
        for k,v in pairs(result) do
            if v.type == 'item' then
                table.insert(Leboncoin.SellProduct.ItemsList[xPlayer.UniqueID], v)
            end
        end

        cb(Leboncoin.SellProduct.ItemsList[xPlayer.UniqueID])
    end)
end)

RegisterNetEvent('zmain:leboncoin:sendAnnonce:vehicle', function(title, description, prix, data)  
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local vehiclePropertiesUncode = json.decode(data.vehicle)

    MySQL.Async.execute('INSERT INTO leboncoin (title, description, price, type, properties, data, owner) VALUES (@title, @description, @price, @type, @properties, @data, @owner)', {
        ['@title'] = title,
        ['@description'] = description, 
        ['@price'] = prix, 
        ['@type'] = 'vehicle', 
        ['@properties'] = data.vehicle, 
        ['@data'] = vehiclePropertiesUncode.model,
        ['@owner'] = xPlayer.UniqueID
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Véhicule mis en vente avec succès')

        TriggerClientEvent('zmain:leboncoin:addAnnonce', 'vehicle', Leboncoin:getSellVehicleList())
    end)
end)

RegisterNetEvent('zmain:leboncoin:sendAnnonce:item', function(title, description, prix, data, data2)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('INSERT INTO leboncoin (title, description, price, type, properties, data, owner) VALUES (@title, @description, @price, @type, @properties, @data, @owner)', {
        ['@title'] = title,
        ['@description'] = description, 
        ['@price'] = prix, 
        ['@type'] = 'item', 
        ['@properties'] = data.name, 
        ['@data'] = data2.Quantity,
        ['@owner'] = xPlayer.UniqueID
    }, function()
        TriggerClientEvent('esx:showNotification', source, 'Item mis en vente avec succès')
    end)
end)

ESX.RegisterServerCallback('zmain:leboncoin:getSellVehicleList', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    cb(Leboncoin:getSellVehicleList())
end)

RegisterNetEvent('zmain:leboncoin:paid', function(type, v, plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    v.price = tonumber(v.price)

    local playerMoney = xPlayer.getAccount

    if playerMoney('cash').money >= v.price then
        if type == 'vehicle' then
            xPlayer.removeAccountMoney('cash', v.price)

            MySQL.Async.execute('UPDATE owned_vehicles SET owner = @owner WHERE plate = @plate', {
                ['@owner'] = xPlayer.UniqueID,
                ['@plate'] = plate,
            }, function()
                TriggerClientEvent('zmain:leboncoin:removeAnnonce', -1, 'vehicle', v)
                TriggerClientEvent('esx:showNotification', source, 'Véhicule acheté avec succès')
            end)
        end
    elseif playerMoney('bank').money >= v.price then
        if type == 'vehicle' then
            xPlayer.removeAccountMoney('bank', v.price)

            MySQL.Async.execute('UPDATE owned_vehicles SET owner = @owner WHERE plate = @plate', {
                ['@owner'] = xPlayer.UniqueID,
                ['@plate'] = plate
            }, function()
                TriggerClientEvent('zmain:leboncoin:removeAnnonce', -1, 'vehicle', v)
                TriggerClientEvent('esx:showNotification', source, 'Véhicule acheté avec succès')
            end)
        end
    else
        return TriggerClientEvent('esx:showNotification', source, 'Vous ne possedez pas les sous nécessaires')
    end

    MySQL.Async.execute('DELETE FROM leboncoin WHERE id = @id', {
        ['@id'] = v.id
    }, function()
        for k,p in pairs(Leboncoin.Vehicles) do
            if p.id == v.id then
                table.remove(Leboncoin.Vehicles, k)
            end
        end
    end)
end)

RegisterNetEvent('zmain:leboncoin:paidItem', function(v)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    v.price = tonumber(v.price)
    v.data = tonumber(v.data)

    local playerMoney = xPlayer.getAccount

    if playerMoney('cash').money >= v.price then
        xPlayer.removeAccountMoney('cash', v.price)
        xPlayer.addInventoryItem(v.name, v.data)

        TriggerClientEvent('esx:showNotification', source, 'Item acheté avec succès')
    elseif playerMoney('bank').money >= v.price then
        xPlayer.removeAccountMoney('bank', v.price)
        xPlayer.addInventoryItem(v.name, v.data)

        TriggerClientEvent('esx:showNotification', source, 'Item acheté avec succès')
    else
        return TriggerClientEvent('esx:showNotification', source, 'Vous ne possedez pas les sous nécessaires')
    end

    MySQL.Async.execute('DELETE FROM leboncoin WHERE id = @id', {
        ['@id'] = v.id
    }, function()
    end)
end)