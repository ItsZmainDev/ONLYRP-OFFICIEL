Config = {}

Activity = {
    Peds = {
        -- ["START_CHASSE"] = {
        --     model = "cs_floyd",
        --     tag = "Bachir",
        --     text = "Appuyez sur [ ~g~E~w~ ] pour parler à Bachir",
        --     pos = vector3(-1490.8293457031, 4981.2504882813, 63.338893890381),
        --     heading = 90.0,
        --     scenarioActive = true,
        --     scenarioName = "WORLD_HUMAN_CLIPBOARD",
        --     weaponActive = true,
        --     weapon = "weapon_musket",
        --     gamerTag = true,
        --     Action = function()
        --         _CHASSE.openChasseMenu()
        --     end
        -- },
        ["SELL_CHASSE"] = {
            model = "cs_joeminuteman",
            tag = "Libba",
            text = "Appuyez sur [ ~g~E~w~ ] pour parler à Libba",
            pos = vector3(739.99090576172, -970.05145263672, 24.457498550415),
            heading = 269.85900878906,
            scenarioActive = true,
            scenarioName = "WORLD_HUMAN_CLIPBOARD",
            weaponActive = true,
            weapon = "weapon_musket",
            gamerTag = true,
            Action = function()
                _CHASSE.openSellMenu()
            end
        },
        ["START_LIVRAISONS"] = {
            model = "cs_joeminuteman",
            tag = "Leo",
            text = "Appuyez sur [ ~g~E~w~ ] pour parler à Leo",
            pos = vector3(951.97802734375, -1734.8596191406, 31.08740234375),
            heading = 355.27059936523,
            scenarioActive = true,
            scenarioName = "WORLD_HUMAN_CLIPBOARD",
            weaponActive = false,
            weapon = "weapon_musket",
            gamerTag = true,
            Action = function()
                _LIVRAISONS.openLivraisonsMenu()
            end
        }
    },
    Acier = {
        vector3(100.14375305176, -383.58462524414, 41.428314208984),
        vector3(97.717330932617, -378.58120727539, 41.792797088623),
        vector3(105.64247131348, -378.27307128906, 41.872734069824)
    },
    TAcier = {
        vector3(985.14428710938, -1922.9016113281, 31.13445854187),
        vector3(997.16015625, -1920.0733642578, 31.159097671509),
        vector3(990.61553955078, -1918.0971679688, 31.145364761353)
    },
    VAcier = {
        vector3(1246.288, -3155.489, 5.636689),
        vector3(1242.785, -3149.307, 5.528234),
        vector3(1244.887, -3145.892, 5.538756),
        vector3(1244.075, -3142.173, 5.528234),
        vector3(1247.4, -3135.931, 5.715518),
    },
    Blips = {
        {
            pos = vector3(99.587600708008, -380.77630615234, 41.617053985596),
            blipid = 285,
            blipcolor = 36,
            text = "[ACTIVITÉ] Récolte D'acier"
        },
        {
            pos = vector3(975.68463134766, -1919.8936767578, 31.135709762573),
            blipid = 285,
            blipcolor = 36,
            text = "[ACTIVITÉ] Traitement D'acier"
        },
        {
            pos = vector3(1246.755, -3142.263, 5.669068),
            blipid = 285,
            blipcolor = 36,
            text = "[ACTIVITÉ] Vente D'acier"
        },
        {
            pos = vector3(-1493.923828125, 4978.3872070313, 63.450904846191),
            blipid = 463,
            blipcolor = 59,
            text = "[ACTIVITÉ] Chasse"
        },
        {
            pos = vector3(-1346.45, 4650.41, 109.64),
            blipid = 463,
            blipcolor = 24,
            text = "[ACTIVITÉ] Zonne De Chasse"
        },
        {
            pos = vector3(951.97802734375, -1734.8596191406, 31.08740234375),
            blipid = 67,
            blipcolor = 47,
            text = "[ACTIVITÉ] Livraisons"
        },
        {
            pos = vector3(739.99090576172, -970.05145263672, 24.457498550415),
            blipid = 463,
            blipcolor = 59,
            text = "[ACTIVITÉ] Vente de gibier"
        }
    },
    ZoneBlips = {
        {
            pos = vector3(-1346.45, 4650.41, 109.64),
            blipcolor = 24
        }
    },
    Chasse = {
        Levels = {
            [100] = {
                "Chevreuil",
                "Lapin"
            },
            [200] = {
                "Chevreuil",
                "Lapin",
                "Jaguar"
            },
            [300] = {
                "Chevreuil",
                "Lapin",
                "Jaguar",
                "Loup"
            },
            [400] = {
                "Chevreuil",
                "Lapin",
                "Jaguar",
                "Loup",
                "Cerf"
            },
            [700] = {
                "Chevreuil",
                "Lapin",
                "Jaguar",
                "Loup",
                "Sanglier"
            }
        },
        Levels2 = {
            [-664053099] = "cerf",
            [-541762431] = "lapin",
            [307287994] = "jaguar",
            [1682622302] = "loup",
            [-832573324] = "sanglier"
        },
        AuthorizedAnimals = {
            {hash = -664053099, requirededlevel = 100},
            {hash = 307287994, requirededlevel = 200},
            {hash = 1682622302, requirededlevel = 300},
            {hash = -832573324, requirededlevel = 700},
            {hash = -541762431, requirededlevel = 0}
        },
        AuthorizedAnimals2 = {
            [-664053099] = 100,
            [307287994] = 200,
            [1682622302] = 300,
            [832573324] = 400,
            [-832573324] = 700,
            [-541762431] = 0
        },
        Animals = {
            vector3(-1000.6195068359, 4722.7319335938, 251.86349487305),
            vector3(-1314.7746582031, 4850.2954101563, 143.39895629883),
            vector3(-1419.5855712891, 4722.3745117188, 42.911380767822),
            vector3(-1421.2526855469, 4543.3471679688, 59.639568328857),
            vector3(-1430.9395751953, 4305.736328125, 3.238737821579),
            vector3(-1430.9395751953, 4305.736328125, 3.238737821579),
            vector3(-1658.2985839844, 4698.3540039063, 36.048252105713),
            vector3(-1365.0989990234, 4805.5258789063, 130.05764770508),
            vector3(-1160.3708496094, 4557.9013671875, 141.23742675781),
            vector3(-1566.1948242188, 4676.7783203125, 45.917358398438),
            vector3(-1457.439453125, 4805.55859375, 87.928871154785),
            vector3(-1433.5939941406, 4712.162109375, 41.99116897583)
        },
        SellItems = {
            ["lapin"] = {price = 30},
            ["chevreuil"] = {price = 50},
            ["jaguar"] = {price = 70},
            ["loup"] = {price = 90},
            ["sanglier"] = {price = 120},
            ["cerf"] = {price = 140},
        }
    },
    Livraisons = {
        Levels = {
            [100] = 600,
            [200] = 700,
            [300] = 800,
            [400] = 850,
            [500] = 900,
        },
        Vehicle = {
            [200] = {'mule'},
            [400] = {'packer'}
        },

        Market = {
            vector3(23.769006729126, -1305.7766113281, 29.17688369751), -- 1
            -- vector3(2565.7229003906, 384.40933227539, 108.46313476563), -- 2
            -- vector3(-3040.5305175781, 603.54089355469, 7.5439276695251), -- 3
            -- vector3(-3234.9484863281, 1003.9524536133, 12.267910003662), -- 4
            -- vector3(543.09710693359, 2679.5480957031, 42.214179992676), -- 5
            -- vector3(1968.8165283203, 3735.2377929688, 32.31792068481), --6 
            -- vector3(2681.0595703125, 3273.1362304688, 55.240520477295), -- 7
            -- vector3(1731.7833251953, 6403.3022460938, 34.654445648193), -- 8
            vector3(1150.8741455078, -980.61779785156, 46.177253723145 ), -- 9
            vector3(-1231.9028320313, -895.34375, 12.216474533081), -- 10
            vector3(-1510.5513916016, -380.0754699707, 41.326847076416), --11
            -- vector3(-2970.4497070313, 372.21466064453, 14.771851539612), -- 12
            -- vector3(1175.51953125, 2696.5549316406, 37.968856811523), -- 13
            -- vector3(1401.4223632813, 3597.2272949219, 34.885875701904), -- 14
            vector3(-63.715763092041, -1753.5750732422, 29.313331604004), -- 15
            vector3(1165.7283935547, -329.54580688477, 69.000129699707), -- 16
            vector3(-729.14410400391, -916.22064208984, 19.013988494873), -- 17
            -- vector3(-1816.0653076172, 788.28387451172, 137.8639831543), -- 18
            -- vector3(1699.8020019531, 4938.7138671875, 42.078151702881), -- 19
        }
    }
}

