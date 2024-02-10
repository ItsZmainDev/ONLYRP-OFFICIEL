CreateThread(function()
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    while ESX == nil do Wait(1) end

    local inventory = {
        slots = {}
    }

    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `slots_inventory` (
            `UniqueID` INT(11) PRIMARY KEY,
            slots LONGTEXT DEFAULT NULL
        );
    ]])

    RegisterNetEvent('zmain:inventory:getSlotsItems', function()
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then return end

        inventory.slots[xPlayer.UniqueID] = {}

        MySQL.Async.fetchAll('SELECT * FROM slots_inventory WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = xPlayer.UniqueID,
        }, function(result)
            if json.encode(result) == '[]' then
                MySQL.Async.execute('INSERT INTO slots_inventory (UniqueID, slots) VALUES (?,?)', {
                    xPlayer.UniqueID,
                    json.encode({})
                })
            else
                inventory.slots[xPlayer.UniqueID] = json.decode(result[1].slots)

                TriggerClientEvent('zmain:inventory:sendSlots', source, inventory.slots[xPlayer.UniqueID])
            end
        end)
    end)

    RegisterNetEvent('zmain:inventory:updateSlots', function(slots)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then return end

        inventory.slots[xPlayer.UniqueID] = slots

        MySQL.Async.execute('UPDATE slots_inventory SET slots = @slots WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = xPlayer.UniqueID,
            ['@slots'] = json.encode(inventory.slots[xPlayer.UniqueID])
        }, function()
            inventory.slots[xPlayer.UniqueID] = slots
        end)
    end)

    RegisterNetEvent('zmain:inventory:giveItem', function(count, data, player)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        
        if not xPlayer then return end

        if data.item.type == 'item_standard' then
            if xPlayer.getInventoryItem(data.item.name).count < tonumber(count) then return(TriggerClientEvent('zmain:inventory:notifi', source, ('~r~Vous n\'en possedez pas asser ~s~(~y~%s~s~)~s~'):format(data.item.label))) end
        end

        local xPlayer2 = ESX.GetPlayerFromId(player)

        if not xPlayer2 then return end

        if data.item.type == 'item_standard' then
            xPlayer.removeInventoryItem(data.item.name, count)
            xPlayer2.addInventoryItem(data.item.name, count)
        elseif data.item.type == 'item_weapon' then
            if xPlayer2.hasWeapon(data.item.name) then return end
            BlackListWeaponLSPD = {"WEAPON_NIGHTSTICK", "WEAPON_STUNGUN", "WEAPON_COMBATPISTOL", "WEAPON_BULLPUPSHOTGUN", "WEAPON_FLASHLIGHT", "WEAPON_ASSAULTSMG", "WEAPON_SMG", "WEAPON_CARBINERIFLE", "WEAPON_PUMPSHOTGUN"}
            if BlackListWeaponLSPD[data.item.name] then return end
            xPlayer.removeWeapon(data.item.name)
            xPlayer2.addWeapon(data.item.name)
        elseif data.item.type == 'item_money' then
            if xPlayer.getAccount(data.item.name).money < tonumber(count) then return end
            xPlayer.removeAccountMoney(data.item.name, count)
            xPlayer2.addAccountMoney(data.item.name, count)
        end

        TriggerClientEvent('zmain:inventory:notifi', player, ('Vous avez reçus ~y~x%s~s~ %s'):format(count, data.item.label))
    end)

    RegisterNetEvent('zmain:inventory:removeItem', function(data)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        
        if not xPlayer then return end

        if data.item.type == 'item_standard' then
            xPlayer.removeInventoryItem(data.item.name, data.item.count)
        elseif data.item.type == 'item_weapon' then
            xPlayer.removeWeapon(data.item.name)
        end
    end)
end)