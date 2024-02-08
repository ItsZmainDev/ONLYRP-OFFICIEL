ESX.RegisterServerCallback('zmain:drugs:sell:getPhone', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return cb(false) end

    if xPlayer.getInventoryItem('phone').count > 0 then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('zmain:drugs:sell:getItem', function(source, cb, drugsName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    print(xPlayer)

    if not xPlayer then return cb(false) end

    if not xPlayer.getInventoryItem(drugsName) then ESX.Notifi(source, ('Vous devez posséder aux minimums ~r~5 pochons de drogue')) cb(false) return end

    if xPlayer.getInventoryItem(drugsName).count >= 5 then
        cb(true)
    else
        ESX.Notifi(source, ('Vous devez posséder aux minimums ~r~5 pochons de drogue'))
        cb(false)
        return
    end
end)


RegisterNetEvent('zmain:drugs:sell', function(drugsName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    if xPlayer.getInventoryItem(drugsName).count < 5 then ESX.Notifi(source, ('Vous devez posséder aux minimums ~r~5 pochons de drogue')) TriggerClientEvent('zmain:drugs:stop', source) return end

    local drugsCount = math.random(Config.Drugs.sell.Drugs[drugsName].min, Config.Drugs.sell.Drugs[drugsName].max)
    local drugsPrice = math.random(Config.Drugs.sell.Drugs[drugsName].minPrice, Config.Drugs.sell.Drugs[drugsName].maxPrice)*drugsCount

    if xPlayer.getInventoryItem(drugsName).count < drugsCount then
        drugsCount = xPlayer.getInventoryItem(drugsName).count
        drugsPrice = math.random(Config.Drugs.sell.Drugs[drugsName].minPrice, Config.Drugs.sell.Drugs[drugsName].maxPrice)*drugsCount
    end

    xPlayer.removeInventoryItem(drugsName, drugsCount)
    xPlayer.addAccountMoney('black_money', drugsPrice)

    ESX.Notifi(source, ('Vous avez vendu ~y~x%s~s~ de ~y~%s~s~ pour ~r~%s$ d\'argent sale~s~'):format(drugsCount, Config.Drugs.sell.Drugs[drugsName].label, drugsPrice))
end)

RegisterNetEvent('zmain:police:drugs:callcop', function(data)
    local players = ESX.GetExtendedPlayers('job', 'police')

    for k,v in pairs(players) do
        TriggerClientEvent('zmain:police:callDrugs', v.source, data)
    end
end)