Config = {}

Config.Locale = 'fr'

-- Set the time (in minutes) during the player is outlaw
Config.Timer = 1

-- Set if show alert when player use gun
Config.GunshotAlert = true

-- Set if show when player do carjacking
Config.CarJackingAlert = true

-- Set if show when player fight in melee
Config.MeleeAlert = false

-- In seconds
Config.BlipGunTime = 35

-- Blip radius, in float value!
Config.BlipGunRadius = 200.0

-- In seconds
Config.BlipMeleeTime = 7

-- Blip radius, in float value!
Config.BlipMeleeRadius = 50.0

-- In seconds
Config.BlipJackingTime = 50

-- Blip radius, in float value!
Config.BlipJackingRadius = 50.0

-- Show notification when cops steal too?
Config.ShowCopsMisbehave = false

-- Jobs in this table are considered as cops
Config.WhitelistedCops = {
	'police',
	'gouvernement',
	'fbi',
	'bcso',
}