Config.Drugs = {
    Wait = 2000,
    Drugs = {
        ["weed"] = {
            ["recolte"] = {
                vector3(1060.5313720703, -3193.3864746094, -39.140571594238),
                vector3(1060.8548583984, -3203.1354980469, -39.14879989624),
                vector3(1058.69140625, -3203.4396972656, -39.06368637085),
                vector3(1051.401, -3204.18, -39.13237),
                vector3(1051.636, -3201.86, -39.11514),
                vector3(1053.872, -3195.949, -39.16129),
                vector3(1053.914, -3191.11, -39.16134),
                vector3(1057.406, -3197.282, -39.13162),
                vector3(1060.5856933594, -3198.4584960938, -39.161205291748)
            },
            ["traitement"] = {
                vector3(1039.4801025391, -3205.1555175781, -38.165992736816)
                -- vector3(1034.7731933594, -3205.2922363281, -38.176445007324),
                -- vector3(1044.2901611328, -3195.0302734375, -38.158569335938)
            }
        },
        ["coke"] = {
            ["recolte"] = {
                vector3(-89.12731, 1893.019, 196.8857),
                vector3(-95.6274, 1893.535, 197.0716),
                vector3(-103.2007, 1893.634, 197.1625),
                vector3(-109.2517, 1893.686, 197.2784),
                vector3(-116.2441, 1893.543, 197.4235)
            },
            ["traitement"] = {
                vector3(1090.54, -3196.656, -38.99348),
                vector3(1092.907, -3196.647, -38.99348),
                vector3(1100.811, -3198.811, -38.99348)
            }
        },
        ["hashish"] = {
            ["recolte"] = {
                vector3(5205.052, -5185.256, 12.42322),
                vector3(5205.667, -5176.565, 11.85043),
                vector3(5206.31, -5168.621, 11.41024),
                vector3(5206.384, -5160.199, 10.03377),
            },
            ["traitement"] = {
                vector3(5204.858, -5207.878, 15.33945),
                vector3(5212.219, -5209.582, 16.05666),
                vector3(5205.754, -5215.95, 16.0377),
                vector3(5213.902, -5198.893, 15.52251)
            }
        },
    },
    Items = {
        ["weed"] = {
            ["recolte"] = {
                name = "weed",
                label = "Weed",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = false,
                props = "prop_weed_01"
            },
            ["traitement"] = {
                name = "weed_pooch",
                label = "Pochon de weed",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            }
        },
        ["coke"] = {
            ["recolte"] = {
                name = "coke",
                label = "Coke",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = false,
                props = "prop_coral_bush_01"
            },
            ["traitement"] = {
                name = "coke_pooch",
                label = "Pochon de coke",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            }
        },
        ["hashish"] = {
            ["recolte"] = {
                name = "hashish",
                label = "Hashish",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = false,
                props = "prop_weed_01"
            },
            ["traitement"] = {
                name = "hashish_pooch",
                label = "Pochon de Hashish",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = true,
                props = nil
            }
        }
    },
    RandomZone = {},
    x = {},
    y = {},
    z = {},
    objSpawn = {},

    sell = {
        Position = {
            {pos = vector3(223.6434, 361.9361, 106.0158), message = 'Salut, je viens d\'avoir ton contact, rejoins moi !'},
            {pos = vector3(631.267, 126.1303, 92.82717), message = 'J\'ai un paquet de fric pour toi, Rejoins moi !'},
            {pos = vector3(919.8398, -101.0656, 78.76405), message = 'J\'ai envie de m\'évader, rejoins moi !'},
            {pos = vector3(1098.949, -257.1723, 69.23422), message = 'Tu as encore un peu de produit pour moi ? Rejoins moi !'},
            {pos = vector3(1347.611, -579.9153, 74.27182), message = 'Tu est où ? J\'ai besoin de ta dobe, rejoins moi !'},
            {pos = vector3(1255.749, -728.9435, 63.08429), message = 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'},
            {pos = vector3(1139.844, -793.9587, 57.59371), message = 'Salut, je viens d\'avoir ton contact, rejoins moi !'},
            {pos = vector3(1116.455, -975.5618, 46.4276), message = 'J\'ai un paquet de fric pour toi, Rejoins moi !'},
            {pos = vector3(955.7035, -1060.513, 36.91405), message = 'Tu as encore du produit magique ? Rejoins moi, je sais que je peux compter sur toi !'},
            {pos = vector3(866.5913, -1061.083, 28.92093), message = 'J\'ai envie de m\'évader, rejoins moi !'},
            {pos = vector3(744.7858, -1226.409, 24.7689), message = 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'},
            {pos = vector3(48.11366, -1617.751, 29.35911), message = 'Salut, je viens d\'avoir ton contact, rejoins moi !'},
            {pos = vector3(-337.1456, -1485.842, 30.58897), message = 'J\'ai un paquet de fric pour toi, Rejoins moi !'},
            {pos = vector3(-337.5451, -937.4936, 31.08061), message = 'Tu as encore du produit magique ? Rejoins moi, je sais que je peux compter sur toi !'},
            {pos = vector3(-321.0146, -708.754, 32.90949), message = 'J\'ai besoin de ta dobe, rejoins moi à la position !'},
            {pos = vector3(250.9829, -84.99375, 69.94865), message = 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'},
            {pos = vector3(-529.8306, -28.73513, 44.483), message = 'Salut, je viens d\'avoir ton contact, rejoins moi !'},
            {pos = vector3(-1447.862, -366.669, 43.5421), message = 'J\'ai un paquet de fric pour toi, Rejoins moi !'},
            {pos = vector3(-1665.557, 72.42794, 63.42919), message = 'Tu est où ? J\'ai besoin de ta dobe, rejoins moi !'},
            {pos = vector3(-1089.653, -303.5042, 37.6475), message = 'Tu as encore un peu de produit pour moi ? Rejoins moi !'},
            {pos = vector3(67.83146, -582.4772, 31.62865), message = 'J\'ai envie de m\'évader, rejoins moi !'},
            {pos = vector3(508.676, -609.5555, 24.75115), message = 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'},
            {pos = vector3(460.6315, -761.1773, 27.35789), message = 'Tu as encore un peu de produit pour moi ? Rejoins moi !'},
            {pos = vector3(469.0552, -585.1814, 28.49963), message = 'J\'ai envie de m\'évader, rejoins moi !'},
            {pos = vector3(188.4804, -446.4894, 41.65034), message = 'Tu as encore du produit magique ? Rejoins moi, je sais que je peux compter sur toi !'},
            {pos = vector3(-113.113, -603.219, 36.2808), message = 'J\'ai besoin de ta dobe, rejoins moi à la position !'},
            {pos = vector3(171.5574, -1235.226, 29.31717), message = 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'},
            {pos = vector3(168.8957, -1074.229, 29.19271), message = 'Salut, je viens d\'avoir ton contact, rejoins moi !'},
            {pos = vector3(-1026.36, -490.5504, 36.95707), message = 'J\'ai un paquet de fric pour toi, Rejoins moi !'},
            {pos = vector3(-1187.141, -561.4119, 27.69303), message = 'Tu as encore un peu de produit pour moi ? Rejoins moi !'},
            {pos = vector3(-1625.846, -1013.497, 13.14283), message = 'J\'ai envie de m\'évader, rejoins moi !'},
            {pos = vector3(-1478.707, -1007.221, 6.278837), message = 'Salut, je viens d\'avoir ton contact, rejoins moi !'},
            {pos = vector3(-1366.837, -1118.641, 4.440189), message = 'J\'ai un paquet de fric pour toi, Rejoins moi !'},
            {pos = vector3(-1307.506, -1310.718, 4.880769), message = 'J\'ai envie de m\'évader, rejoins moi !'},
            {pos = vector3(-1249.525, -1432.084, 4.328819), message = 'J\'ai besoin de ta dobe, rejoins moi à la position !'},
            {pos = vector3(-1105.416, -1289.652, 5.409871), message = 'J\'ai envie de m\'évader, rejoins moi !'},
            {pos = vector3(-862.0741, -1225.43, 6.164714), message = 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'},
            {pos = vector3(-770.1006, -1068.82, 11.83907), message = 'Salut, je viens d\'avoir ton contact, rejoins moi !'},
            {pos = vector3(-798.715, 372.9659, 87.87606), message = 'J\'ai un paquet de fric pour toi, Rejoins moi !'},
            {pos = vector3(-612.0229, 333.9978, 85.11668), message = 'Tu as encore un peu de produit pour moi ? Rejoins moi !'},
            {pos = vector3(-7.892984, -575.7496, 37.74508), message = 'Tu est où ? J\'ai besoin de ta dobe, rejoins moi !'},
            {pos = vector3(295.7924, -569.9385, 43.26083), message = 'Tu as encore du produit magique ? Rejoins moi, je sais que je peux compter sur toi !'},
            {pos = vector3(382.6145, -344.0313, 46.81528), message = 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'},
            {pos = vector3(274.8113, -326.7183, 44.91986), message = 'Salut, je viens d\'avoir ton contact, rejoins moi !'},
            {pos = vector3(182.4253, -183.6355, 54.14867), message = 'J\'ai un paquet de fric pour toi, Rejoins moi !'},
            {pos = vector3(-29.66706, -92.48367, 57.25431), message = 'J\'ai envie de m\'évader, rejoins moi !'},
            {pos = vector3(-359.97, 79.45751, 63.18902), message = 'Tu as encore un peu de produit pour moi ? Rejoins moi !'},
            {pos = vector3(-275.6082, 201.5199, 85.69868), message = 'Mon dealos préféré, tu aurais pas un peu de dobe pour moi ? Rejoins moi !'},
            {pos = vector3(-448.3742, 177.0427, 75.20374), message = 'Salut, je viens d\'avoir ton contact, rejoins moi !'},
            {pos = vector3(-499.0154, 58.7512, 56.49613), message = 'J\'ai un paquet de fric pour toi, Rejoins moi !'},
        },

        Drugs = {
            ['weed_pooch'] = {
                minPrice = 100,
                maxPrice = 200,
                min = 5,
                max = 32,
                label = 'pochon de weed'
            },
            ['coke_pooch'] = {
                minPrice = 120,
                maxPrice = 200,
                min = 5,
                max = 32,
                label = 'pochon de coke'
            },
            ['hashish_pooch'] = {
                minPrice = 150,
                maxPrice = 300,
                min = 5,
                max = 32,
                label = 'pochon de hashish'
            }
        },

        CallCop = {
            [6] = true,
            [1] = true,
            [9] = true,
        },

        InSell = false
    }
}