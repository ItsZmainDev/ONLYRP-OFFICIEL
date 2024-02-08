local inventory = {
    RegisteredVehicle = {},

    Blacklisted = {},

    count = {},
}

ESX.RegisterServerCallback('zmain:vehicles:openInventory', function(source, cb, plate, class)
    if not inventory.count[plate] then
        inventory.count[plate] = 0
    end
    TriggerClientEvent('esx:showNotification', source, 'Récupération des informations en cours...')

    if inventory.RegisteredVehicle[plate] then
        
        TriggerClientEvent('recieveInformationVehicleInventory', -1, plate, inventory.RegisteredVehicle[plate])

        return
    end

    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result == nil then
            print('result nil')
            inventory.Blacklisted[plate] = true

            inventory.RegisteredVehicle[plate] = {
                ['items'] = {},
                ['weapons'] = {},
                ['accounts'] = {
                    cash = 0,
                    black_money = 0
                },
                vehiclePound = Config.VehicleInventory.Limit.GTA[class],
                pound = 0
            }
            inventory.RegisteredVehicle[plate].pound = 0
            inventory.RegisteredVehicle[plate].vehiclePound = Config.VehicleInventory.Limit.GTA[class]
            inventory.count[plate] = 0
            MySQL.Async.execute('UPDATE owned_vehicles SET inventory = @inventory WHERE plate = @plate', {
                ['@plate'] = plate,
                ['@inventory'] = json.encode(inventory.RegisteredVehicle[plate])
            }, function()
                ESX.toConsole(('Vehicle inventory update (%s)'):format(plate))
            end)

            TriggerClientEvent('recieveInformationVehicleInventory', -1, plate, inventory.RegisteredVehicle[plate])

            return
        end
        if result == nil or json.encode(result) == '[]' then
            inventory.RegisteredVehicle[plate] = {
                ['items'] = {},
                ['weapons'] = {},
                ['accounts'] = {
                    cash = 0,
                    black_money = 0
                },
                vehiclePound = Config.VehicleInventory.Limit.GTA[class],
                pound = 0
            }
            inventory.count[plate] = 0

            TriggerClientEvent('recieveInformationVehicleInventory', -1, plate, inventory.RegisteredVehicle[plate])
        else
            if result[1].inventory == nil or not result[1].inventory or json.decode(result[1].inventory) == nil or json.encode(result[1].inventory) == '[]' then
                print('result inventory nil')
                inventory.RegisteredVehicle[plate] = {
                    ['items'] = {},
                    ['weapons'] = {},
                    ['accounts'] = {
                        cash = 0,
                        black_money = 0
                    },
                    vehiclePound = Config.VehicleInventory.Limit.GTA[class],
                    pound = 0
                }
                inventory.RegisteredVehicle[plate].pound = 0
                inventory.RegisteredVehicle[plate].vehiclePound = Config.VehicleInventory.Limit.GTA[class]
                inventory.count[plate] = 0
                MySQL.Async.execute('UPDATE owned_vehicles SET inventory = @inventory WHERE plate = @plate', {
                    ['@plate'] = plate,
                    ['@inventory'] = json.encode(inventory.RegisteredVehicle[plate])
                }, function()
                    ESX.toConsole(('Vehicle inventory update (%s)'):format(plate))
                end)

                TriggerClientEvent('recieveInformationVehicleInventory', -1, plate, inventory.RegisteredVehicle[plate])
            else
                print('OK')
                if inventory.RegisteredVehicle[plate] ~= nil then
                    TriggerClientEvent('recieveInformationVehicleInventory', -1, plate, inventory.RegisteredVehicle[plate])
                else
                    inventory.RegisteredVehicle[plate] = json.decode(result[1].inventory)
                    inventory.RegisteredVehicle[plate].pound = 0
                    inventory.RegisteredVehicle[plate].vehiclePound = Config.VehicleInventory.Limit.GTA[class]
                    for k,v in pairs(inventory.RegisteredVehicle[plate]['items']) do
                        if ESX.GetItem(v.name).weight ~= -1 then
                            inventory.RegisteredVehicle[plate].pound = inventory.RegisteredVehicle[plate].pound + (ESX.GetItem(v.name).weight * v.count)
                        end
                    end
                    for k,v in pairs(inventory.RegisteredVehicle[plate]['weapons']) do
                        inventory.count[plate] += 1
                    end

                    TriggerClientEvent('recieveInformationVehicleInventory', -1, plate, inventory.RegisteredVehicle[plate])
                end
            end
        end
    end)
end)

function inventory:save(plate, inv)
    if not plate then return end

    inventory.RegisteredVehicle[plate].pound = 0

    for k,v in pairs(inventory.RegisteredVehicle[plate]['items']) do
        if ESX.GetItem(v.name).weight ~= -1 then
            inventory.RegisteredVehicle[plate].pound = inventory.RegisteredVehicle[plate].pound + (ESX.GetItem(v.name).weight * v.count)
        end
    end

    if inventory.Blacklisted[plate] then TriggerClientEvent('recieveInformationVehicleInventory', -1, plate, inv) return end

    MySQL.Async.execute('UPDATE owned_vehicles SET inventory = @inventory WHERE plate = @plate', {
        ['@plate'] = plate,
        ['@inventory'] = json.encode(inv)
    }, function()
        TriggerClientEvent('recieveInformationVehicleInventory', -1, plate, inv)

        ESX.toConsole(('Vehicle inventory update (%s)'):format(plate))
    end)
end

RegisterNetEvent('zmain:vehicles:inventory:depositItem', function(plate, itemData, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end
    
    if not inventory.RegisteredVehicle[plate] then return end

    inventory.RegisteredVehicle[plate].pound = 0

    for k,v in pairs(inventory.RegisteredVehicle[plate]['items']) do
        if ESX.GetItem(v.name).weight ~= -1 then
            inventory.RegisteredVehicle[plate].pound = inventory.RegisteredVehicle[plate].pound + (ESX.GetItem(v.name).weight * v.count)
        end
    end

    inventory.RegisteredVehicle[plate].pound = inventory.RegisteredVehicle[plate].pound + ESX.GetItem(itemData.name).weight * count

    if inventory.RegisteredVehicle[plate].pound > inventory.RegisteredVehicle[plate].vehiclePound then return ESX.Notifi(source, 'Il n\'y a pas asser de place dans le véhicule') end

    inventory.RegisteredVehicle[plate].pound = 0

    for k,v in pairs(inventory.RegisteredVehicle[plate]['items']) do
        if ESX.GetItem(v.name).weight ~= -1 then
            inventory.RegisteredVehicle[plate].pound = inventory.RegisteredVehicle[plate].pound + (ESX.GetItem(v.name).weight * v.count)
        end
    end

    if not inventory.RegisteredVehicle[plate]['items'][itemData.name] then
        inventory.RegisteredVehicle[plate]['items'][itemData.name] = {
            name = itemData.name,
            label = itemData.label,
            count = count,
        }
    else
        inventory.RegisteredVehicle[plate]['items'][itemData.name].count += count
    end

    if inventory.RegisteredVehicle[plate].pound >= inventory.RegisteredVehicle[plate].vehiclePound then 
        if inventory.RegisteredVehicle[plate]['items'][itemData.name].count > 0 then
            inventory.RegisteredVehicle[plate]['items'][itemData.name].count -= count
        else
            inventory.RegisteredVehicle[plate]['items'][itemData.name] = nil
        end

        return ESX.Notifi(source, 'Il n\'y a pas asser de place dans le véhicule')
    end


    xPlayer.removeInventoryItem(itemData.name, count)
    
    inventory:save(plate, inventory.RegisteredVehicle[plate])

    ESX.Notifi(source, ('Vous avez déposé ~y~x%s %s~s~ dans le coffre du véhicule'):format(count, itemData.label))
end)

RegisterNetEvent('zmain:vehicles:inventory:removeItem', function(plate, itemData, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not inventory.RegisteredVehicle[plate] then return end
    if not inventory.RegisteredVehicle[plate]['items'][itemData.name] then return ESX.Notifi(source, 'Cet item n\'est plus dans le coffre') end

    inventory.RegisteredVehicle[plate]['items'][itemData.name].count -= count

    if inventory.RegisteredVehicle[plate]['items'][itemData.name].count <= 0 then
        inventory.RegisteredVehicle[plate]['items'][itemData.name] = nil
    end

    xPlayer.addInventoryItem(itemData.name, count)
    
    inventory:save(plate, inventory.RegisteredVehicle[plate])

    ESX.Notifi(source, ('Vous avez pris ~y~x%s %s~s~ dans le coffre du véhicule'):format(count, itemData.label))
end)

RegisterNetEvent('zmain:vehicles:inventory:addWeapon', function(plate, weaponData)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not inventory.RegisteredVehicle[plate] then return end

    if inventory.count[plate] then
        inventory.count[plate] += 1
    end

    inventory.RegisteredVehicle[plate]['weapons'][weaponData.name..inventory.count[plate]] = {
        number = inventory.count[plate],
        name = weaponData.name,
        label = weaponData.label,
        ammo = weaponData.ammo
    }

    xPlayer.removeWeapon(weaponData.name)

    inventory:save(plate, inventory.RegisteredVehicle[plate])

    ESX.Notifi(source, ('Vous avez déposé ~y~x%s %s~s~ dans le coffre du véhicule'):format(1, weaponData.label))
end)

RegisterNetEvent('zmain:vehicles:inventory:removeWeapon', function(plate, weaponData, weaponId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not inventory.RegisteredVehicle[plate] then return end
    if not inventory.RegisteredVehicle[plate]['weapons'][weaponId] then return ESX.Notifi(source, 'Cet arme n\'est plus dans le coffre') end

    inventory.RegisteredVehicle[plate]['weapons'][weaponId] = nil

    inventory:save(plate, inventory.RegisteredVehicle[plate])

    ESX.Notifi(source, ('Vous avez pris ~y~x%s %s~s~ dans le coffre du véhicule'):format(1, weaponData.label))

    xPlayer.addWeapon(weaponData.name, weaponData.ammo)
end)

RegisterNetEvent('zmain:vehicles:inventory:actionsMoney', function(plate, action, type, money, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not inventory.RegisteredVehicle[plate] then return end

    local playerMoney = xPlayer.getAccount(type).money

    local labelData = {
        ['cash'] = 'D\'argent Prope',
        ['black_money'] = 'D\'argent Sale'
    }

    if action == 'remove' then
        if inventory.RegisteredVehicle[plate]['accounts'][type] < count then return ESX.Notifi(source, 'Il n\'y en a pas asser dans le coffre') end

        inventory.RegisteredVehicle[plate]['accounts'][type] -= count

        xPlayer.addAccountMoney(type, count)

        ESX.Notifi(source, ('Vous avez pris ~y~x%s %s~s~ dans le coffre du véhicule'):format(count, labelData[type]))
    elseif action == 'deposit' then
        if playerMoney < count then return ESX.Notifi(source, 'Vous n\'avez pas asser d\'argent') end

        inventory.RegisteredVehicle[plate]['accounts'][type] += count

        xPlayer.removeAccountMoney(type, count)

        ESX.Notifi(source, ('Vous avez déposé ~y~x%s %s~s~ dans le coffre du véhicule'):format(count, labelData[type]))
    end

    inventory:save(plate, inventory.RegisteredVehicle[plate])
end)