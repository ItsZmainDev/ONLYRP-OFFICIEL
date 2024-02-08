-- RegisterNetEvent('zmain:jobs:updateSocietyStatus', function(newVal)
--     local source = source
--     local xPlayer = ESX.GetPlayerFromId(source)

--     if (xPlayer) then
--         TriggerClientEvent('zmain:jobs:updateSocietyStatus', -1, xPlayer.job.name, newVal)

--         if newVal then
--             TriggerClientEvent('esx:showNotification', -1, ('💼 L\'entreprise %s est désormé ~g~Ouvert~s~ !'):format(xPlayer.job.label))
--         else
--             TriggerClientEvent('esx:showNotification', -1, ('💼 L\'entreprise %s est désormé ~r~Fermé~s~ !'):format(xPlayer.job.label))
--         end
--     end
-- end)

-- ESX.RegisterServerCallback('zmain:getSocietyState', function(source, cb)
--     local source = source
--     local society = {}

--     MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(result)
--         for k,v in pairs(result) do
--             society[v.name] = {
--                 label = v.label,
--                 state = false
--             }
--         end

--         cb(society)
--     end)
-- end)