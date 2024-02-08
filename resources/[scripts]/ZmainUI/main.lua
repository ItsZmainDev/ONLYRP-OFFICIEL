exports('drawInfo', function(title, table)
    SendNUIMessage({
        action = 'show',
        title = title,
        data = table
    })
end)

exports('hide', function(title, table)
    SendNUIMessage({
        action = 'hide',
    })
end)