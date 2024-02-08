CreateThread(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `admin_jails` (
            UniqueID INT(11) PRIMARY KEY,
            time LONGTEXT DEFAULT NULL,
            staff LONGTEXT DEFAULT NULL,
            reason LONGTEXT DEFAULT NULL
        );
    ]])

    MySQL.Async.fetchAll('SELECT * FROM admin_jails', {}, function(result)
        for k,v in pairs(result) do
            adminManagement.jails[v.UniqueID] = v
        end
    end)

    AddEventHandler('esx:playerLoaded', function(source, xPlayer)
        local source = source

        if adminManagement.jails[xPlayer.UniqueID] then
            TriggerClientEvent('zmain:admin:jail:setPlayerInJail', source, xPlayer.UniqueID, adminManagement.jails[xPlayer.UniqueID])
        end
    end)

    RegisterNetEvent('zmain:admin:jail:remove', function(UniqueID, data)
        local source = source
        adminManagement.jails[UniqueID] = nil

        TriggerClientEvent('zmain:admin:jail:remove', source, UniqueID)

        MySQL.Async.execute('DELETE FROM admin_jails WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = tonumber(UniqueID)
        }, function()
            print('REMOVE JAIL')
        end)
    end)

    
    RegisterCommand('jail', function(source, args)
        if source ~= 0 then
            local xPlayer = ESX.GetPlayerFromId(source)

            if not xPlayer then return end
    
            if not Config.Staff.HavePermission('COMMANDS', 'JAIL', xPlayer) then return end

            if not adminManagement.Service[xPlayer.UniqueID] then return end
        end

        if args[1] == nil then return end
        if args[2] == nil then return end
        if args[3] == nil then return end

        if adminManagement.jails[args[1]] then return(
            ESX.Notifi(source, 'Le joueur est déjà en jail')
        ) end

        local player = ReturnPlayerId(args[1])

        if source ~= 0 then
            adminManagement.jails[args[1]] = {
                UniqueID = args[1],
                time = args[2],
                staff = GetPlayerName(source),
                reason = table.concat(args, " ", 3)
            }
        else
            adminManagement.jails[args[1]] = {
                UniqueID = args[1],
                time = args[2],
                staff = 'CONSOLE',
                reason = table.concat(args, " ", 3)
            }
        end

        if source == 0 then
            name = 'Console'
        else
            name = GetPlayerName(source)
        end

        if not player then
            MySQL.Async.execute('INSERT INTO admin_jails (UniqueID, time, staff, reason) VALUES (?,?,?,?)', {
                args[1],
                args[2],
                name,
                table.concat(args, " ", 3)
            })
        else
            MySQL.Async.execute('INSERT INTO admin_jails (UniqueID, time, staff, reason) VALUES (?,?,?,?)', {
                player.UniqueID,
                args[2],
                name,
                table.concat(args, " ", 3)
            }, function()
                TriggerClientEvent('zmain:admin:jail:setPlayerInJail', player.id, player.UniqueID, adminManagement.jails[args[1]])
            end)
        end

        if source ~= 0 then
            ESX.Notifi(source, 'Joueur mit en jail avec succès')
        end
    end)

    RegisterCommand('unjail', function(source, args)
        if source ~= 0 then
            local xPlayer = ESX.GetPlayerFromId(source)

            if not xPlayer then return end
    
            if not Config.Staff.HavePermission('COMMANDS', 'JAIL', xPlayer) then return end

            if not adminManagement.Service[xPlayer.UniqueID] then return end
        end

        if args[1] == nil then return end

        if not adminManagement.jails[args[1]] then return end

        local player = ReturnPlayerId(args[1])

        if player then
            TriggerClientEvent('zmain:admin:jail:remove', player.id, args[1])
        end

        adminManagement.jails[args[1]] = nil

        MySQL.Async.execute('DELETE FROM admin_jails WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = tonumber(args[1])
        }, function()
            print('REMOVE JAIL')
        end)
    end)
end)