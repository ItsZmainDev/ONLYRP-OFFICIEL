Config = {}
Config.Style = "Gta:O" -- Choisissez le style des menus (Gta:O ou pMenu)
Config.ScaleForm = true -- Mettre une animation sur la bannière du menu (style Gta:O)
Config.ArrowsOnly = true -- Mettre une barre sous le menu (estétique)
Config.RenameMenu = true -- Titre des menus évolutifs en fonction de la custom en cours
Config.HeaderColor = {255, 255, 255} -- Changer la couleur du menu
Config.Header = {"commonmenu", "interaction_bgd"} -- Changer la bannière du menu
Config.AllowTitle = true -- Activer ou désactiver les titres sur les menus
Config.HeaderOpacity = 255 -- Changer l'oppacité du menu

Config.Extended = "es_extended" -- Nom de votre extented
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
Config.WebHookLsCustom = "https://discord.com/api/webhooks/1124353045665427617/B0QVMCrJot3pKgw54msq_enjMnAMWnNR5HrYQELUqw2X394INyfR69Zfmw5dSDciwHoc"
Config.VehicleTable = true -- A désactiver si vous n'avez pas la table véhicule dans votre base de donnée
Config.OwnedVehicleTable = true -- A désactiver si vous n'avez pas la table owned_véhicule dans votre base de donnée
Config.DrawMarker = true -- Si vous souhaitez avoir le drawmarker au sol

ShowNotificationMX = function(msg)
    ESX.ShowNotification(msg) -- Vous pouvez ici changer et mettre votre export de notification si vous le souhaitez 
    --exports['votre script']:notif("Drogue", msg, 5000, 'info') ------- > Voici un exemple
end

GetSocietyAccount = function(societyName)
	local society = exports['ZmainDev']:getSociety(societyName)
	return society
end

GetSocietyMoney = function(society)
	return society.getSocietyMoney()
end

RemoveSocietyMoney = function(society, amount)
	society.removeSocietyMoney(amount)
end

Config.JobOnly = true -- LsCustom géré par le mécano ou non
Config.AllowBill = true -- Boutton Facture

BillingFunction = function(playerid, amount, reason, society, societyname)
	--TriggerServerEvent("MXXR_SendBillSociety", amount, reason, playerid, society, societyname, true) -- Si vous utilisez le MXXR_Billing

	TriggerServerEvent("esx_billing:sendBill", playerid, society, societyname, amount) -- Si vous utilisez le esx_billing
end

Config.PourcentageCustom = 1.2 -- Marge de prix pour le job
Config.DefaultPriceVehicle = 110000 -- Prix de base des véhicules si il ne sont pas au concess dans la table vehicles

Config.Points = {
	LsCustom = {
		upgrade = true, -- Si vous souhaitez activer les upgrades
		custom = true, -- Si vous souhaitez activer les customs estétiques
		extra = true, -- Si vous voulez activer les customs d'extras
		liveries = true, -- Si vous voulez activer les customs liveries
		Pos = { x = -208.48818969727, y = -1336.0815429688, z = 31.000485610962},
		Job = "mecano",
		Name = "LsCustom",
		Notif = "Appuyez sur ~INPUT_PICKUP~ pour personnaliser le véhicule.",
		Blips = false,
		BlipsName = "LsCustom",
	},
}

Config.VehiclesPrice = { -- Si vous souhaitez directement ajuster le prix de certains véhicules
	["sultan"] = 25000, -- exemple
}

Config.MXUpgrades = {
	{name = "Turbo", modName = "modTurbo", modType = 17, price = {4.7}, ask = ">", askX = true},
	{name = "Moteur", modName = "modEngine", modType = 11, price = {1.2, 3.4, 5.5, 7.6, 9.7}, ask = ">", askX = true},
	{name = "Freins", modName = "modBrakes", modType = 12, price = {0.4, 2.55, 4.75, 6.80}, ask = ">", askX = true},
	{name = "Transmission", modName = "modTransmission", modType = 13, price = {2.3, 4.5, 5.6, 6.7}, ask = ">", askX = true},
	{name = "Suspension", modName = "modSuspension", modType = 15, price = {2.7, 3.9, 4.1, 4.3, 4.4, 4.8}, ask = ">", askX = true},
--	{name = "Armure", modName = "modArmor", modType = 16, price = {69.77, 116.28, 130.00, 150.00, 180.00, 190.00, 200.05}, ask = ">", askX = true},
}

Config.MXCosmetiques = {
	{name = "Accessoires", modName = "modOrnaments", modType = 28, price = 0.9, ask = ">", askX = true},
	{name = "Motif exterieur", modName = "modTrimB", modType = 44, price = 3.05, ask = ">", askX = true},
	{name = "Antenne", modName = "modAerials", modType = 43, price = 1.12, ask = ">", askX = true},
	{name = "Autocollants",	modName = "modLivery", modType = 48, price = 3.3, ask = ">", askX = true},
	{name = "Bloc Moteur", modName = "modEngineBlock", modType = 39, price = 3.12, ask = ">", askX = true},
	{name = "Bouchon du réservoir",	modName = "modTank", modType = 45, price = 3.19, ask = ">", askX = true},
	{name = "Carosserie", mod = "carosserie", ask = ">", askX = true}, 
	{name = "Coffre", modName = "modTrunk", modType = 37, price = 2.58, ask = ">", askX = true},
	{name = "Cadran", modName = "modDial", modType = 30, price = 4.19, ask = ">", askX = true},
	{name = "Entretoises", modName = "modStruts", modType = 41, price = 5.51, ask = ">", askX = true},
	{name = "Fenêtres", modName = "windowTint", modType = 'windowTint', price = 1.12, ask = ">", askX = true},
	{name = "Options Fenêtres", modName = "modWindows", modType = 46, price = 3.19, ask = ">", askX = true},
	{name = "Filtre à air", modName = "modAirFilter", modType = 40, price = 3.72, ask = ">", askX = true},
	{name = "Vitre", modName = "modSpeakers", modType = 36, price = 3.98, ask = ">", askX = true},
	{name = "Haut Parleur Porte", modName = "modDoorSpeaker", modType = 31, price = 3.58, ask = ">", askX = true},
	{name = "Style intérieur", modName = "modTrimA", modType = 27, price = 3.98, ask = ">", askX = true},
	{name = "Klaxon", modName = "modHorns", modType = 14, price = 1.12, ask = ">", askX = true},
	{name = "Levier de vitesse", modName = "modShifterLeavers", modType = 34, price = 2.26, ask = ">", askX = true},
	{name = "Néons", modName = "neonEnabled", modType = 'neonColor', price = 1.12, ask = ">", askX = true},
	{name = "Couverture", modName = "modArchCover", modType = 42, price = 3.19, ask = ">", askX = true},
	{name = "Peinture", modName = "colorPrimary", mod = "respray", ask = ">", askX = true}, 
	{name = "Phares", modName = "modXenon", modType = 22, price = 3.72, ask = ">", askX = true},
	{name = "Couleurs Phares", modName = "colorXenon", modType = "colorXenon", price = 2.78, ask = ">", askX = true},
	{name = "Plage arrière", modName = "modAPlate", modType = 35, price = 3.19, ask = ">", askX = true},
	{name = "Plaque", modName = "plateIndex", modType = 'plateIndex', price = 1.1, ask = ">", askX = true},
	{name = "Support de plaque", modName = "modPlateHolder", modType = 25, price = 1.49, ask = ">", askX = true},
	{name = "Plaque avant", modName = "modVanityPlate", modType = 26, price = 0.5, ask = ">", askX = true},
	{name = "Roues", modName = "customWheel", mod = "roues", ask = ">", askX = true}, 
	{name = "Sièges", modName = "modSeats", modType = 32, price = 2.65, ask = ">", askX = true},
	{name = "Suspension hydraulique", modName = "modHydrolic", modType = 38, price = 2.12, ask = ">", askX = true},
	{name = "Tableau de bord", modName = "modDashboard", modType = 29, price = 2.65, ask = ">", askX = true},
	{name = "Volant", modName = "modSteeringWheel", modType = 33, price = 2.19, ask = ">", askX = true}
}

Config.MXCarosserie = {
	{name = "Aileron", modName = "modSpoilers", modType = 0, price = 2.65, ask = ">", askX = true},
	{name = "Pare-choc avant", modName = "modFrontBumper", modType = 1, price = 2.12, ask = ">", askX = true},
	{name = "Pare-choc arrière", modName = "modRearBumper", modType = 2, price = 2.12, ask = ">", askX = true},
	{name = "Bas de caisse", modName = "modSideSkirt", modType = 3, price = 2.65, ask = ">", askX = true},
	{name = "Pot d'échappement", modName = "modExhaust", modType = 4, price = 1.12, ask = ">", askX = true},
	{name = "Cage", modName = "modFrame", modType = 5, price = 1.12, ask = ">", askX = true},
	{name = "Grille", modName = "modGrille", modType = 6, price = 3.72, ask = ">", askX = true},
	{name = "Capot", modName = "modHood", modType = 7, price = 2.88, ask = ">", askX = true},
	{name = "Aile Gauche", modName = "modFender", modType = 8, price = 3.12, ask = ">", askX = true},
	{name = "Aile Droite", modName = "modRightFender", modType = 9, price = 3.12, ask = ">", askX = true},
	{name = "Toit", modName = "modRoof", modType = 10, price = 2.58, ask = ">", askX = true},
}

Config.MXNeons = {
	{name = "Couleur néons", modType = 'neonColorr', price = 1.12, ask = ">", askX = true},
	{name = "Néon gauche", neon = "gauche", neonNumber = 0, price = 3.2, ask = ">", askX = true},
	{name = "Néon droit", neon = "droit", neonNumber = 1, price = 3.2, ask = ">", askX = true},
	{name = "Néon avant", neon = "avant", neonNumber = 2, price = 3.2, ask = ">", askX = true},
	{name = "Néon arrière", neon = "arrière", neonNumber = 3, price = 3.2, ask = ">", askX = true}, 
}

Config.MXPeinture = {
	{name = "Primaire", price = 1.10, ask = ">", askX = true},
	{name = "Secondaire", price = 1.10, ask = ">", askX = true},
	{name = "Nacré", price = 1.10, ask = ">", askX = true} 
}

Config.MXRoues = {
	{name = "Jantes", price = 1.50, mod = "typejante", ask = ">", askX = true}, 
	{name = "Couleurs jantes", price = 1.50, mod = "wheelColor", ask = ">", askX = true},
	{name = "Fumée des pneus", price = 1.50, modType = 'tyreSmokeColor', ask = ">", askX = true}
}

Config.MXWheelType = {
	{name = "Jantes Sport", modName = "modFrontWheels", modType = 23, wheelType = 0, price = 1.65, ask = ">", askX = true},
	{name = "Jantes Muscle", modName = "modFrontWheels", modType = 23, wheelType = 1, price = 1.65, ask = ">", askX = true},
	{name = "Jantes Lowrider", modName = "modFrontWheels", modType = 23, wheelType = 2, price = 1.65, ask = ">", askX = true},
	{name = "Jantes SUV", modName = "modFrontWheels", modType = 23, wheelType = 3, price = 1.65, ask = ">", askX = true},
	{name = "Jantes Tout-terrain", modName = "modFrontWheels", modType = 23, wheelType = 4, price = 1.65, ask = ">", askX = true},
	{name = "Jantes Tuning", modName = "modFrontWheels", modType = 23, wheelType = 5, price = 1.65, ask = ">", askX = true},
	{name = "Jantes Moto", modName = "modFrontWheels", modType = 23, wheelType = 6, price = 1.65, ask = ">", askX = true},
	{name = "Jantes Haut de gamme", modName = "modFrontWheels", modType = 23, wheelType = 7, price = 1.65, ask = ">", askX = true}
}
