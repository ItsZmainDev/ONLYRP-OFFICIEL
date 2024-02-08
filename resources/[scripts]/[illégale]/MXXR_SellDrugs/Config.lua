Config = {}

Config.Style = "Gta:O" -- Choisissez le style des menus (Gta:O ou pMenu)
Config.ScaleForm = true -- Mettre une animation sur la bannière du menu (style Gta:O)
Config.ArrowsOnly = true -- Mettre une barre sous le menu (estétique)
Config.HeaderColor = {255, 255, 255} -- Changer la couleur du menu
Config.Header = {"commonmenu", "interaction_bgd"} -- Changer la bannière du menu
Config.AllowTitle = false -- Activer ou désactiver les titres sur les menus
Config.HeaderOpacity = 255 -- Changer l'oppacité du menu

Config.Extented = "es_extented" -- Nom de votre extented
Config.ESX = "esx" -- Si vous utilisez une version rename de ESX
Config.Jobname = "Job" -- Laissez la première lettre en majuscule
Config.Job2name = "Job2" -- Laissez la première lettre en majuscule

CustomFrameWorkExport = function()
    TriggerEvent('esx:getSharedObject',function (obj)
        ESX=obj
    end) -- A remplacer si besoin par votre export
end

Config.UseOtherNotification = false -- Choisir si vous utilisez un script de notifications ou les ESX.ShowNotification
Config.CommandName = "drugs"
Config.Command = false -- Si vous voulez ouvrir le menu seulement via commande et non avec une touche
Config.Touche = "F11" -- Choisir la touche pour ouvrir le menu
Config.TypeMoney = "$" -- Choisir la devise monetaire
Config.TimeBeforeDeleteBlips = 450000 -- temps avant que le blips s'enlève après avoir pris l'appel de police (1000 = 1 seconde)
Config.Hours = false -- Si vous voulez que l'on puisse vendre que la nuit
Config.HoursNotOpen = {0, 0} -- Horaire ou l'on peut pas vendre (ex là on peut vendre que de 21h a 6h)

ShowNotificationMX = function(msg)
    ESX.ShowNotification(msg) -- Vous pouvez ici changer et mettre votre export de notification si vous le souhaitez 
    --exports['votre script']:notif("Drogue", msg, 5000, 'info') ------- > Voici un exemple
end

Config.Drugs = { -- Ajoutez ici des drogues
    {name = "Pochon de Coke", item = "coke_pooch", price = {200, 300}, maxsell = 5},
    {name = "Pochon de Weed", item = "weed_pooch", price = {100, 200}, maxsell = 8},
    {name = "Pochon de Hashish", item = "hashish_pooch", price = {300, 700}, maxsell = 3},
--    {name = "Meth", item = "meth", price = {80, 100}, maxsell = 2},
}

Config.TimeSell = { -- Temps entre chaque vente (1000 = 1 sec)
    min = 4500,
    max = 8500
}

Config.DistSell = { -- Indiquez ici la distance entre le ped et vous au spawn
    min_distance = 60,
    max_distance = 70
}

Config.MinCops = 0 -- Minimum de policier pour vendre
Config.CallPolice = true -- Si vous souhaitez que la police puisse être contacté

Config.JobPolice = {
    "police",
    "bcso",
    --"sheriff",
}

Config.ChanceCallPolice = { -- Changez les chances que le ped appel la police
    min = 1,
    max = 6,
}

Config.DistWithZone = 300 -- Distance maximum par rapport à la zone

Config.ZoneForSell = { -- Vous pouvez ne pas en mettre afin de vendre partout
    {name = "Aeroport", pos = {x = -966.68762207031, y = -2609.9228515625, z = 13.980996131897}},
    {name = "ZoneIndustrielle", pos = {x = 873.80920410156, y = -926.64526367188, z = 26.271438598633}},
    {name = "GauchePacific", pos = {x = 115.690574646, y = 318.43969726563, z = 112.13667297363}}
}

Config.Ped = {
    "a_m_m_og_boss_01",
    "a_m_m_skidrow_01",
    "a_m_m_hillbilly_02",
    "a_m_o_soucent_02",
    "a_m_y_downtown_0",
    "a_m_y_soucent_02"   
}

Config.AnimationsSell = { -- Changer ou ajouter des animations pour les peds (aléatoire)
    {name = "WORLD_HUMAN_SMOKING_POT"},
}

Config.TimeBeforeCallPolice = 5000 -- (1000 = 1 seconde)
Config.BlackMoney = true -- Si vous souhaitez que la vente rapport de l'argent sale