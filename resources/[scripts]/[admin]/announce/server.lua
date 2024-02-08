TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterCommand('ann', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getGroup() == 'superadmin' or xPlayer.getGroup() == "admin" then
        local src = source
        local msg = rawCommand:sub(5)
        local args = msg
        if player ~= false then
            local name = GetPlayerName(source)
            local xPlayers  = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], '📡 Annonce serveur', '', ''..msg..'', 'CHAR_MP_FM_CONTACT', 0)
        end
    else
        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Avertisement', '~b~Tu ne' , 'policier pour faire cette commande', 'CHAR_ABIGAIL', 0)
    end
    else
    TriggerClientEvent('esx:showAdvancedNotification', _source, 'Erreur', ' ' , '⚠️ ~y~~h~Tu ne fait pas partie du ~s~~y~~h~Staff~s~ ~n~~y~pour faire cette commande', 'CHAR_BLOCKED', 0)
    end
 end, false)