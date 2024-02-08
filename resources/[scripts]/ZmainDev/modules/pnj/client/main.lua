CreateThread(function()

    PNJ = {
        RelationshipGroups = {
            `AGGRESSIVE_INVESTIGATE`,
            `AMBIENT_GANG_BALLAS`,
            `AMBIENT_GANG_CULT`,
            `AMBIENT_GANG_FAMILY`,
            `AMBIENT_GANG_HILLBILLY`,
            `AMBIENT_GANG_LOST`,
            `AMBIENT_GANG_MARABUNTE`,
            `AMBIENT_GANG_MEXICAN`,
            `AMBIENT_GANG_SALVA`,
            `AMBIENT_GANG_WEICHENG`,
            `ARMY`,
            `CAT`,
            `CIVFEMALE`,
            `CIVMALE`,
            `COP`,
            --`COUGAR`,
            `DEALER`,
            `DEER`,
            `DOMESTIC_ANIMAL`,
            `FIREMAN`,
            `GANG_1`,
            `GANG_2`,
            `GANG_9`,
            `GANG_10`,
            `GUARD_DOG`,
            `HATES_PLAYER`,
            `HEN`,
            `MEDIC`,
            `MISSION2`,
            `MISSION3`,
            `MISSION4`,
            `MISSION5`,
            `MISSION6`,
            `MISSION7`,
            `MISSION8`,
            `NO_RELATIONSHIP`,
            `PLAYER`,
            `PRISONER`,
            `PRIVATE_SECURITY`,
            `SECURITY_GUARD`,
            --`SHARK`,
            `SPECIAL`,
            --`WILD_ANIMAL`,
        },
        PickupWeapons = {
            `PICKUP_AMMO_BULLET_MP`,
            `PICKUP_AMMO_FIREWORK`,
            `PICKUP_AMMO_FIREWORK_MP`,
            `PICKUP_AMMO_FLAREGUN`,
            `PICKUP_AMMO_GRENADELAUNCHER`,
            `PICKUP_AMMO_GRENADELAUNCHER_MP`,
            `PICKUP_AMMO_HOMINGLAUNCHER`,
            `PICKUP_AMMO_MG`,
            `PICKUP_AMMO_MINIGUN`,
            `PICKUP_AMMO_MISSILE_MP`,
            `PICKUP_AMMO_PISTOL`,
            `PICKUP_AMMO_RIFLE`,
            `PICKUP_AMMO_RPG`,
            `PICKUP_AMMO_SHOTGUN`,
            `PICKUP_AMMO_SMG`,
            `PICKUP_AMMO_SNIPER`,
            `PICKUP_WEAPON_ADVANCEDRIFLE`,
            `PICKUP_WEAPON_APPISTOL`,
            `PICKUP_WEAPON_ASSAULTRIFLE`,
            `PICKUP_WEAPON_ASSAULTRIFLE_MK2`,
            `PICKUP_WEAPON_ASSAULTSHOTGUN`,
            `PICKUP_WEAPON_ASSAULTSMG`,
            `PICKUP_WEAPON_AUTOSHOTGUN`,
            `PICKUP_WEAPON_BAT`,
            `PICKUP_WEAPON_BATTLEAXE`,
            `PICKUP_WEAPON_BOTTLE`,
            `PICKUP_WEAPON_BULLPUPRIFLE`,
            `PICKUP_WEAPON_BULLPUPRIFLE_MK2`,
            `PICKUP_WEAPON_BULLPUPSHOTGUN`,
            `PICKUP_WEAPON_CARBINERIFLE`,
            `PICKUP_WEAPON_CARBINERIFLE_MK2`,
            `PICKUP_WEAPON_COMBATMG`,
            `PICKUP_WEAPON_COMBATMG_MK2`,
            `PICKUP_WEAPON_COMBATPDW`,
            `PICKUP_WEAPON_COMBATPISTOL`,
            `PICKUP_WEAPON_COMPACTLAUNCHER`,
            `PICKUP_WEAPON_COMPACTRIFLE`,
            `PICKUP_WEAPON_CROWBAR`,
            `PICKUP_WEAPON_DAGGER`,
            `PICKUP_WEAPON_DBSHOTGUN`,
            `PICKUP_WEAPON_DOUBLEACTION`,
            `PICKUP_WEAPON_FIREWORK`,
            `PICKUP_WEAPON_FLAREGUN`,
            `PICKUP_WEAPON_FLASHLIGHT`,
            `PICKUP_WEAPON_GRENADE`,
            `PICKUP_WEAPON_GRENADELAUNCHER`,
            `PICKUP_WEAPON_GUSENBERG`,
            `PICKUP_WEAPON_GolfClub`,
            `PICKUP_WEAPON_HAMMER`,
            `PICKUP_WEAPON_HATCHET`,
            `PICKUP_WEAPON_HEAVYPISTOL`,
            `PICKUP_WEAPON_HEAVYSHOTGUN`,
            `PICKUP_WEAPON_HEAVYSNIPER`,
            `PICKUP_WEAPON_HEAVYSNIPER_MK2`,
            `PICKUP_WEAPON_HOMINGLAUNCHER`,
            `PICKUP_WEAPON_KNIFE`,
            `PICKUP_WEAPON_KNUCKLE`,
            `PICKUP_WEAPON_MACHETE`,
            `PICKUP_WEAPON_MACHINEPISTOL`,
            `PICKUP_WEAPON_MARKSMANPISTOL`,
            `PICKUP_WEAPON_MARKSMANRIFLE`,
            `PICKUP_WEAPON_MARKSMANRIFLE_MK2`,
            `PICKUP_WEAPON_MG`,
            `PICKUP_WEAPON_MICROSMG`,
            `PICKUP_WEAPON_MINIGUN`,
            `PICKUP_WEAPON_MINISMG`,
            `PICKUP_WEAPON_MOLOTOV`,
            `PICKUP_WEAPON_MUSKET`,
            `PICKUP_WEAPON_NIGHTSTICK`,
            `PICKUP_WEAPON_PETROLCAN`,
            `PICKUP_WEAPON_PIPEBOMB`,
            `PICKUP_WEAPON_PISTOL`,
            `PICKUP_WEAPON_PISTOL50`,
            `PICKUP_WEAPON_PISTOL_MK2`,
            `PICKUP_WEAPON_POOLCUE`,
            `PICKUP_WEAPON_PROXMINE`,
            `PICKUP_WEAPON_PUMPSHOTGUN`,
            `PICKUP_WEAPON_PUMPSHOTGUN_MK2`,
            `PICKUP_WEAPON_RAILGUN`,
            `PICKUP_WEAPON_RAYCARBINE`,
            `PICKUP_WEAPON_RAYMINIGUN`,
            `PICKUP_WEAPON_RAYPISTOL`,
            `PICKUP_WEAPON_REVOLVER`,
            `PICKUP_WEAPON_REVOLVER_MK2`,
            `PICKUP_WEAPON_RPG`,
            `PICKUP_WEAPON_SAWNOFFSHOTGUN`,
            `PICKUP_WEAPON_SMG`,
            `PICKUP_WEAPON_SMG_MK2`,
            `PICKUP_WEAPON_SMOKEGRENADE`,
            `PICKUP_WEAPON_SNIPERRIFLE`,
            `PICKUP_WEAPON_SNSPISTOL`,
            `PICKUP_WEAPON_SNSPISTOL_MK2`,
            `PICKUP_WEAPON_SPECIALCARBINE`,
            `PICKUP_WEAPON_SPECIALCARBINE_MK2`,
            `PICKUP_WEAPON_TACTICALRIFLE`,
            `PICKUP_WEAPON_STICKYBOMB`,
            `PICKUP_WEAPON_STONE_HATCHET`,
            `PICKUP_WEAPON_STUNGUN`,
            `PICKUP_WEAPON_SWITCHBLADE`,
            `PICKUP_WEAPON_VINTAGEPISTOL`,
            `PICKUP_WEAPON_WRENCH`,
        },
        SuppressedVehiclesModels = {
            -- Tankers
            `armytanker`,
            `tanker`,
            `tanker2`,
            -- Military
            `apc`,
            `barracks`,
            `barracks2`,
            `barracks3`,
            `barrage`,
            `chernobog`,
            `crusader`,
            `halftrack`,
            `khanjali`,
            `minitank`,
            `rhino`,
            `scarab`,
            `scarab2`,
            `scarab3`,
            `thruster`,
            `trailersmall2`,
            -- Helico
            `polmav`,
            `akula`,
            `annihilator`,
            `buzzard`,
            `buzzard2`,
            `cargobob`,
            `cargobob2`,
            `cargobob3`,
            `cargobob4`,
            `frogger`,
            `frogger2`,
            `havok`,
            `hunter`,
            `maverick`,
            `savage`,
            `seasparrow`,
            `skylift`,
            `supervolito`,
            `supervolito2`,
            `swift`,
            `swift2`,
            `valkyrie`,
            `valkyrie2`,
            `volatus`,
            -- planes
            `alphaz1`,
            `avenger`,
            `avenger2`,
            `besra`,
            `blimp`,
            `blimp2`,
            `blimp3`,
            `bombushka`,
            `cargoplane`,
            `cuban800`,
            `dodo`,
            `duster`,
            `howard`,
            `hydra`,
            `jet`,
            `lazer`,
            `luxor`,
            `luxor2`,
            `mammatus`,
            `microlight`,
            `miljet`,
            `mogul`,
            `molotok`,
            `nimbus`,
            `nokota`,
            `pyro`,
            `rogue`,
            `seabreeze`,
            `shamal`,
            `starling`,
            `strikeforce`,
            `stunt`,
            `titan`,
            `tula`,
            `velum`,
            `velum2`,
            `vestra`,
            `volatol`,
        },
        SuppressedPedsModels = {
            --`a_c_mtlion`,
            `a_c_cormorant`,
            `a_c_pigeon`,
            `a_c_chickenhawk`,
            `a_c_crow`,
            `a_c_seagull`,
        }
    }

    while not NetworkIsSessionStarted() do
        Citizen.Wait(0)
    end

    -- Désactivation des PNJ agressif
	for _, relationshipGroup in ipairs(PNJ.RelationshipGroups) do
		SetRelationshipBetweenGroups(1, relationshipGroup, `PLAYER`)
	end

    -- Désactivation dispatch
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end

    -- Désactivation des drops d'arme LSPD
	for _, weapon in ipairs(PNJ.PickupWeapons) do
		ToggleUsePickupsForPlayer(Player.playerId, weapon, false)
	end

    -- Désactivation des spawn police
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCops(false)

    -- Suppresion de certains spawn de véhicule
	for _, model in pairs(PNJ.SuppressedVehiclesModels) do
		SetVehicleModelIsSuppressed(model, true)
	end

    -- Suppression de certains spawn de peds
	for _, model in pairs(PNJ.SuppressedPedsModels) do
		SetPedModelIsSuppressed(model, true)
	end

    SetWeaponsNoAutoswap(true)

    SetMaxWantedLevel(0)
    SetPoliceIgnorePlayer(Player.playerId, true)
    SetDispatchCopsForPlayer(Player.playerId, false)
    SetPlayerHealthRechargeMultiplier(Player.playerPed, 0.0)
    SetGarbageTrucks(0)
	SetRandomBoats(0)
	SetRandomTrains(0)

    SetRadarAsExteriorThisFrame()
    SetRadarAsInteriorThisFrame(`h4_fake_islandx`, vec(4700.0, -5145.0), 0, 0)

    SetPedCanBeDraggedOut(Player.playerPed, false)
end)