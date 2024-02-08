ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- RegisterCommand('twt', function(source, args, rawCommand)
--     local src = source
-- 	local msg = rawCommand:sub(5)
-- 	local args = msg
--     if player ~= false then
--         local name = GetPlayerName(source)
--         local xPlayers	= ESX.GetPlayers()
--         for i=1, #xPlayers, 1 do
--             local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
-- 			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Twitter', ''..name..'', ''..msg..'', 'CHAR_PLANESITE', 0)
--         end
--     end
-- end, false)

RegisterCommand('fab', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	local args = msg
    if player ~= false then
        local name = GetPlayerName(source)
        local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Facebook', ''..name..'', ''..msg..'', 'CHAR_DAVE', 0)
        end
    end
end, false)

RegisterCommand('amz', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	local args = msg
    if player ~= false then
        local name = GetPlayerName(source)
        local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Amazon', ''..name..'', ''..msg..'', 'CHAR_BEVERLY', 0)
        end
    end
end, false)

RegisterCommand('hac', function(source, args, rawCommand)
    local src = source
    local msg = rawCommand:sub(5)
    local args = msg
    if player ~= false then
        local name = GetPlayerName(source)
        local xPlayers  = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Clown Tease', '', ''..msg..'', 'CHAR_DETONATEPHONE', 0)
        end
    end
end, false)

RegisterCommand('ist', function(source, args, rawCommand)
    local src = source
	local msg = rawCommand:sub(5)
	local args = msg
    if player ~= false then
        local name = GetPlayerName(source)
        local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Instagram', ''..name..'', ''..msg..'', 'CHAR_BARRY', 0)
        end
    end
end, false)

-- RegisterCommand('ano', function(source, args, rawCommand)
--     local src = source
-- 	local msg = rawCommand:sub(5)
-- 	local args = msg
--     if player ~= false then
--         local name = GetPlayerName(source)
--         local xPlayers	= ESX.GetPlayers()
--         for i=1, #xPlayers, 1 do
--             local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
-- 			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Anonyme', '', ''..msg..'', 'CHAR_ARTHUR', 0)
--         end
--     end
-- end, false)


RegisterCommand('lspd', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "police" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetPlayerName(source)
            local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LSPD', '~b~Annonce LSPD', ''..msg..'', 'CHAR_ABIGAIL', 0)
        end
    else
        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~b~Tu n\'est pas' , '~b~policier pour faire cette commande', 'CHAR_ABIGAIL', 0)
    end
    else
    TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~b~Tu n\'est pas' , '~b~policier pour faire cette commande', 'CHAR_ABIGAIL', 0)
    end
 end, false)
 
 RegisterCommand('ems', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "ambulance" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetPlayerName(source)
            local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'EMS', '~b~Annonce EMS', ''..msg..'', 'CHAR_MICHAEL', 0)
        end
    else
        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~b~Tu n\'est pas' , '~b~EMS pour faire cette commande', 'CHAR_MICHAEL', 0)
    end
    else
    TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~b~Tu n\'est pas' , '~b~EMS pour faire cette commande', 'CHAR_MICHAEL', 0)
    end
 end, false)
 
-- Citizen.CreateThread(function()
--     while true do 
--         Wait(600000)
--         TriggerClientEvent('esx:showAdvancedNotification', -1, 'Only\'RP', '~b~Conseils' , '~h~~r~N\'oublie pas de voter pour la ville sur Top-Serveur', 'CHAR_SOCIAL_CLUB', 0)
--     end
-- end)
