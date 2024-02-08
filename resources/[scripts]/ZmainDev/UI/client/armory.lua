CreateThread(function()
    while not ESXLoaded do Wait(1) end
    exports['shop']:addItem('armory', {
        [1] = {
            name = 'Poing américain',
            item = 'WEAPON_KNUCKLE',
            image = "weapon_knuckle.png",
            price = 5000,
            type = "weapon"
        },
        [2] = {
            name = 'Batte',
            item = 'WEAPON_BAT',
            image = "weapon_bat.png",
            price = 7000,
            type = "weapon"
        },
        [3] = {
            name = 'Couteau',
            item = 'WEAPON_KNIFE',
            image = "weapon_knife.png",
            price = 5000,
            type = "weapon"
        },
        [4] = {
            name = 'Pétoire',
            item = 'weapon_snspistol',
            image = 'weapon_snspistol.png',
            price = 130000,
            type = "weapon",
        },
        [5] = {
            name = 'Chargeur',
            item = 'clip',
            image = 'chargeur.png',
            price = 500,
            type = 'item'
        },
        [6] = {
            name = 'Kevlar lourd',
            item = 'kevlar',
            image = 'kevlar.png',
            price = 3500,
            type = 'item'
        },
    })
end)