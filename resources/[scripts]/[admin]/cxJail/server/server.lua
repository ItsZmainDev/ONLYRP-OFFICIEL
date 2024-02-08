ESX, JailsData = nil, {}

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

droppedPlayer = function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if JailsData[playerId] then 
        local xTime = JailsData[playerId].time
        SetTimeout(220, function()
            MySQL.Async.fetchAll('SELECT * FROM jails WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier
            }, function(droppedInfos)
                if droppedInfos[1] then 
                    MySQL.Async.execute('UPDATE jails SET time = @time WHERE identifier = @identifier', {
                        ['@identifier'] = xPlayer.identifier,
                        ['@time'] = xTime
                    })
                end
            end)
        end)
        JailsData[playerId] = nil 
        SetTimeout(450, function()
            resetTableForStaff()
        end)
    end
end

AddEventHandler('playerDropped', function(reason)
    droppedPlayer(source)
end)

RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source, xPlayer)
	local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    JailsData[_src] = {}
    SetTimeout(220, function()
        MySQL.Async.fetchAll('SELECT * FROM jails WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        }, function(connectingInfos)
            if connectingInfos[1] then 
                for k,v in pairs(connectingInfos) do 
                    JailsData[_src].time = v.time 
                    JailsData[_src].staffName = v.staffName 
                end
                TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nVous vous êtes reconnecté en étant jail."):format(Jails.Settings.ServerName))
                MySQL.Async.execute('UPDATE jails SET playerId = @playerId WHERE identifier = @identifier', {
                    ['@identifier'] = xPlayer.identifier,
                    ['@playerId'] = _src
                })
                TriggerClientEvent("cxJail:jailPlayer", _src, JailsData[_src].time, JailsData[_src].staffName)
            end
        end)
    end)
    Wait(500)
    resetTableForStaff()
end)

RegisterServerEvent('cxJail:setNormalBucket')
AddEventHandler('cxJail:setNormalBucket', function()
    SetPlayerRoutingBucket(source, 0)
end)

RegisterServerEvent('cxJail:setBucket')
AddEventHandler('cxJail:setBucket', function()
    local bucketId = source
    SetPlayerRoutingBucket(source, bucketId)
end)

RegisterServerEvent('cxJail:updateTime')
AddEventHandler('cxJail:updateTime', function(time)
    JailsData[source].time = time
end)

isValidGroup = function(group)
    return group ~= "user"
end

resetTableForStaff = function()
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do 
        local players = ESX.GetPlayerFromId(xPlayers[i])
        if players.getGroup() ~= "user" then 
            MySQL.Async.fetchAll('SELECT * FROM jails', {}, function(receiveInfos)
                TriggerClientEvent("cxJail:receiveInfos", xPlayers[i], receiveInfos)
            end)
        end
    end
end

RegisterServerEvent("cxJail:unjailTarget")
AddEventHandler("cxJail:unjailTarget", function(targetId)
    local _src = source 
    if not targetId then 
        return 
    end
    TriggerClientEvent("cxJail:exitPlayer", targetId)
    TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nVous avez unjail ~b~%s~s~."):format(Jails.Settings.ServerName, GetPlayerName(targetId)))
end)

RegisterServerEvent("cxJail:unjailPlayer")
AddEventHandler("cxJail:unjailPlayer", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer then 
        MySQL.Sync.execute("DELETE FROM jails WHERE identifier = @identifier", {
            ["identifier"] = xPlayer.identifier 
        })
        TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nVous avez été unjail."):format(Jails.Settings.ServerName))
        if Jails.Logs.ActiveLogs then 
            sendWebhook((Jails.Logs.PlayerUnJailMessage):format(GetPlayerName(_src), _src, xPlayer.getIdentifier()))
        end
        SetTimeout(220, function()
            resetTableForStaff()
        end)
    end
end)

RegisterServerEvent("cxJail:getJails")
AddEventHandler("cxJail:getJails", function()
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer.getGroup() == "user" then 
        return TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas les permissions requises.")
    end
    MySQL.Async.fetchAll('SELECT * FROM jails', {}, function(result)
    	TriggerClientEvent("cxJail:openMenu", _src, result)
    end)
end)

RegisterServerEvent("cxJail:sendMessage")
AddEventHandler("cxJail:sendMessage", function(targetPlayer, targetMessage)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer.getGroup() == "user" then 
        return TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas les permissions requises.")
    end
    TriggerClientEvent("esx:showNotification", targetPlayer, ("~b~%s~s~\n%s"):format(Jails.Settings.ServerName, targetMessage))
end)

RegisterCommand("jail", function(source, args)
    if source == 0 and Jails.Settings.EnableConsole == true then 
        local playerId = tonumber(args[1])
        if playerId ~= nil then 
            if GetPlayerPed(playerId) ~= 0 then 
                local playerId = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

                if playerId then
                    playerId = playerId.source
                else
                    return
                end

                local Timer = tonumber(args[2])
                if Timer ~= nil then 
                    local xTarget = ESX.GetPlayerFromId(playerId)
                    MySQL.Async.fetchAll('SELECT * FROM jails WHERE identifier = @identifier', {
                        ['@identifier'] = xTarget.identifier
                    }, function(playerResult)
                        if playerResult[1] then 
                            return print("Le joueur souhaité est déjà en jail.")
                        else
                            JailsData[playerId] = {}
                            MySQL.Async.execute('INSERT INTO jails (playerId, identifier, time, staffName) VALUES (@playerId, @identifier, @time, @staffName)',{
                                ['playerId'] = playerId,
                                ['identifier'] = xTarget.identifier,
                                ['time'] = Timer,
                                ['staffName'] = "Fondateur"
                            })
                            TriggerClientEvent("cxJail:jailPlayer", playerId, Timer, "Fondateur")
                            SetTimeout(220, function()
                                resetTableForStaff()
                            end)
                        end
                    end)  
                else
                    TriggerClientEvent("esx:showNotification", _src, "~r~Le temps de jail n'a pas été indiqué.")
                end
            else
                print("Le joueur souhaité n'est pas connecté.")
            end
        else
            print("~r~Vous devez saisir un id correct.")
        end
    else
        local _src = source 
        local xPlayer = ESX.GetPlayerFromId(_src)
        local xGroup = xPlayer.getGroup()
        if isValidGroup(xGroup) then 
            local playerId = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

            if playerId then
                playerId = playerId.source
            else
                return
            end
            local Timer = tonumber(args[2])
            if playerId ~= nil then 
                if GetPlayerPed(playerId) ~= 0 then 
                    if Timer ~= nil then 
                        local xTarget = ESX.GetPlayerFromId(playerId)
                        MySQL.Async.fetchAll('SELECT * FROM jails WHERE identifier = @identifier', {
                            ['@identifier'] = xTarget.identifier
                        }, function(playerResult)
                            if playerResult[1] then 
                                return TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nLe joueur souhaité est déjà en jail."):format(Jails.Settings.ServerName))
                            else
                                JailsData[playerId] = {}
                                MySQL.Async.execute('INSERT INTO jails (playerId, identifier, time, staffName) VALUES (@playerId, @identifier, @time, @staffName)',{
                                    ['playerId'] = playerId,
                                    ['identifier'] = xTarget.identifier,
                                    ['time'] = Timer,
                                    ['staffName'] = GetPlayerName(_src)
                                })
                                TriggerClientEvent("cxJail:jailPlayer", playerId, Timer, GetPlayerName(_src))
                                if Jails.Logs.ActiveLogs then 
                                    local message = (Jails.Logs.JailMessage):format(GetPlayerName(_src), _src, xPlayer.getIdentifier(), GetPlayerName(playerId), playerId, xTarget.getIdentifier())
                                    sendWebhook(message)
                                end
                                SetTimeout(220, function()
                                    resetTableForStaff()
                                end)
                            end
                        end)  
                    else
                        TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nLe temps de jail n'a pas été indiqué."):format(Jails.Settings.ServerName))
                    end
                else
                    TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nLe joueur souhaité n'est pas connecté."):format(Jails.Settings.ServerName))
                end
            else
                TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nVous devez saisir un id correct."):format(Jails.Settings.ServerName))
            end
        else
            TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas les permissions requises.")
        end
    end
end)

RegisterCommand("unjail", function(source, args)
    if source == 0 and Jails.Settings.EnableConsole == true then 
        local playerId = tonumber(args[1])
        if playerId ~= nil then 
            if GetPlayerPed(playerId) ~= 0 then 
                local xTarget = ESX.GetPlayerFromId(playerId)
                MySQL.Async.fetchAll('SELECT * FROM jails WHERE identifier = @identifier', {
                    ['@identifier'] = xTarget.identifier
                }, function(playerResult)
                    if playerResult[1] then 
                        TriggerClientEvent("cxJail:exitPlayer", playerId)
                        JailsData[playerId] = nil
                        SetTimeout(220, function()
                            resetTableForStaff()
                        end)
                    else
                        return print("Le joueur souhaité n'est pas en jail.")
                    end
                end)  
            else
                print("Le joueur souhaité n'est pas connecté.")
            end
        else
            print("~r~Vous devez saisir un id correct.")
        end
    else
        local _src = source 
        local xPlayer = ESX.GetPlayerFromId(_src)
        local xGroup = xPlayer.getGroup()
        if isValidGroup(xGroup) then 
            local playerId = tonumber(args[1])
            if playerId ~= nil then 
                if GetPlayerPed(playerId) ~= 0 then 
                    local xTarget = ESX.GetPlayerFromId(playerId)
                    MySQL.Async.fetchAll('SELECT * FROM jails WHERE identifier = @identifier', {
                        ['@identifier'] = xTarget.identifier
                    }, function(playerResult)
                        if playerResult[1] then 
                            TriggerClientEvent("cxJail:exitPlayer", playerId)
                            if Jails.Logs.ActiveLogs then 
                                local message = (Jails.Logs.UnJailMessage):format(GetPlayerName(_src), _src, xPlayer.getIdentifier(), GetPlayerName(playerId), playerId, xTarget.getIdentifier())
                                sendWebhook(message)
                            end
                            JailsData[playerId] = nil
                            SetTimeout(220, function()
                                resetTableForStaff()
                            end)
                        else
                            return TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nLe joueur souhaité n'est pas en jail."):format(Jails.Settings.ServerName))
                        end
                    end)  
                else
                    TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nLe joueur souhaité n'est pas connecté."):format(Jails.Settings.ServerName))
                end
            else
                TriggerClientEvent("esx:showNotification", _src, ("~b~%s~s~\nVous devez saisir un id correct."):format(Jails.Settings.ServerName))
            end
        else
            TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas les permissions requises.")
        end
    end
end)