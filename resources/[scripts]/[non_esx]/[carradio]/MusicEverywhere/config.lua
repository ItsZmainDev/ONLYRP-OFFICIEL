Config = {}

Config.DistanceToVolume = 30.0 -- The distance that will be with the volume at 1.0, so if the volume is 0.5 the distance will be 15.0, if the volume is 0.2 the distance will be 6.

Config.PlayToEveryone = true -- The music in car will be played to everyone? Or just for the people that are in that vehicle? If false the DistanceToVolume will not do anything

Config.ItemInVehicle = false -- Put here, if you want the radio to be an item, inside "", like "radio". With or false you will need to do /carradio

Config.CommandVehicle = "carradio" -- Only will work if Config.ItemInVehicle == false

Config.Zones = {
	{
		name = "NightClub Zone", -- The name of the radio, it doesn't matter
		coords = vector3(-418.957,-27.68,36.299), -- the position where the music is played
		job = "nightclub", --the job that can change the music
		range = 55.0, -- the range that music can be heard
		volume = 0.1, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-418.957,-27.68,41.299) -- where the player can change the music
	},
	{
		name = "Studio Zone", -- The name of the radio, it doesn't matter
		coords = vector3(-1000.988,-282.42,44.797), -- the position where the music is played
		job = nil, --the job that can change the music
		range = 1.0, -- the range that music can be heard
		volume = 0.1, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-1003.450,-280.75,44.766) -- where the player can change the music
	},
	{
		name = "Studio Zone2", -- The name of the radio, it doesn't matter
		coords = vector3(-1006.749,-289.20,44.797), -- the position where the music is played
		job = nil, --the job that can change the music
		range = 0.7, -- the range that music can be heard
		volume = 0.1, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-1010.239,-288.98,44.803) -- where the player can change the music
	},
	{
		name = "Unicorn", -- The name of the radio, it doesn't matter
		coords = vector3(121.45294952393,-1280.7805175781,29.480453491211), -- the position where the music is played
		job = "unicorn", --the job that can change the music
		range = 20.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(121.45294952393,-1280.7805175781,29.480453491211) -- where the player can change the music 
	},
	{
		name = "Bahamas", -- The name of the radio, it doesn't matter
		coords = vector3(-1376.4898681641,-607.52362060547,31.319871902466), -- the position where the music is played
		job = "bahamas", --the job that can change the music
		range = 20.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-1376.4898681641,-607.52362060547,31.319871902466) -- where the player can change the music
	},
	{
		name = "Salieris", -- The name of the radio, it doesn't matter
		coords = vector3(417.452,-1497.479,30.155), -- the position where the music is played
		job = "salieris", --the job that can change the music
		range = 20.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(417.452,-1497.479,30.155) -- where the player can change the musicq
	},
	{
		name = "Mecano", -- The name of the radio, it doesn't matter
		coords = vector3(-215.8687, -1311.442, 31.29652), -- the position where the music is played
		job = "mecano", --the job that can change the music
		range = 20.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-215.8687, -1311.442, 31.29652) -- where the player can change the musicq
	},
	{
		name = "Tequilala", -- The name of the radio, it doesn't matter
		coords = vector3(-560.925,281.652,85.676), -- the position where the music is played
		job = "tequilala", --the job that can change the music
		range = 20.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-560.925,281.652,85.676) -- where the player can change the musicq
	},
	{
		name = "Vigne", -- The name of the radio, it doesn't matter
		coords = vector3(126.15879821777,-1035.4818115234,29.277904510498), -- the position where the music is played
		job = "vigne", --the job that can change the music
		range = 20.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(126.15879821777,-1035.4818115234,29.277904510498) -- where the player can change the musicq
	},
	{
		name = "Pilotis", -- The name of the radio, it doesn't matter
		coords = vector3(-2245.237, -623.2434, 14.81377), -- the position where the music is played
		job = nil, --the job that can change the music
		range = 20.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-2245.237, -623.2434, 14.81377) -- where the player can change the musicq
	},
	{
		name = "Yatch_pilotis", -- The name of the radio, it doesn't matter
		coords = vector3(-2351.146, -658.4662, 13.42372), -- the position where the music is played
		job = nil, --the job that can change the music
		range = 20.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-2351.146, -658.4662, 13.42372) -- where the player can change the musicq
	},
	{
		name = 'Maze Bank',
		coords = vector3(-306.48861694336, -1981.4870605469, 22.204057693481), -- the position where the music is played
		job = "ambulance", --the job that can change the music
		range = 100.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-306.48861694336, -1981.4870605469, 22.204057693481) -- where the player can change the musicq
	},
	{
		name = 'LOS',
		coords = vector3(-1545.356, 81.60856, 53.87459), -- the position where the music is played
		job = nil, --the job that can change the music
		range = 100.0, -- the range that music can be heard
		volume = 0.3, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-1545.356, 81.60856, 53.87459) -- where the player can change the musicq
	}
}