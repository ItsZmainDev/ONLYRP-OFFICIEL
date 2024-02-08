Config_Farm = {
    Wait = 2000,
    Farm = {
        ["tabac"] = {
            ["recolte"] = {
                vector3(1249.538, -2565.332, 42.71485),
                vector3(1253.233, -2570.43, 42.71717),
                vector3(1249.123, -2572.188, 42.71642)
            },
            ["traitement"] = {
                vector3(1130.263, -1303.833, 34.74113),
                vector3(1122.63, -1303.97, 34.7164),
                vector3(1123.326, -1299.713, 34.71638)
            },
        },
        ["vigne"] = {
            ["recolte"] = {
                vector3(-1674.432, 2288.409, 65.08239),
                vector3(-1669.834, 2283.473, 66.88223),
                vector3(-1665.514, 2278.047, 69.48222)
            },
            ["traitement"] = {
                vector3(-1129.347, 2692.049, 18.80043),
                vector3(-1130.394, 2699.698, 18.80043),
                vector3(-1133.053, 2689.609, 18.80043)
            },
        },
    },
    Items = {
        ["tabac"] = {
            ["recolte"] = {
                name = "tabacblond",
                label = "Tabac Blond",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = false,
                props = "prop_coral_bush_01",
            },
            ["traitement"] = {
                name = "tabacblondsec",
                label = "Tabac Blond Séché",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            },
        },
        ["vigne"] = {
            ["recolte"] = {
                name = "raisin",
                label = "Raisin",
                animtype = "anim",
                animdict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                anim = "machinic_loop_mechandplayer",
                animtime = 2000,
                marker = false,
                props = "prop_coral_spikey_01",
            },
            ["traitement"] = {
                name = "jus_raisin",
                label = "Jus de raisin",
                animtype = "scenario",
                animdict = "PROP_HUMAN_BUM_BIN",
                anim = nil,
                animtime = 5000,
                marker = true,
                props = nil
            },
        },
    },
    RandomZone = {},
    x = {},
    y = {},
    z = {},
    objSpawn = {},

    Job = {
        ['tabac'] = 'tabac',
        ['vigne'] = 'vigne'
    },

    Sell = {
        ['tabac'] = {
            Position = vector3(970.1522, -199.1024, 73.20854),
            job = 'tabac'
        },
        ['vigne'] = {
            Position = vector3(-1928.949, 1779.241, 173.0566),
            job = 'vigne'
        }
    },

    Sell_Items = {
        ['tabac'] = {
            name = 'tabacblondsec',
            label = 'Tabac Blond Séché',
            price = 63
        },
        ['vigne'] = {
            name = 'jus_raisin',
            label = 'Jus de raisin',
            price = 55
        }
    },

    Blips = {
        ['tabac'] = {
            ['recolte'] = {
                position = vector3(1249.538, -2565.332, 42.71485),
                text = '[TABAC] Récolte',
                blipId = 502,
                color = 1
            },
            ['traitement'] = {
                position = vector3(1130.263, -1303.833, 34.74113),
                text = '[TABAC] Traitement',
                blipId = 503,
                color = 1
            },
            ['vente'] = {
                position = vector3(970.0125, -199.0642, 73.20871),
                text = '[TABAC] Vente',
                blipId = 504,
                color = 1
            }
        },
        ['vigne'] = {
            ['recolte'] = {
                position = vector3(-1674.432, 2288.409, 65.08239),
                text = '[VIGNERON] Récolte',
                blipId = 502,
                color = 8
            },
            ['traitement'] = {
                position = vector3(-1129.347, 2692.049, 18.80043),
                text = '[VIGNERON] Traitement',
                blipId = 503,
                color = 8
            },
            ['vente'] = {
                position = vector3(-1928.949, 1779.241, 173.0566),
                text = '[VIGNERON] Vente',
                blipId = 504,
                color = 8
            }
        }
    }
}