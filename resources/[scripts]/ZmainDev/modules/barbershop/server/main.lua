ESX.RegisterServerCallback('barber:getmoney', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getAccount('bank').money < 80 or xPlayer.getAccount('cash').money < 80 then
        cb(false)
    else
        xPlayer.removeAccountMoney('bank', 80)
        cb(true)
    end
end)