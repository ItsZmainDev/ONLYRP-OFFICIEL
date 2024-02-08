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

ShowAdvancedNotificationMX = function(title1, title2, message, img, icone)
	TriggerEvent(Config.ESX..':showAdvancedNotification', title1, title2, message, img, icone)
end

TriggerFonctionRepairMX = function(vehicle)
	-- Si vous avez un trigger particulier pour réparer le véhicule
end

Config.DisableBilling = false -- Si vous voulez désactiver le bouton facture du menu (si vous utilisez un autre script de facture comme le MXXR_Billing par exemple)
Config.TriggerBilling = "esx_billing:sendBill" -- Trigger du billing (uniquement si vous n'utilisez pas le MXXR_Billing)
Config.ItemPaySociety = false -- SI vous souhaitez que le prix des outils soit enlevé à la société et non au joueur
Config.NameEventFourriere = "" -- Nom de l'event de la mise en fourriere si vous en avez un
Config.StockHayes = true -- Si vous souhaitez avoir un point de stockage

Config.Notif = {
	title1 = "Hayes Mechanic",
	title2 = "~b~Annonce Mecano",
	img = "CHAR_JIMMY_BOSTON",
	icone = 2
}

Config.Tenues = {
	male = {
        ['bags_1'] = 50, ['bags_2'] = 0,
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 363,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 29,
        ['pants_1'] = 210,   ['pants_2'] = 0,
        ['shoes_1'] = 200,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['bags_1'] = 71,  ['bags_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0
    },
	female = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 455,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 72,
        ['pants_1'] = 213,   ['pants_2'] = 0,
        ['shoes_1'] = 113,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['bags_1'] = 121,  ['bags_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0
	}
}

Config.VehicleHayes = {
	{name = "Plateau", carnamespawn = "flatbed", coord = vector4(-357.212, -159.317, 38.728, 33.815), ask = ">", askX = true},
	{name = "Petite Dépaneuse", carnamespawn = "towtruck2", coord = vector4(-357.212, -159.317, 38.728, 33.815), ask = ">", askX = true},
	{name = "Dépaneuse", carnamespawn = "towtruck", coord = vector4(-357.212, -159.317, 38.728, 33.815), ask = ">", askX = true},
	{name = "Mini", carnamespawn = "issi2", coord = vector4(-357.212, -159.317, 38.728, 33.815), ask = ">", askX = true},
	{name = "Dilettante", carnamespawn = "dilettante", coord = vector4(-357.212, -159.317, 38.728, 33.815), ask = ">", askX = true},
	{name = "Baller", carnamespawn = "baller2", coord = vector4(-357.212, -159.317, 38.728, 33.815), ask = ">", askX = true},
	{name = "Dubsta", carnamespawn = "dubsta", coord = vector4(-357.212, -159.317, 38.728, 33.815), ask = ">", askX = true},
	{name = "Camion", carnamespawn = "master2019", coord = vector4(-357.212, -159.317, 38.728, 33.815), ask = ">", askX = true},
}

Config.Outils = {
	{name = "Pneu", prix = 15, itemname = "pneu"},
	{name = "Pince", prix = 15, itemname = "pince"},
	{name = "Chiffon", prix = 15, itemname = "chiffon"},
	{name = "Kit Moteur", prix = 15, itemname = "kitmoteur"},
	{name = "Kit Carosserie", prix = 15, itemname = "kitcarro"},
}


Config.BlipsMecano = {
	{
		BlipsName = "[ENTREPRISE] Hayes Mecano",
		Scale = 0.9,
		Colour = 46,
		Sprite = 402,
		x = -357.392,
		y = -125.137,
		z = 38.697
	},
}

Config.HayesOutilss = {
    {x = -351.59, y = -171.98, z = 38.02},
}

Config.Delete = {
    {x = -356.353, y = -160.953, z = 37.728},
}

Config.Extra = {
    {x = -349.676, y = -131.127, z = 38.021},
}

Config.Boss = {
    {x = -338.682, y = -157.695, z = 43.587},
}

Config.Garage = {
    {x = -354.827, y = -166.185, z = 38.015},
}

Config.Tenue = {
    {x = -340.322, y = -161.104, z = 43.587},
}

