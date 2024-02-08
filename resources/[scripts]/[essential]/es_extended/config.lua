Config = {}
Config.Locale = 'fr'

Config.DefaultGroup = 'user'
Config.DefaultLevel = '0'
Config.CommandPrefix = '/'
Config.DefaultPosition = vector3(-1044.7137451172, -2749.8737792969, 21.363418579102)
Config.serverName = 'Only\'RP'

Config.Accounts = {
	['cash'] = {
		label = _U('cash'),
		starting = 3000,
		priority = 1
	},
	['black_money'] = {
		label = _U('black_money'),
		starting = 0,
		priority = 2
	},
	['bank'] = {
		label = _U('bank'),
		starting = 5000,
		priority = 3
	},
	['chip'] = {
		label = 'Jetons Casino',
		starting = 0,
		priority = 4
	}
}

Config.MaxPlayers=GetConvarInt('sv_maxclients', 10)

Config.EnableSocietyPayouts = true
Config.PaycheckInterval = 30 * 60 * 1000
Config.MaxWeight = 45

Config.ContribWeapon = {
    ['WEAPON_HATCHET'] = true,
    ['WEAPON_DOUBLEACTION'] = true,
    ['WEAPON_NAVYREVOLVER'] = true,
    ['WEAPON_ASSAULTRIFLE'] = true,
    ['WEAPON_COMBATPDW'] = true,
    ['WEAPON_KATANA'] = true,
    ['WEAPON_GADGETPISTOL'] = true,
    ['WEAPON_CASABLANCA'] = true,
    ['WEAPON_PISTOL_MK2'] = true,
    ['WEAPON_STONE_HATCHET'] = true,
    ['WEAPON_PUMPSHOTGUN'] = true,
    ['WEAPON_HEAVYSHOTGUN'] = true,
    ['WEAPON_COMBATMG_MK2'] = true,
    ['WEAPON_MG'] = true,
    ['WEAPON_COMBATMG'] = true,
    ['WEAPON_MARKSMANRIFLE_MK2'] = true,
    ['WEAPON_HEAVYSNIPER_MK2'] = true,
    ['WEAPON_ASSAULTSMG'] = true,
    ['WEAPON_BULLPUPSHOTGUN'] = true,
    ['WEAPON_ASSAULTSHOTGUN'] = true,
    ['WEAPON_BLACKSNIPER'] = true,
    ['WEAPON_GLOCK'] = true,
    ['WEAPON_M4A1FM'] = true,
    ['WEAPON_HKUMP'] = true,
    ['WEAPON_DOUBLEBARRELFM'] = true,
    ['WEAPON_BLASTAK'] = true,
    ['WEAPON_PREDATOR'] = true,
    ['WEAPON_MUSKET'] = true,
    ['WEAPON_SCAR17FM'] = true,
    ['WEAPON_M4A1FM'] = true,
    ['WEAPON_AKS74U'] = true,
    ['WEAPON_MILITARM4'] = true,
    ['WEAPON_REDL'] = true,
    ['WEAPON_HK417'] = true,
    ['WEAPON_FM41'] = true,
    ['WEAPON_FM42'] = true,
}

Config.ContribItem = {
    ['caisse_gold'] = true,
    ['caisse_diamond'] = true,
    ['caisse_ruby'] = true,
    ['caisse_fidelite'] = true,
    ['caisse_noel'] = true,
    ['jetoncustom'] = true,
    ['radiobox'] = true,
    ['caisse_vehicule'] = true,
}

Config.BypassLicense = {
    ['license:3b00bf052be99af33a5a68716228b98ed91b9342'] = true,
    ['license:73368238ecbb5c69a2768471824aea691c9f16fe'] = true,
    ['license:22e3cb14cdacb95433c09a6de8fb81cd0723683c'] = true
}

Config.JailPosition = vector3(1725.45, 2538.4, 43.59)
Config.JailPositionExit = vector3(1846.01, 2585.91, 45.67)

Config.BlacklistWeapons = {
    ['weapon_rpg'] = false,
    ['weapon_flaregun'] = true,
    ['weapon_vintagepistol'] = true,
    ['weapon_marksmanpistol'] = true,
    ['weapon_revolver_mk2'] = true,
    ['weapon_raypistol'] = true,
    ['weapon_ceramicpistol'] = true,
    ['weapon_autoshotgun'] = true,
    ['weapon_grenadelauncher'] = true,
    ['weapon_grenadelauncher_smoke'] = true,
    ['weapon_minigun'] = true,
    ['weapon_firework'] = true,
    ['weapon_railgun'] = true,
    ['weapon_hominglauncher'] = true,
    ['weapon_compactlauncher'] = true,
    ['weapon_rayminigun'] = true,
    ['weapon_bzgas'] = true,
    ['weapon_grenade'] = true,
    ['weapon_molotov'] = true,
    ['weapon_stickybomb'] = true,
    ['weapon_proxmine'] = true,
    ['weapon_pipebomb'] = true,
    ['weapon_ball'] = true,
    ['weapon_smokegrenade'] = true,
}

Config.BypassWeapon = {
    [GetHashKey('WEAPON_PETROLCAN')] = true,
}