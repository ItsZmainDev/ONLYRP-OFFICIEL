CreateThread(function()
    while not ESXLoaded do Wait(1) end
    exports['shop']:addItem('supermarket', {
        [1] = {
            name = 'Jumelles',
            item = 'jumelles',
            image = "jumelle.png",
            price = 200,
            type = "item"
        },
        [2] = {
            name = 'Pillule d\'oublie',
            item = 'oblivionPill',
            image = "bonbons.png",
            price = 50,
            type = "item"
        },
        [3] = {
            name = 'Fil de fer',
            item = 'wire',
            image = "wire.png",
            price = 250,
            type = "item"
        },
        [4] = {
            name = 'Poste à souder',
            item = 'soudeuse',
            image = "caisse.png",
            price = 250,
            type = "item"
        },
    })
end)