Config = {}

Config.Style = "Gta:O" -- Choisissez le style des menus (Gta:O ou pMenu)
Config.ScaleForm = true -- Mettre une animation sur la bannière du menu (style Gta:O)
Config.ArrowsOnly = true -- Mettre une barre sous le menu (estétique)

Config.ESX = "esx" -- Si vous utilisez une version rename de ESX
Config.UseOtherNotification = false -- Choisir si vous utilisez un script de notifications ou les ESX.ShowNotification
Config.TypeMoney = "$"

ShowNotificationMX = function(msg)
    ESX.ShowNotification(msg) -- Vous pouvez ici changer et mettre votre export de notification si vous le souhaitez 
    --exports['votre script']:notif("Drogue", msg, 5000, 'info') ------- > Voici un exemple
end

Config.Vehiculevole = false -- Permet d'autorisé ou non de rentrer des véhicules de pnj ou d'autres joueurs volé (le système est fait pour que aucune duplication soit possible)
Config.VehicleVolePNJ = false -- Choisir si l'on peut rentrer des véhicules de pnj (que si le Config.Vehiculevole est activé)

Config.FourriereMecano = false -- Choisir si la fourrière est géré par le mecano ou non
Config.VehiculeVoleEnFourriere = false -- Choisir si les véhicules volés vont à la fourrière ou non

Config.SaveDegats = true -- Activer la save des dégats ou non
Config.SaveEssence = true -- Activer la save de l'essence

Config.JobFourriere = {"mecano", "hayes", "fourriere"} -- Job qui gère la fourrière (3 jobs max)
Config.PriceFourriere = 1000 -- Définis le prix de la fourriere automatique
Config.GetVehicleInMap = true -- Si ce paramètre est activé, si vous allez à la fourrière chercher votre véhicule mais qu'il est encore sur la map quelque part vous ne pourrez pas le récuperer

Config.PayReparations = true -- Si vous souhaitez que les joueurs doivent payer et réparer leur véhicule pour le rentrer
Config.TauxReparation = 90 -- Pour ajuster le prix des réparations si vous avez activé le Config.PayReparations
Config.PayementBanque = true -- Si vous souhaitez payer les réparations avec l'argent bancaire et non liquide

Config.BlipsGarage = false -- Activer les blips garage
Config.BlipsFourriere = false -- Activer les blips fourriere

Config.Fourriere = {
	Mechanic = {	
		Position = {x=495.612, y=-1340.336, z=28.314},
		PointSpawn = {
			Position = {x=491.553, y=-1332.421, z=29.335},
			Direction = 314.839,	
		},
	},
}

Config.Garages = {
	Garage_1  = {	
		Position = {x=215.800, y=-810.057, z=29.727},
		PointSpawn = {
			Position = {x=229.700, y=-800.1149, z=30.5722}, -- Position spawn voiture
			Direction = 157.84,	
		},
		PointDelet = {
			Position = {x=215.124, y=-791.377, z=29.846},
		},
	},
	Garage_2 = {	
		Position = {x=1501.2, y=3762.19, z=33.0},
		PointSpawn = {
			Position = {x=1496.145, y=3756.902, z=33.900},
			Direction = 209.799,
		},
		PointDelet = {
			Position = {x=1504.1, y=3765.55, z=33.0},
		},
	},
	Garage_3 = {	
		Position = {x=105.359, y=6613.586, z=31.3973},
		PointSpawn = {
			Position = {x=128.7822, y=6622.9965, z=31.7828},
			Direction = 157.84,
		},
		PointDelet = {
			Position = {x=126.3572, y=6608.4150, z=30.8565},
		},
	},
	Garage_4 = {	
		Position = {x=-977.21661376953, y=-2710.3798828125, z=12.853487014771},
		PointSpawn = {
			Position = {x=-971.029, y=-2695.842, z=13.830},
			Direction = 143.641,
		},
		PointDelet = {
			Position = {x=-966.88208007813, y=-2709.9028320313, z=12.83367729187},
		},
	},
}