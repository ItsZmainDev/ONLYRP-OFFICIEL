ConfigWebhookRendezVousPolice = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY" -- Metez le webhook de votre salon disocrd configure pour le job ems 

Config = {
    serviceWeapons = {
        "WEAPON_NIGHTSTICK",
        "WEAPON_STUNGUN",
        "WEAPON_COMBATPISTOL",
        "WEAPON_BULLPUPSHOTGUN",
        "WEAPON_FLASHLIGHT",
        "WEAPON_ASSAULTSMG",
        "WEAPON_SMG",
        "WEAPON_CARBINERIFLE",
        "WEAPON_PUMPSHOTGUN"
    },
}

Config.WebHookPlainte = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY" 
Config.Logs_Fouille = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY"
Config.Logs_Objets_depot = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY"
Config.Logs_Objets_retrait = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY"
Config.Logs_Armes_depot = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY"
Config.Logs_Armes_retrait = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY"
Config.Logs_PriseFin_Service = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY"
Config.Logs_Amende = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY"

Config.spawn = {
	spawnvoiture = {position = {x = -1078.071, y = -845.830, z = 4.884, h = 217.410}},
	spawnheli = {position = {x = -1096.219, y = -832.277, z = 37.700, h = 305.05456}},
    spawnbato = {position = {x = -797.997, y = -1485.792, z = -0.474, h = 110.404}}
}

vehicles = {                                                         -- category = Separator en rageui 
car = {                                                           -- Label = nom ig qui apparaitra sur le bouton 
    {category = "↓ ~b~Véhicules ~s~↓"},                           -- Model = nom de spawn du véhicule
    {model = "iplspd10", label = "Ford", minimum_grade = 0, stock = 15},
    {model = "iplspd3", label = "Buffalo", minimum_grade = 0, stock = 15}, --minimum_grade = grade minmum pour prendre
    {model = "iplspd14", label = "Ford Charger", minimum_grade = 1, stock = 15},
    {model = "iplspd2", label = "4x4 TT", minimum_grade = 1, stock = 15},
    {model = "fbi", label = "Oracle Banalisé", minimum_grade = 1, stock = 5},
    {model = "policeb", label = "Moto Police BMO", minimum_grade = 2, stock = 3},
    {model = "iplspd12", label = "SUV", minimum_grade = 3, stock = 3},
    {model = "iplspd11", label = "Transport de Prisonnier", minimum_grade = 3, stock = 3},
    {model = "riot", label = "Fourgon blindé", minimum_grade = 3, stock = 4},
    {model = "iplspd5", label = "VIR", minimum_grade = 4, stock = 2},
    {model = "policefelon", label = "Felon Banalisé", minimum_grade = 4, stock = 2},
},

heli= {        
    {category = "↓ ~b~Hélicoptère~s~↓"},                   
    {model = "as350", label = "Hélicoptere LSPD", minimum_grade = 3, stock = 2}, 
},

}

PoliceCloak = {
	clothes = {
        specials = {
                [0] = {
                    label = "Reprendre sa tenue civil",
                    minimum_grade = 0,
                    variations = {male = {}, female = {}},
                    onEquip = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                        SetPedArmour(PlayerPedId(), 0)
                    end
                },
                [1] = {
                    minimum_grade = 0,
                    label = "Tenue des Cadets",
                    variations = {
                        male = {
                            ['bproof_1'] = 22, ['bproof_2'] = 0,
                            ['bags_1'] = 59, ['bags_2'] = 0,
                            ['tshirt_1'] = 71,  ['tshirt_2'] = 0,
                            ['torso_1'] = 410,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 1,
                            ['pants_1'] = 102,   ['pants_2'] = 0,
                            ['shoes_1'] = 105,   ['shoes_2'] = 0,
                            ['helmet_1'] = -1,  ['helmet_2'] = 0,
                            ['chain_1'] = 8,    ['chain_2'] = 0
                        },
                        female = {
                            ['tshirt_1'] = 38,  ['tshirt_2'] = 1,
                            ['torso_1'] = 206,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 76,   ['pants_2'] = 0,
                            ['shoes_1'] = 41,   ['shoes_2'] = 0,
                            ['helmet_1'] = -1,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        }
                },
                onEquip = function()  
                end
                },
                [2] = {
                    minimum_grade = 1,
                    label = "Tenue des Officiers",
                    variations = {
                        male = {
                            ['bproof_1'] = 0, ['bproof_2'] = 0,
                            ['bags_1'] = 54, ['bags_2'] = 0,
                            ['tshirt_1'] = 77,  ['tshirt_2'] = 0,
                            ['torso_1'] = 214,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 33,
                            ['pants_1'] = 112,   ['pants_2'] = 0,
                            ['shoes_1'] = 89,   ['shoes_2'] = 0,
                            ['helmet_1'] = 195,  ['helmet_2'] = 1,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        },
                        female = {
                            ['bags_1'] = 45, ['bags_2'] = 0,
                            ['tshirt_1'] = 38,  ['tshirt_2'] = 1,
                            ['torso_1'] = 206,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 72,   ['pants_2'] = 0,
                            ['shoes_1'] = 41,   ['shoes_2'] = 0,
                            ['helmet_1'] = -1,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        }
                },
                onEquip = function()  
                end
                },
                [3] = {
                    minimum_grade = 2,
                    label = "Tenue des Sergents",
                    variations = {
                        male = {
                            ['bproof_1'] = 7, ['bproof_2'] = 0,
                            ['bags_1'] = 54, ['bags_2'] = 0,
                            ['tshirt_1'] = 77,  ['tshirt_2'] = 0,
                            ['torso_1'] = 214,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 33,
                            ['pants_1'] = 112,   ['pants_2'] = 0,
                            ['shoes_1'] = 89,   ['shoes_2'] = 0,
                            ['helmet_1'] = 101,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        },
                        female = {
                            ['bags_1'] = 45, ['bags_2'] = 0,
                            ['tshirt_1'] = 38,  ['tshirt_2'] = 0,
                            ['torso_1'] = 206,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 72,   ['pants_2'] = 0,
                            ['shoes_1'] = 41,   ['shoes_2'] = 0,
                            ['helmet_1'] = -1,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        }
                },
                onEquip = function()  
                end
                },
                [4] = {
                    minimum_grade = 0,
                    label = "Tenue d'Intervention",
                    variations = {
                        male = {
                            ['bags_1'] = 54, ['bags_2'] = 0,
                            ['bproof_1'] = 7, ['bproof_2'] = 0,
                            ['tshirt_1'] = 62,  ['tshirt_2'] = 1,
                            ['torso_1'] = 193,   ['torso_2'] = 2,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 24,
                            ['pants_1'] = 112,   ['pants_2'] = 0,
                            ['shoes_1'] = 89,   ['shoes_2'] = 0,
                            ['helmet_1'] = 186,  ['helmet_2'] = 0,
                            ['mask_1'] = 112,  ['mask_2'] = 25,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                        },
                        female = {
                            ['bags_1'] = 45, ['bags_2'] = 0,
                            ['tshirt_1'] = 38,  ['tshirt_2'] = 0,
                            ['torso_1'] = 206,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 72,   ['pants_2'] = 0,
                            ['shoes_1'] = 41,   ['shoes_2'] = 0,
                            ['helmet_1'] = 100,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        }
                },
                onEquip = function()  
                end
                },
                [5] = {
                    minimum_grade = 3,
                    label = "Tenue des Lieutenant",
                    variations = {
                        male = {
                            ['bproof_1'] = 7, ['bproof_2'] = 0,
                            ['bags_1'] = 54, ['bags_2'] = 0,
                            ['tshirt_1'] = 77,  ['tshirt_2'] = 0,
                            ['torso_1'] = 214,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 33,
                            ['pants_1'] = 112,   ['pants_2'] = 0,
                            ['shoes_1'] = 89,   ['shoes_2'] = 0,
                            ['helmet_1'] = 1,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        },
                        female = {
                            ['bags_1'] = 45, ['bags_2'] = 0,
                            ['tshirt_1'] = 38,  ['tshirt_2'] = 0,
                            ['torso_1'] = 206,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 72,   ['pants_2'] = 0,
                            ['shoes_1'] = 41,   ['shoes_2'] = 0,
                            ['helmet_1'] = 1,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        }
                },
                onEquip = function()  
                end
                },
                [6] = {
                    minimum_grade = 4,
                    label = "Tenue du Commandant",
                    variations = {
                        male = {
                            ['bproof_1'] = 7, ['bproof_2'] = 0,
                            ['bags_1'] = 54, ['bags_2'] = 0,
                            ['tshirt_1'] = 77,  ['tshirt_2'] = 0,
                            ['torso_1'] = 214,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 33,
                            ['pants_1'] = 112,   ['pants_2'] = 0,
                            ['shoes_1'] = 89,   ['shoes_2'] = 0,
                            ['helmet_1'] = 88,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        },
                        female = {
                            ['bags_1'] = 45, ['bags_2'] = 0,
                            ['tshirt_1'] = 38,  ['tshirt_2'] = 0,
                            ['torso_1'] = 206,   ['torso_2'] = 1,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 72,   ['pants_2'] = 0,
                            ['shoes_1'] = 41,   ['shoes_2'] = 0,
                            ['helmet_1'] = 38,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 2,     ['ears_2'] = 0
                        }
                },
                onEquip = function()  
                end
            }
        },
    }
}

-- PoliceCloakGilet = {
-- 	clothesGilet = {
--         gilet = {
--                 [0] = {
--                     minimum_grade = 1,
--                     labelGilet = "Mettre",
--                     variations = {
--                         male = {
--                             ['bproof_1'] = 7, ['bproof_2'] = 0,
--                         },
--                         female = {
--                             ['bproof_1'] = 1,
--                         }
--                 },
--                 onEquip = function()  
--                 end
--                 },
--                 [1] = {
--                     minimum_grade = 1,
--                     labelGilet = "Enlever",
--                     variations = {
--                         male = {
--                             ['bproof_1'] = 0,
--                         },
--                         female = {
--                             ['bproof_1'] = 0,
--                         }
--                     },
--                     onEquip = function()  
--                     end
--                 }
--             },
--         }
--     }