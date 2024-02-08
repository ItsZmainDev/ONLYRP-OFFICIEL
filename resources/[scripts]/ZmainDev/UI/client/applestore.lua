CreateThread(function()
    while not ESXLoaded do Wait(1) end
    exports['shop']:addItem('applestore', {
        [1] = {
            name = 'Téléphone',
            item = 'phone',
            image = "phone.png",
            price = 500,
            type = "item"
        },
    })
end)