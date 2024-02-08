Config = Config or {}
--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗     
-- ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║     
-- ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║     
-- ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║     
-- ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗
--  ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
                                                           

Config.Language = "fr" -- Set your lang in locales folder
Config.Framework = "esx" -- esx or soon...
Config.Debug = true 
--[[                                    
    'old' (Esx 1.1).
    'new' (Esx 1.2, v1 final, legacy or extendedmode).
]]
Config.esxVersion = 'old' 

Config.TriggerESX = {
    ['esx:useItem'] = 'esx:useItem',
    ['esx:getSharedObject'] = 'esx:getSharedObject',
}

Config.Objects = {
    'prop_bin_01a',
    'prop_dumpster_01a',
    'prop_dumpster_02a',
    'prop_dumpster_3a',
    'prop_bin_04a',
}


Config.KeyBinds = {
    -- Find keybinds here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    {Command = "inventory", Bind = "TAB", Description = "Open inventory"},-- toggle the inventaire
    {Command = "keybind_1", Bind = "1", Description = "Slot weapon 1"},-- 
    {Command = "keybind_2", Bind = "2", Description = "Slot weapon 2"},-- 
    {Command = "keybind_3", Bind = "3", Description = "Slot weapon 3"},-- 
    {Command = "keybind_4", Bind = "4", Description = "Slot weapon 4"},-- 
    {Command = "keybind_5", Bind = "5", Description = "Slot weapon 5"},-- 
    {Command = "trunk", Bind = "K", Description = "Open trunk vehicle"},-- 
}

-- Name of the item when used will close the UI
Config.CloseUI = {
    ['water'] = true,
    ['bread'] = true,
    ['phone'] = true,
    ['boombox'] = true,
}

-- Names of weapons impossible to give
Config.WeaponNoGive = {
    ["WEAPON_PISTOL_MK2"] = true,
}

-- Names of item impossible to give
Config.ItemNoGive = {
    ["boombox"] = true,
}

-- Name of the item that cannot be placed in slots
Config.BL_SlotInv = {
    ["phone"] = true,
    ["radio"] = true,
    ['boombox'] = true,
}

--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗██╗      ██████╗ ████████╗██╗  ██╗███████╗███████╗
-- ██╔════╝██║     ██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔════╝
-- ██║     ██║     ██║   ██║   ██║   ███████║█████╗  ███████╗
-- ██║     ██║     ██║   ██║   ██║   ██╔══██║██╔══╝  ╚════██║
-- ╚██████╗███████╗╚██████╔╝   ██║   ██║  ██║███████╗███████║
--  ╚═════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
                                                          
Config.Clothes = {
    ['helmet'] = {
        [0] = {['helmet_1'] = 0, ["helmet_2"] = 0},
        [1] = {['helmet_1'] = 0, ["helmet_2"] = 0}
    },
    ['chain'] = {
        [0] = {['chain_1'] = 0, ["chain_2"] = 0},
        [1] = {['chain_1'] = 0, ["chain_2"] = 0}
    },
    ['torso'] = {
        [0] = {['torso_1'] = 0, ["torso_2"] = 0},
        [1] = {['torso_1'] = 0, ["torso_2"] = 0}
    },
    ['pants'] = {
        [0] = {['pants_1'] = 0, ["pants_2"] = 0},
        [1] = {['pants_1'] = 0, ["pants_2"] = 0}
    },
    ['shoes'] = {
        [0] = {['shoes_1'] = 0, ["shoes_2"] = 0},
        [1] = {['shoes_1'] = 0, ["shoes_2"] = 0}
    },
    ['bags'] = {
        [0] = {['bags_1'] = 0, ["bags_2"] = 0},
        [1] = {['bags_1'] = 0, ["bags_2"] = 0}
    },
    ['mask'] = {
        [0] = {['mask_1'] = 0, ["mask_2"] = 0},
        [1] = {['mask_1'] = 0, ["mask_2"] = 0}
    },
    ['glasses'] = {
        [0] = {['glasses_1'] = 0, ["glasses_2"] = 0},
        [1] = {['glasses_1'] = 0, ["glasses_2"] = 0}
    },
    ['ears'] = {
        [0] = {['ears_1'] = 0, ["ears_2"] = 0},
        [1] = {['ears_1'] = 0, ["ears_2"] = 0}
    },
    ['bracelets'] = {
        [0] = {['bracelets_1'] = 0, ["bracelets_2"] = 0},
        [1] = {['bracelets_1'] = 0, ["bracelets_2"] = 0}
    },
    ['watches'] = {
        [0] = {['watches_1'] = 0, ["watches_2"] = 0},
        [1] = {['watches_1'] = 0, ["watches_2"] = 0}
    },
    ['bproof'] = {
        [0] = {['bproof_1'] = 0, ["bproof_2"] = 0},
        [1] = {['bproof_1'] = 0, ["bproof_2"] = 0}
    },
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

--  ██████╗██╗      ██████╗ ████████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ███████╗████████╗ ██████╗ ██████╗ ███████╗
-- ██╔════╝██║     ██╔═══██╗╚══██╔══╝██║  ██║██║████╗  ██║██╔════╝     ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
-- ██║     ██║     ██║   ██║   ██║   ███████║██║██╔██╗ ██║██║  ███╗    ███████╗   ██║   ██║   ██║██████╔╝█████╗  
-- ██║     ██║     ██║   ██║   ██║   ██╔══██║██║██║╚██╗██║██║   ██║    ╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  
-- ╚██████╗███████╗╚██████╔╝   ██║   ██║  ██║██║██║ ╚████║╚██████╔╝    ███████║   ██║   ╚██████╔╝██║  ██║███████╗
--  ╚═════╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
        
Config.ActiveClothShop = true

Config.ClothMarkerDistance = 15
Config.ClothMarkerType = 25
Config.ClothActiveText = true
Config.ClothMarkerText = '👕'

Config.ClothTypeMoney = 'bank'
Config.ClothPriceSave = 100
Config.ClothPriceRegister = 250
Config.ClothPrice = {
    ["top"] = 150,
    ["pants"] = 100,
    ["shoes"] = 80,
    ["bags"] = 50,
    ["glasses"] = 20,
    ["ears"] = 10,
    ["helmet"] = 30,
    ["bracelets"] = 15,
    ["watches"] = 30,
    ["chain"] = 50,
    ["mask"] = 30,
}

Config.PosClotheShop = {
    ['Binco'] = {
        menu = 'shopui_title_lowendfashion2',
        type = 'clothes', -- or mask
        coords = {
            vector3(-822.42, -1073.55, 10.33),
            vector3(75.34, -1393.00, 28.38),
            vector3(425.59, -806.15, 28.49),
            vector3(4.87, 6512.46, 30.88),
            vector3(1693.92, 4822.82, 41.06),
            vector3(1196.61, 2710.25, 37.22),
            vector3(-1101.48, 2710.57, 18.11),
        },
        blip = {
            color = 81,
            size = 0.7,
            style = 73
        }
    },
    ['Suburban'] = {
        menu = 'shopui_title_midfashion',
        type = 'clothes', -- or mask
        coords = {
            vector3(-1193.16, -767.98, 16.32),
            vector3(125.77, -223.9, 53.56),
            vector3(614.19, 2762.79, 41.09),
            vector3(-3170.54, 1043.68, 19.86)
        },
        blip = {
            color = 81,
            size = 0.7,
            style = 73
        }
    },
    ['Ponsonbys'] = {
        menu = 'shopui_title_highendfashion',
        type = 'clothes', -- or mask
        coords = {
            vector3(-709.86, -153.1, 36.42),
            vector3(-163.37, -302.73, 38.73),
            vector3(-1450.42, -237.66, 48.81)
        },
        blip = {
            color = 81,
            size = 0.7,
            style = 73
        }
    },
}


--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

--  █████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗
-- ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝
-- ███████║██║     ██║     ██║   ██║██║   ██║██╔██╗ ██║   ██║   
-- ██╔══██║██║     ██║     ██║   ██║██║   ██║██║╚██╗██║   ██║   
-- ██║  ██║╚██████╗╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║   ██║   
-- ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   
                                                             

-- Display accounts in inventory
Config.ActiveAccount = true
Config.Account = {["black_money"] = true, ["cash"] = true} 
Config.AccountName = {
    ["black_money"] = 'Espèces Sale', 
    ["cash"] = 'Espèces'
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗██████╗      ██████╗ █████╗ ██████╗ ██████╗ 
-- ██║██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██╔══██╗
-- ██║██║  ██║    ██║     ███████║██████╔╝██║  ██║
-- ██║██║  ██║    ██║     ██╔══██║██╔══██╗██║  ██║
-- ██║██████╔╝    ╚██████╗██║  ██║██║  ██║██████╔╝
-- ╚═╝╚═════╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ 
    

-- Display id card in inventory
Config.ActiveIdCard = true
Config.ActiveMugShot = true -- https://github.com/BaziForYou/MugShotBase64
Config.PictureIdCard = 'https://cdn.discordapp.com/attachments/979486375218937946/1135635765397823488/47848.png'  -- if ActiveMugShot == false
Config.IdCardName = {
    ["id"] = {
        name = 'Carte d\'identité', 
        icon = 'assets/icons/icon.png',
        color = '#FFF'
    },
    ["drive"] = {
        name = 'Permis de conduire', 
        icon = 'assets/icons/permis.png',
        color = '#e2bab3'
    },
    ["weapon"] = {
        name = 'Permis de port d\'arme', 
        icon = 'https://cdn.discordapp.com/attachments/979486375218937946/1135638696289382400/gun-4-xxl.png',
        color = '#cc352a'
    },
    ["police"] = { 
        name = 'Badge LSPD',
        icon = 'assets/icons/police.png', 
        color = '#05224d'
    }
}
Config.GenreIdCard = {
    ["f"] = 'Women', 
    ["m"] = 'Men', 
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗     ██████╗     ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗
-- ██║     ██╔══██╗    ██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝
-- ██║     ██████╔╝    ██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  
-- ██║     ██╔══██╗    ██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  
-- ███████╗██████╔╝    ██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗
-- ╚══════╝╚═════╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
                                                               
-- LB Phone is unique with inventory
Config.ItemPhoneName = 'phone'
Config.ActivePhoneUnique = true

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██████╗  ██████╗  ██████╗ ███╗   ███╗██████╗  ██████╗ ██╗  ██╗
-- ██╔══██╗██╔═══██╗██╔═══██╗████╗ ████║██╔══██╗██╔═══██╗╚██╗██╔╝
-- ██████╔╝██║   ██║██║   ██║██╔████╔██║██████╔╝██║   ██║ ╚███╔╝ 
-- ██╔══██╗██║   ██║██║   ██║██║╚██╔╝██║██╔══██╗██║   ██║ ██╔██╗ 
-- ██████╔╝╚██████╔╝╚██████╔╝██║ ╚═╝ ██║██████╔╝╚██████╔╝██╔╝ ██╗
-- ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝
                                                              
-- Boombox with inventory
Config.ActiveBoombox = false
Config.BoomboxItem = 'boombox'

Config.MaxDistance = 40
Config.MinDistance = 0

Config.MaxVolume = 100
Config.MinVolume = 0

--╔════════════════════════════════════════════════════════════════════════════════╗

-- ██╗      ██████╗  ██████╗ ████████╗
-- ██║     ██╔═══██╗██╔═══██╗╚══██╔══╝
-- ██║     ██║   ██║██║   ██║   ██║   
-- ██║     ██║   ██║██║   ██║   ██║   
-- ███████╗╚██████╔╝╚██████╔╝   ██║   
-- ╚══════╝ ╚═════╝  ╚═════╝    ╚═╝   
                      
Config.HandsupForLoot = false
Config.ActiveJobForLoot = true
Config.JobForLoot = {
    ['police'] = true,
    ['fbi'] = true,
}

--╚════════════════════════════════════════════════════════════════════════════════╝
--╔════════════════════════════════════════════════════════════════════════════════╗

-- ████████╗██████╗ ██╗   ██╗███╗   ██╗██╗  ██╗
-- ╚══██╔══╝██╔══██╗██║   ██║████╗  ██║██║ ██╔╝
--    ██║   ██████╔╝██║   ██║██╔██╗ ██║█████╔╝ 
--    ██║   ██╔══██╗██║   ██║██║╚██╗██║██╔═██╗ 
--    ██║   ██║  ██║╚██████╔╝██║ ╚████║██║  ██╗
--    ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝


Config.JustOwnerVehicle = false        

Config.saveTrunkCommand = 'saveTrunk'
Config.savingTimer = 5 -- minutes

Config.AccountTrunkName = {
    ["cash"] = 'Espèces',
    ["black_money"] = 'Espèces Sale', 
}

Config.WeightWeh = {
    [0] = 50, --Compact
    [1] = 30,
    [2] = 40,
    [3] = 50,
    [4] = 60, --Vans
    [5] = 70,
    [6] = 50,
    [7] = 50, --LE 8 C LES MOTO MES G RETIRER  Le 7 c supersportive
    [9] = 50, --Style Bifta
    [10] = 500, --Style Guardian
    [11] = 130,
    [12] = 140,
    [13] = 150,
    [14] = 10,
    [15] = 170, --Helico
    [16] = 250, --Avion
    [17] = 190,
    [18] = 200,
    [19] = 210,
    [20] = 220,
    [21] = 230,
}

Config.WeaponDefaultWeight = 5
Config.WeaponWeight = {
    ["WEAPON_NIGHTSTICK"] = 1,
    ["WEAPON_STUNGUN"] = 1,
    ["WEAPON_FLASHLIGHT"] = 1,
    ["WEAPON_ASSAULTRIFLE"] = 5,
    ["WEAPON_SMG"] = 3,
}

Config.ClothesWeight = {
    ["top"] = 0.8,
    ["pants"] = 0.5,
    ["outfit"] = 2,
    ["shoes"] = 0.5,
    ["bags"] = 1.5,
    ["glasses"] = 0.2,
    ["ears"] = 0.2,
    ["helmet"] = 0.4,
    ["bracelets"] = 0.1,
    ["watches"] = 0.1,
    ["chain"] = 0.1,
    ["mask"] = 0.4,
}

--╚════════════════════════════════════════════════════════════════════════════════╝

