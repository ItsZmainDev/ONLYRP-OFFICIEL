Config = {}

Config.AllTattooList = json.decode(LoadResourceFile(GetCurrentResourceName(), 'AllTattoos.json'))
Config.TattooCats = {
	{"ZONE_HEAD", "Tête", {vec(0.0, 0.7, 0.7), vec(0.7, 0.0, 0.7), vec(0.0, -0.7, 0.7), vec(-0.7, 0.0, 0.7)}, vec(0.0, 0.0, 0.5)},
	{"ZONE_LEFT_LEG", "La jambe gauche", {vec(-0.2, 0.7, -0.7), vec(-0.7, 0.0, -0.7), vec(-0.2, -0.7, -0.7)}, vec(-0.2, 0.0, -0.6)},
	{"ZONE_LEFT_ARM", "Bras gauche", {vec(-0.4, 0.5, 0.2), vec(-0.7, 0.0, 0.2), vec(-0.4, -0.5, 0.2)}, vec(-0.2, 0.0, 0.2)},
	{"ZONE_RIGHT_LEG", "Jambe droite", {vec(0.2, 0.7, -0.7), vec(0.7, 0.0, -0.7), vec(0.2, -0.7, -0.7)}, vec(0.2, 0.0, -0.6)},
	{"ZONE_TORSO", "Torse", {vec(0.0, 0.7, 0.2), vec(0.0, -0.7, 0.2)}, vec(0.0, 0.0, 0.2)},
	{"ZONE_RIGHT_ARM", "Bras droit", {vec(0.4, 0.5, 0.2), vec(0.7, 0.0, 0.2), vec(0.4, -0.5, 0.2)}, vec(0.2, 0.0, 0.2)},
	{'ZONE_RESET', 'Reset ses tatouages', {vec(0.4, 0.5, 0.2), vec(0.7, 0.0, 0.2), vec(0.4, -0.5, 0.2)}, vec(0.2, 0.0, 0.2)},
}

Config_Shops = {
	[1] = {
		pos = vector3(1321.6442871094, -1654.1978759766, 52.276870727539),
	},
	[2] = {
		pos = vector3(-1155.3806152344, -1427.7735595703, 4.9559531211853),
	},
	[3] = {
		pos = vector3(325.33511352539, 180.5510559082, 103.58806610107),
	},
	[4] = {
		pos = vector3(-3169.8854980469, 1078.4384765625, 20.830659866333),
	},
	[5] = {
		pos = vector3(1865.3620605469, 3746.7097167969, 33.029369354248),
	},
	[6] = {
		pos = vector3(-294.99905395508, 6200.703125, 31.488094329834)
	},
}
