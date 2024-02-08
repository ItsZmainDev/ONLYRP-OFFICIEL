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

ShowNotificationMX = function(msg)
    ESX.ShowNotification(msg) -- Vous pouvez ici changer et mettre votre export de notification si vous le souhaitez 
    --exports['votre script']:notif("Drogue", msg, 5000, 'info') ------- > Voici un exemple
end

Config.Command = "doors" -- Nom de la commande pour ouvrir le menu
Config.UseJob2 = true -- Si vous utilisez le job2
Config.SizeText = 1 -- Changer la taille de l'écriture de la porte
Config.DistDoors = 2.2 -- Distance entre la porte et le joueur pour la fermer
Config.DistDoorsGarage = 25 -- Distance entre la porte de garage et le joueur pour la fermer

Config.TextClose = "~r~Appuyez sur E 🔒" -- Texte pour la porte fermée
Config.TextOpen = "~g~Appuyez sur E 🔓" -- Texte pour la porte ouverte

Config.TextNoJobClose = "~r~Fermé 🔒" -- Texte pour la porte fermée si vous n'avez pas le job
Config.TextNoJobOpen = "~g~Ouvert 🔓" -- Texte pour la porte ouverte si vous n'avez pas le job

Config.Groups = { -- Choisir vos grade staff pouvant acceder au menu
    "responsable",
    "developper",
    "fondateur",
}

Config.DoorList = {}