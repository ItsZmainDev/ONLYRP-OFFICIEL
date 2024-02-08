banList = {}

CreateThread(function()
    MySQL.Async.fetchAll('SELECT * FROM zban', {}, function(r)
        for k,v in pairs(r) do
            banList[v.identifier] = {
                uniqueid = v.uniqueid,
                identifier = v.identifier,
                time = tonumber(v.time),
                perm = v.perm,
                reason = v.reason, 
            }

            print(('^3Load^0 du ban de l\'uniqueid ^3%s^0'):format(v.uniqueid))
        end
    end)
end)

RegisterCommand('ban', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
    if tonumber(source) ~= 0 then
        if not adminManagement.Service[xPlayer.UniqueID] then return TriggerClientEvent('esx:showNotification', source, 'Vous n\'êtes pas en service') end
        if not Config.Staff.HavePermission('COMMANDS', 'BAN', xPlayer) then return end
    end

	if args[1] == nil then return end
	if args[2] == nil then return end
	if args[3] == nil then return end

    TriggerEvent('zmain:admin:banSystem:ban', args[1], args[2], table.concat(args, " ", 3))

    local target;
    local targetLicense;
    local retturn = false;

    if json.encode(adminManagement.Players) == '[]' then
        MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = tonumber(args[1])
        }, function(r)
            if source == 0 then
                if r[1] == nil then retturn = true return print('Aucun joueur ne corréspond avec l\'UniqueID entré') end
            else
                if r[1] == nil then retturn = true return TriggerClientEvent('esx:showNotification', source, 'Aucun joueur ne corréspond avec l\'UniqueID entré') end
            end

            targetLicense = r[1].identifier
        end)
    else
        for _,p in pairs(adminManagement.Players) do
            if p.UniqueID == tonumber(args[1]) then
                target = p.id
            else
                MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
                    ['@UniqueID'] = tonumber(args[1])
                }, function(r)
                    if source == 0 then
                        if r[1] == nil then retturn = true return print('Aucun joueur ne corréspond avec l\'UniqueID entré') end
                    else
                        if r[1] == nil then retturn = true return TriggerClientEvent('esx:showNotification', source, 'Aucun joueur ne corréspond avec l\'UniqueID entré') end
                    end
    
                    targetLicense = r[1].identifier
                end)
            end
        end
    end

    Wait(1000)

    if not retturn then
        local targetPlayer = ESX.GetPlayerFromId(target)

        if targetPlayer then
            if banList[targetPlayer.identifier] ~= nil then
                if tonumber(source)~= 0 then
                    return TriggerClientEvent('esx:showNotification', source, 'Le joueur est déja ban')
                else
                    return print('Le joueur est déja ban')
                end
            end
        else
            if banList[targetLicense] ~= nil then
            if tonumber(source)~= 0 then
                return TriggerClientEvent('esx:showNotification', source, 'Le joueur est déja ban')
            else
                return print('Le joueur est déja ban')
            end
        end

        end
    
        local banReason;
    
        if tonumber(args[2]) == 0 then 
            banReason = ('Vous avez été ban permanant pour'):format(args[2])
        else
            banReason = ('Vous avez été ban %s heure(s) pour'):format(args[2])
        end
    
        if targetPlayer then
            DropPlayer(targetPlayer.source, banReason..' '..table.concat(args, ' ', 3))
        end
    
        local player = targetPlayer ~= nil and targetPlayer.identifier or targetLicense
    
        MySQL.Async.execute('INSERT INTO zban (uniqueid, identifier, time, perm, reason) VALUE (@uniqueid, @identifier, @time, @perm, @reason)', {
            ['@uniqueid'] = args[1],
            ['@identifier'] = player,
            ['@time'] = tonumber(args[2]),
            ['@perm'] = tonumber(args[2]) == 0 and true or false,
            ['@reason'] = table.concat(args, ' ', 3)
        })
    
        banList[player] = {
            uniqueid = args[1],
            identifier = player,
            time = tonumber(args[2]),
            perm = tonumber(args[2]) == 0 and true or false,
            reason = table.concat(args, ' ', 3), 
        }
    end
end)

RegisterNetEvent('zmain:admin:banSystem:banWithAnticheat', function(UniqueID, reason)
    Wait(2000)
    local targetLicense;
    local banReason; 

    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    UniqueID = UniqueID

    local player = ReturnPlayerId(UniqueID)

    targetLicense = player.identifier

    banReason = ('🛡️LZ_Anticheat🛡️ Vous avez été bannni permanant pour'):format(reason)

    MySQL.Async.execute('INSERT INTO zban (uniqueid, identifier, time, perm, reason) VALUE (@uniqueid, @identifier, @time, @perm, @reason)', {
        ['@uniqueid'] = tonumber(UniqueID),
        ['@identifier'] = targetLicense,
        ['@time'] = 0,
        ['@perm'] = true,
        ['@reason'] = tostring(reason)
    }, function()
        DropPlayer(ReturnPlayerId(UniqueID).id, banReason..' '..reason)
    end)

    banList[targetLicense] = {
        uniqueid = UniqueID,
        identifier = identifier,
        time = tonumber(time),
        perm = true,
        reason = tostring(reason), 
    }
end)

RegisterNetEvent('zmain:admin:banSystem:ban', function(UniqueID, reason)
    if UniqueID == nil or reason == nil then return end

    local target = {}
    target[UniqueID] = {}


    local player = ReturnPlayerId(UniqueID)

    if player then
        -- DropPlayer(player.id, )
    end
end)

RegisterCommand('unban', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if tonumber(source) ~= 0 then
        if not adminManagement.Service[xPlayer.UniqueID] then return TriggerClientEvent('esx:showNotification', source, 'Vous n\'êtes pas en service') end
        if not Config.Staff.HavePermission('COMMANDS', 'UNBAN', xPlayer) then return end
    end

    if args[1] == nil then return end

    local targetLicense;

    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = tonumber(args[1])
    }, function(r)
        if r[1] == nil then
            if source == 0 then
                return print('Aucun joueur ne corréspond avec l\'UniqueID entré')
            else
                return TriggerClientEvent('esx:showNotification', source, 'Aucun joueur ne corréspond avec l\'UniqueID entré')
            end
        end

        if banList[r[1].identifier] == nil then
            if source == 0 then
                return print('Aucun joueur n\'est ban avec l\'UniqueID entré')
            else
                return TriggerClientEvent('esx:showNotification', source, 'Aucun joueur n\'est ban avec l\'UniqueID entré')
            end
        else
            MySQL.Async.execute('DELETE FROM zban WHERE uniqueid = @uniqueid', {
                ['@uniqueid'] = args[1]
            })

            banList[r[1].identifier] = nil
        end
    end)
end)

local presentCard = {}

presentCard.logoLink = 'https://cdn.discordapp.com/attachments/1085637890228371596/1128679617247576144/ONLY_RP.png'

presentCard.card = {
    ['verif'] = {
        ["type"] = "AdaptiveCard",
        ["minHeight"] = "100px",
        ["body"] = {
            {
            type = "Container",
            items = {
                {
                type = "Image",
                url = presentCard.logoLink,
                size = "medium",
                horizontalAlignment = "center",
                style = "person"
                },
                {
                type = "TextBlock",
                horizontalAlignment = "center",
                text = 'Vérification de vos informations ...'
                }
            }
            }
        },
        ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
        ["version"] = "1.2"
    },
    ['connect'] = {
        ["type"] = "AdaptiveCard",
        ["minHeight"] = "100px",
        ["body"] = {
            {
            type = "Container",
            items = {
                {
                type = "Image",
                url = presentCard.logoLink,
                size = "medium",
                horizontalAlignment = "center",
                style = "person"
                },
                {
                type = "TextBlock",
                horizontalAlignment = "center",
                text = 'Bienvenue sur 🌴 Only\'RP'
                }
            }
            }
        },
        ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
        ["version"] = "1.2"
    },
    ['ban'] = {}
}

AddEventHandler('playerConnecting', function(a,b,c)
    if GetPlayerName(source) == 'Antonio Ferrera' then
        c.defer()

            c.presentCard( {
                ["type"] = "AdaptiveCard",
                ["minHeight"] = "100px",
                ["body"] = {
                    {
                    type = "Container",
                    items = {
                        {
                        type = "Image",
                        url = 'https://cdn.discordapp.com/attachments/1085637890228371596/1128679617247576144/ONLY_RP.png',
                        size = "medium",
                        horizontalAlignment = "center",
                        style = "person"
                        },
                        {
                        type = "TextBlock",
                        horizontalAlignment = "center",
                        text = '🌴 Only\'RP\nRelance votre client sous un nouveau nom)'
                        }
                    }
                    }
                },
                ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                ["version"] = "1.2"
            })
    end
    ESX.toConsole(GetPlayerName(source)..' se connecte au serveur')
    local license = ''
    for fo, fp in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(fp, 1, string.len("license:")) == "license:" then
            license = fp
        end
    end

    c.presentCard(presentCard.card['verif'])

    Wait(3000)

    if Maintenance.Active then
        if not Maintenance.Staff[license] then
            c.defer()

            c.presentCard( {
                ["type"] = "AdaptiveCard",
                ["minHeight"] = "100px",
                ["body"] = {
                    {
                    type = "Container",
                    items = {
                        {
                        type = "Image",
                        url = 'https://cdn.discordapp.com/attachments/1085637890228371596/1128679617247576144/ONLY_RP.png',
                        size = "medium",
                        horizontalAlignment = "center",
                        style = "person"
                        },
                        {
                        type = "TextBlock",
                        horizontalAlignment = "center",
                        text = '🌴 Only\'RP\nLe serveur est en maintenance revenez plus tard'
                        }
                    }
                    }
                },
                ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
                ["version"] = "1.2"
            })

            return
        end
    end

    if banList[license] ~= nil then
        local reason;

        if banList[license].perm then
            reason = ('Vous êtes banni permanent de notre serveur !\n\nRaison: %s'):format(banList[license].reason)
        else
            reason = ('Vous êtes banni de notre serveur !\n\nRaison: %s\nTemps restant: %s heure(s)'):format(banList[license].reason, banList[license].time)
        end

        presentCard.card['ban'] = {
            ["type"] = "AdaptiveCard",
            ["minHeight"] = "100px",
            ["body"] = {
                {
                type = "Container",
                items = {
                    {
                    type = "Image",
                    url = presentCard.logoLink,
                    size = "medium",
                    horizontalAlignment = "center",
                    style = "person"
                    },
                    {
                    type = "TextBlock",
                    horizontalAlignment = "center",
                    text = reason
                    }
                }
                }
            },
            ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
            ["version"] = "1.2"
        }
        
        c.defer()
        c.presentCard(presentCard.card['ban'])
    else
        c.presentCard(presentCard.card['connect'])

        Wait(1000)

        c.done()
    end
end)

CreateThread(function()
    while true do 
        Wait(3600000)
        MySQL.Async.fetchAll('SELECT * FROM zban', {}, function(r)
            for k,v in pairs(r) do
                if v.perm == 1 or v.perm == true then goto continue end

                if banList[v.identifier].time >= 1 then
                    MySQL.Async.execute('UPDATE zban SET time = @time WHERE uniqueid = @uniqueid', {
                        ['@uniqueid'] = v.uniqueid,
                        ['@time'] = v.time - 1
                    }, function()
                        banList[v.identifier].time = v.time - 1
                    end)
                end

                if tonumber(v.time) <= 0 then
                    MySQL.Async.execute('DELETE FROM zban WHERE uniqueid = @uniqueid', {
                        ['@uniqueid'] = v.uniqueid,
                    })

                    banList[v.identifier] = nil
                end

                print(('^3Bansystem^0 update du temps de l\'uniqueid ^3%s^0'):format(v.uniqueid))

                ::continue::
            end
        end)

        for k,v in pairs(VIP.players) do

            if v.time > 1 then
                VIP.players[k].time -= 1

                MySQL.Async.execute('UPDATE vips SET time = @time WHERE UniqueID = @UniqueID', {
                    ['@UniqueID'] = VIP.players[k].UniqueID,
                    ['@time'] = VIP.players[k].time
                }, function()
                    
                end)
            else
                MySQL.Async.execute('DELETE FROM vips WHERE UniqueID = @UniqueID', {
                    ['@UniqueID'] = v.UniqueID
                }, function()
                    VIP.players[k] = nil
                end)
            end

            local player = ReturnPlayerId(VIP.players[k].UniqueID)

            if player then
                if VIP.players[k] then
                    VIP.data[player.UniqueID] = VIP.players[k]
                    TriggerClientEvent('zmain:vip:refreshData', player.id, VIP.data[player.UniqueID])
                else
                    VIP.data[xPlayer.UniqueID] ={
                        UniqueID = xPlayer.UniqueID,
                        have = false,
                        time = 0,
                    }
                    TriggerClientEvent('esx:showNotification', player.id, 'Information VIP\n\nVotre ~b~VIP~s~ vien de prendre fin')
                end
            end
        end
    end
end)