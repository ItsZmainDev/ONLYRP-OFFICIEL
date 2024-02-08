RegisterNUICallback("checkout",function(data)
    TriggerServerEvent('shop:checkoutShop', data.item, data.quantity, data.total, data.type, data.name)
end)

RegisterNUICallback("CloseUI",function()
    close_ui()
end)

exports('addItem', function(name, table)
    print(name, table)
    Config.Products[name] = table
end)