VIP = {
    players = {},
    data = {}
}

function VIP.haveVip(UniqueID)
    return VIP.data[UniqueID].have
end

exports('haveVip', function(UniqueID)
    return VIP.haveVip(UniqueID).have
end)

Citizen.CreateThread(function()
    MySQL.Async.fetchAll('SELECT * FROM vips', {}, function(result)
        for k,v in pairs(result) do
            VIP.players[v.UniqueID] = {
                UniqueID = v.UniqueID,
                have = true,
                time = v.time,
                money = v.money
            }
        end

        -- while true do
        --     Wait(3600000)
        --     for k,v in pairs(VIP.players) do

        --         if v.time > 1 then
        --             VIP.players[k].time -= 1

        --             MySQL.Async.execute('UPDATE vips SET time = @time WHERE UniqueID = @UniqueID', {
        --                 ['@UniqueID'] = VIP.players[k].UniqueID,
        --                 ['@time'] = VIP.players[k].time
        --             }, function()
                        
        --             end)
        --         else
        --             MySQL.Async.execute('DELETE FROM vips WHERE UniqueID = @UniqueID', {
        --                 ['@UniqueID'] = v.UniqueID
        --             }, function()
        --                 VIP.players[k] = nil
        --             end)
        --         end

        --         local player = ReturnPlayerId(VIP.players[k].UniqueID)

        --         if player then
        --             if VIP.players[k] then
        --                 VIP.data[player.UniqueID] = VIP.players[k]
        --                 TriggerClientEvent('zmain:vip:refreshData', player.id, VIP.data[player.UniqueID])
        --             else
        --                 VIP.data[xPlayer.UniqueID] ={
        --                     UniqueID = xPlayer.UniqueID,
        --                     have = false,
        --                     time = 0,
        --                 }
        --                 TriggerClientEvent('esx:showNotification', player.id, 'Information VIP\n\nVotre ~b~VIP~s~ vien de prendre fin')
        --             end
        --         end
        --     end
        -- end
    end)

    CreateThread(function()
        while true do
            Wait(1800000)

            for k,v in pairs(VIP.players) do
                local player = {}
                player[k] = ReturnPlayerId(v.UniqueID)

                if player[k] then
                    local xPlayer = ESX.GetPlayerFromId(player[k].id)

                    if xPlayer then
                        xPlayer.addAccountMoney('bank', 5000)

                        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Information VIP\n\nVous avez reçus ~b~5 000$~s~ sur votre compte en banque')
                    end
                end
            end
        end
    end)
end)

AddEventHandler('esx:playerLoaded', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not VIP.players[xPlayer.UniqueID] then
        VIP.data[xPlayer.UniqueID] = {
            UniqueID = xPlayer.UniqueID,
            have = false,
            time = 0,
            money = false,
        }
    else
        VIP.data[xPlayer.UniqueID] = VIP.players[xPlayer.UniqueID]
        TriggerClientEvent('zmain:vip:refreshData', source, VIP.data[xPlayer.UniqueID])
    end
end)

AddEventHandler('zmain:admin:restart', function()
    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if not VIP.players[xPlayer.UniqueID] then
        VIP.data[xPlayer.UniqueID] = {
            UniqueID = xPlayer.UniqueID,
            have = false,
            time = 0,
            money = false,
        }
    else
        VIP.data[xPlayer.UniqueID] = VIP.players[xPlayer.UniqueID]
        TriggerClientEvent('zmain:vip:refreshData', source, VIP.data[xPlayer.UniqueID])
    end
end)

RegisterNetEvent('zmain:vip:recieveMoney', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute('UPDATE vips SET money = @money WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = xPlayer.UniqueID,
        ['@money'] = 1
    }, function()
        VIP.players[xPlayer.UniqueID].money = 1
        VIP.data[xPlayer.UniqueID] = VIP.players[xPlayer.UniqueID]
        TriggerClientEvent('zmain:vip:refreshData', source, VIP.data[xPlayer.UniqueID])
        xPlayer.addAccountMoney('cash', 200000)
    end)
end)

RegisterCommand('addVip', function(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if source ~= 0 then
        if not Config.Staff.HavePermission('VIP', 'ADD', xPlayer) then return end
    end

    args[1] = tonumber(args[1])
    args[2] = tonumber(args[2])

    if args[1] == nil then return end
    if args[2] == nil then return end

    if not VIP.players[args[1]] then 
        
        VIP.players[args[1]] = {
            UniqueID = args[1],
            have = true,
            time = args[2]
        }

        MySQL.Async.execute('INSERT INTO vips (UniqueID, time, money) VALUES (@UniqueID, @time, @money)', {
            ['@UniqueID'] = args[1],
            ['@time'] = args[2],
            ['@money'] = false
        }, function()
            
        end)

        local player = ReturnPlayerId(args[1])

        if player then
            VIP.data[player.UniqueID] = VIP.players[args[1]]

            TriggerClientEvent('zmain:vip:refreshData', player.id, VIP.data[player.UniqueID])
        else

        end
    else
        if source ~= 0 then
            return ESX.Notifi('Le joueur possède déjà le ~b~VIP~s~')
        else
            return print('Le joueur possède déjà le VIP')
        end
    end
end)

RegisterCommand('removeVIP', function(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if source ~= 0 then
        if not Config.Staff.HavePermission('VIP', 'REMOVE', xPlayer) then return end
    end

    args[1] = tonumber(args[1])

    if args[1] == nil then return end

    if not VIP.players[args[1]] then return end

    VIP.players[args[1]] = nil

    MySQL.Async.execute('DELETE FROM vips WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = args[1]
    }, function()
        local player = ReturnPlayerId(args[1])

        if player then
            VIP.data[player.UniqueID] = {
                UniqueiD = args[1],
                have = fallse,
                time = 0
            }

            TriggerClientEvent('zmain:vip:refreshData', player.id, VIP.data[player.UniqueID])

            TriggerClientEvent('esx:showNotification', player.id, 'Information VIP\n\nVotre ~b~VIP~s~ vien de prendre fin')
        end
    end)
end)

RegisterCommand('addVipTime', function(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if source ~= 0 then
        if not Config.Staff.HavePermission('VIP', 'ADD', xPlayer) then return end
    end

    args[1] = tonumber(args[1])
    args[2] = tonumber(args[2])

    if args[1] == nil then return end
    if args[2] == nil then return end

    if not VIP.players[args[1]] then return end

    MySQL.Async.execute('UPDATE vips SET time = @time WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = args[1],
        ['@time'] = VIP.players[args[1]].time + args[2]
    }, function()
        VIP.players[args[1]].time += args[2]

        local player = ReturnPlayerId(args[1])

        if player then
            TriggerClientEvent('zmain:vip:refreshData', player.id, VIP.data[player.UniqueID])
        end
    end)
end)

RegisterNetEvent('zmain:vip:animals:setName', function(entityID, name)
    TriggerClientEvent('zmain:animals:setName', -1, entityID, name)
end)

RegisterNetEvent('zmain:vip:animals:editName', function(entityID, newName)
    TriggerClientEvent('zmain:vip:animals:editName', -1, entityID, newName)
end)

RegisterNetEvent('zmain:vip:animals:removeName', function(entityID)
    TriggerClientEvent('zmain:vip:animals:removeName', -1, entityID)
end)

RegisterNetEvent('zmain:entits:setCoords', function(ped, coords)
    TriggerClientEvent('zmain:en:sertcoords', -1, ped, coords)
end)

RegisterNetEvent('zmain:ips:animals:createPed', function(coords, entityName)
    local source = source

    TriggerClientEvent('zmain:vip:animals:sort', source, coords, entityName)
end)