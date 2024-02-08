CreateThread(function()
    while not ESXLoaded do Wait(1) end
    exports['shop']:addItem('market', {
        [1] = {
            name = 'Eau',
            item = 'water',
            image = "water.png",
            price = 50,
            type = "item"
        },
        [2] = {
            name = 'Pain',
            item = 'bread',
            image = "bread.png",
            price = 50,
            type = "item"
        },
    })
end)