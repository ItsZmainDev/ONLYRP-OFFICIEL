Config = {}

Config.Style = "Gta:O" -- Choisissez le style des menus (Gta:O ou pMenu)
Config.ScaleForm = true -- Mettre une animation sur la bannière du menu (style Gta:O)
Config.ArrowsOnly = true -- Mettre une barre sous le menu (estétique)
Config.HeaderColor = {255, 255, 255} -- Changer la couleur du menu
Config.Header = {"commonmenu", "interaction_bgd"} -- Changer la bannière du menu
Config.AllowTitle = true -- Activer ou désactiver les titres sur les menus
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
Config.TypeMoney = "$" -- Choisir la devise monetaire

ShowNotificationMX = function(msg)
    ESX.ShowNotification(msg) -- Vous pouvez ici changer et mettre votre export de notification si vous le souhaitez 
    --exports['votre script']:notif("Drogue", msg, 5000, 'info') ------- > Voici un exemple
end

Config.Pourcentage = 1.35 -- Pourcentage des prix par rapport à la base de données
Config.TableCategories = "vehicle_catalogue"
Config.TableVehicle = "vehicules"

Config.Colories = {
    {name = "Noir", plaque = "CTLG", Colour = noir, r = 0, g = 0, b = 0, checkbox = false},
    {name = "Blanc", plaque = "CTLG", Colour = blanc, r = 255, g = 255, b = 255, checkbox = false},
    {name = "Rouge", plaque = "CTLG", Colour = rouge, r = 255, g = 0, b = 0, checkbox = false},
    {name = "Orange", plaque = "CTLG", Colour = orange, r = 255, g = 119, b = 1, checkbox = false},
    {name = "Jaune", plaque = "CTLG", Colour = jaune, r = 255, g = 209, b = 1, checkbox = false},
    {name = "Vert", plaque = "CTLG", Colour = vert, r = 3, g = 193, b = 1, checkbox = false},
    {name = "Violet", plaque = "CTLG", Colour = violet, r = 153, g = 0, b = 231, checkbox = false},
    {name = "Marron", plaque = "CTLG", Colour = marron, r = 133, g = 73, b = 0, checkbox = false},
    {name = "Rose", plaque = "CTLG", Colour = rose, r = 211, g = 40, b = 250, checkbox = false},
    {name = "Beige", plaque = "CTLG", Colour = beige, r = 238, g = 192, b = 73, checkbox = false}
}


Config.Concess = {
    { x = -720.7354, y = -425.7303, z = 35.04042}
}

Config.Garage = {
    { x = 1110.093, y = -3166.163, z = -37.518}
}

Config.Catalogue = {
    { x = 1106.089, y = -3153.851, z = -37.518}
}

Config.SpawnVehicleEssaie = {
    { x = 892.755, y = -3224.898, z = 5.900, h = 265.493}
}

Config.SpawnVehicle = {
    { x = 1101.66, y = -3147.05, z = -38.85, h = 142.7}
}
