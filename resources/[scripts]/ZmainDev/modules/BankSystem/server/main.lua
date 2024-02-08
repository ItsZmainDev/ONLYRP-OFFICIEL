RegisterNetEvent('zmain:bank:deposit', function(count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local playerAccount = xPlayer.getAccount

    if playerAccount('cash').money < count then return ESX.Notifi(source, '💲 Vous ne possedez pas asser ~r~d\'argent~s~ sur vous') end

    xPlayer.removeAccountMoney('cash', count)
    xPlayer.addAccountMoney('bank', count)
    TriggerClientEvent('zmain:bank:updateAccount', source)
    ESX.Notifi(source, ('💲 Vous avez déposé ~g~%s$~s~ sur votre compte en banque'):format(count))
end)

RegisterNetEvent('zmain:bank:remove', function(count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local playerAccount = xPlayer.getAccount

    if playerAccount('bank').money < count then return ESX.Notifi(source, '💲 Vous ne possedez pas asser ~r~d\'argent~s~ sur votre compte en bank') end

    xPlayer.removeAccountMoney('bank', count)
    xPlayer.addAccountMoney('cash', count)
    TriggerClientEvent('zmain:bank:updateAccount', source)
    ESX.Notifi(source, ('💲 Vous avez retiré ~g~%s$~s~ de votre compte en banque'):format(count))
end)

RegisterNetEvent('zmain:bank:iban:send', function(i, q)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local player = ReturnPlayerId(i)

    if not player then return end

    local x = ESX.GetPlayerFromId(player.id)

    if xPlayer.getAccount('bank').money < q then return ESX.Notifi(source, '💲 Vous ne possedez pas asser ~r~d\'argent~s~ sur votre compte en bank') end

    xPlayer.removeAccountMoney('bank', q)
    x.addAccountMoney('bank', q)
    TriggerClientEvent('zmain:bank:updateAccount', source)
end)