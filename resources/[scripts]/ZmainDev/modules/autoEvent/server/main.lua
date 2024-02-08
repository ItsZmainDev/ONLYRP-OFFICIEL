CreateThread(function()
    while true do
        Wait(7200000)

        local autoEvent_DATA = Config.AutoEvent.Position[math.random(1, #Config.AutoEvent.Position)]
        local data = {
            position = autoEvent_DATA.pos,
            reward = autoEvent_DATA.reward
        }
        TriggerClientEvent('esx:showNotification', -1, '🚚 Un fourgon blindé vient de tomber en panne ! Viens vite le casser et récupérer l\'argent avant que la police le sécurise')
        TriggerClientEvent('zmain:autoEvent:start', -1, data)
    end
end)

RegisterNetEvent('zmain:autoEvent:broke', function(data)
    TriggerClientEvent('esx:showNotification', -1, '🚚 Fourgon Blindé\nLe véhicule vient d\'être détruit !')
    TriggerClientEvent('zmain:autoEvent:broke', -1, data)
end)

RegisterNetEvent('zmain:autoEvent:secondBroke', function(data)
    local source = source
    TriggerClientEvent('zmain:autoEvent:secondBroke', source, data)
end)

RegisterNetEvent('zmain:autoEvent:take', function(obj, k, money)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addAccountMoney('black_money', tonumber(money))
    TriggerClientEvent('esx:showNotification', source, ('💲 ~y~+%s$~s~ d\'argent sale'):format(money))
    TriggerClientEvent('zmain:autoEvent:take', -1, obj, k)
end)

RegisterNetEvent('zmain:autoEvent:stop', function(position)
    TriggerClientEvent('zmain:autoEvent:stop', -1, position)

    TriggerClientEvent('esx:showNotification', -1, '🚚 L\'événement ~y~casse de fourgon blindé~s~ vient de se terminer !')
end)