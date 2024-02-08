local playeridd = PlayerId()
local playerpedidddddddddd = PlayerPedId()

--[[_________local_________]]--
--local iShoot = false
--[[_________Function List_________]]--
--______Function utils______--
function sendForbiddenMessage(message)
	TriggerEvent("chatMessage", "", {0, 0, 0}, "^1" .. message)
end

function _DeleteEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

--______Function______--
--hud realisticAmmo--[WIP]
--I think creat that with event for more option to get callback in menu or controlpressed [WIP]

--hud weapon reticle--
local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282, -- WEAPON_MARKSMANRIFLE
	177293209,  -- WEAPON_HEAVYSNIPER MKII
	1785463520  -- WEAPON_MARKSMANRIFLE_MK2
}
function HashInTable(hash)
    for k, v in pairs(scopedWeapons) do 
        if (hash == v) then 
            return true 
        end 
    end 
    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed(-1)
    local _, hash = GetCurrentPedWeapon(ped, true)
    if not HashInTable(hash) then 
        HideHudComponentThisFrame(14)
	end 
end 
--BlackList Cars--
function checkCar(car)
	-- if car then
	-- 	carModel = GetEntityModel(car)
	-- 	carName = GetDisplayNameFromVehicleModel(carModel)
	-- 	if isCarBlacklisted(carModel) then
	-- 		_DeleteEntity(car)
	-- 		sendForbiddenMessage(Config.String.BlacklistCar)
	-- 	end
	-- end
end
function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(Config.carBlacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end
	return false
end
--BlackList Peds--
function isPedBlacklisted(model)
	for _, blacklistedPed in pairs(Config.pedblacklist) do
		if model == GetHashKey(blacklistedPed) then
			return true
		end
	end
	return false
end
--BlackList Weapons--
function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(Config.weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end
	return false
end
--Drop peds Weapons--
local pedindex = {}
function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finished = false
    repeat 
        if not IsEntityDead(ped) then
            pedindex[ped] = {}
        end
        finished, ped = FindNextPed(handle)
    until not finished
    EndFindPed(handle)

    for peds,_ in pairs(pedindex) do
        if peds ~= nil then
            SetPedDropsWeaponsWhenDead(peds, false)
        end
    end
end

--[[_________Thread List_________]]
--Thread Loop (Wait 2000)
Citizen.CreateThread(function()        
    while true do
        Citizen.Wait(2000)
        if Config.Setting.npcNoDropWeapon == true then
            SetWeaponDrops()
        end
        if Config.Setting.afkCamPlayer == true then
            N_0xf4f2c0d4ee209e20() -- Player
            N_0x9e4cfff989258472() -- Veh
        end
        if Config.Setting.npcRelationship == true then
            local relationshipTypes = Config.ListRelationShipTypes
            local playerHash = GetHashKey('PLAYER')
            for k,groupHash in ipairs(relationshipTypes) do
                SetRelationshipBetweenGroups(1, groupHash, playerHash)
            end
        end
        if Config.Blacklist == true then
            local myPed = GetPlayerPed(-1)
            if Config.Setting.BlacklistCar == true then
		        if myPed then
			        checkCar(GetVehiclePedIsIn(myPed, false))

			        x, y, z = table.unpack(GetEntityCoords(myPed, true))
			        for _, blacklistedCar in pairs(Config.carBlacklist) do
				        checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			        end
		        end
            end
        end
        if Config.Setting.unStamina == true then
            local myPlayerSprint = GetPlayerSprintStaminaRemaining(playeridd)
            if myPlayerSprint then
                ResetPlayerStamina(playeridd)
            end
        end
    end
end)

--Thread Loop (wait 750) only for Option EAT A LOT ms x) fuck this fucking native!!!! I think my setting is the best... call me on my discord is not nice x) (look credit for my discord)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(750)
        --myServer_setting get +0.03ms for that whitout this config, this scope use more CPU client +0.10ms easy
        if Config.Setting.removeAllCopsCarPed == true then
            local myPed         = GetPlayerPed(-1)
            local myPedCoord    = GetEntityCoords(myPed)
            ClearAreaOfCops(myPedCoord.x, myPedCoord.y, myPedCoord.z, 100.0)
        end
    end
end)

--Thread Loop (Wait 0) [this script work only with loop get wait 0 so this myServer_setting get +0.03ms for that]
-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         if Config.Blacklist == true then
--             local myPed = GetPlayerPed(-1)
--             if Config.Setting.BlacklistPed == true then
--                 if myPed then
--                     playerModel = GetEntityModel(myPed)
--                     if not prevPlayerModel then
--                         if isPedBlacklisted(prevPlayerModel) then
--                             SetPlayerModel(playeridd, GetHashKey(Config.defaultpedmodel))
--                         else
--                             prevPlayerModel = playerModel
--                         end
--                     else
--                         if isPedBlacklisted(playerModel) then
--                             SetPlayerModel(playeridd, prevPlayerModel)

--                             sendForbiddenMessage(Config.String.BlacklistPed)
--                         end
--                         prevPlayerModel = playerModel
--                     end
--                 end
--             end
--             if Config.Setting.BlacklistWeapon == true then
--                 if myPed then
--                     nothing, weapon = GetCurrentPedWeapon(myPed, true)      
--                     if Config.disableallweapons then
--                         RemoveAllPedWeapons(myPed, true)
--                     else
--                         if isWeaponBlacklisted(weapon) then
--                             RemoveWeaponFromPed(myPed, weapon)
--                             sendForbiddenMessage(Config.String.BlacklistWeapon)
--                         end
--                     end
--                 end
--             end
--         end
--     end
-- end)

--Thread Loop (Wait 1)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if Config.Setting.noCarJack == true then
            if DoesEntityExist(GetVehiclePedIsTryingToEnter(playerpedidddddddddd)) then
                local veh = GetVehiclePedIsTryingToEnter(playerpedidddddddddd)
                local isLock = GetVehicleDoorLockStatus(veh)
                local ped = GetPedInVehicleSeat(veh, -1)
                if ped then
                    SetPedCanBeDraggedOut(ped, false)
                end
                if isLock == 2 or isLock == 7 or isLock == 8 then
                    SetVehicleDoorsLockedForPlayer(veh, playeridd, true)
                end
            end
        end
        -- if Config.Setting.hideHudWeapon == true then
        --     if Config.HudWeapon.hudweapon == true then
        --         HideHudComponentThisFrame(22)   --HUD_WEAPONS
        --     end
        --     if Config.HudWeapon.hudcompenents == true then
        --         HideHudComponentThisFrame(21)   --HUD_COMPONENTS
        --     end
        --     if Config.HudWeapon.wheel == true then
        --         HideHudComponentThisFrame(20)   --WEAPON_WHEEL_STATS
        --         HideHudComponentThisFrame(19)   --WEAPON_WHEEL
        --     end
        --     if Config.HudWeapon.reticle == true then
        --         ManageReticle()                   ----RETICLE + noHideScope
        --     end
        --     if Config.HudWeapon.hudAmmo == true then
        --         HideHudComponentThisFrame(2)    --WEAPON_ICON
        --     end
        -- end
        if Config.Setting.densityMultiplier == true then
            local npcMultiplier     = Config.npcMultiplier
            local npvehMultiplier   = Config.npvehMultiplier
            local pvehMultiplier    = Config.pvehMultiplier
            if Config.Setting.densityNpc == true then
                SetPedDensityMultiplierThisFrame(npcMultiplier)
                SetScenarioPedDensityMultiplierThisFrame(npcMultiplier, npcMultiplier)                    
            end
            if Config.Setting.densityVeh == true then
                SetVehicleDensityMultiplierThisFrame(npvehMultiplier)
                SetRandomVehicleDensityMultiplierThisFrame(npvehMultiplier)
            end
            if Config.Setting.densityVehParked == true then
                SetParkedVehicleDensityMultiplierThisFrame(pvehMultiplier)
            end
        end
        if Config.Setting.noRewardVeh == true then
            DisablePlayerVehicleRewards(playeridd)
        end
        if Config.Setting.npcDispatchService == true then
            for dispatchService = 1, 15 do
                EnableDispatchService(dispatchService, false) --Liste des dispatchService sur FivemNative description de la native (EnableDispatchService)
            end
        end
        if Config.Setting.noCrossHit == true then
            if  IsPedArmed(playerpedidddddddddd, 6) then
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            end
        end
        if Config.Setting.xMas == true then
            SetWeatherTypePersist("XMAS")
            SetWeatherTypeNowPersist("XMAS")
            SetWeatherTypeNow("XMAS")
            SetOverrideWeather("XMAS")
        end
        if Config.Setting.setDamage == true then
            for _, v in pairs(Config.Setdamage) do
                for i = 1, #v.setting, 1 do
                    local weapon = GetHashKey(v.setting[i].weaponhash)
                    local values = v.setting[i].value
                    if(v.Type == 1)then --cac
                        N_0x4757f00bc6323cfe(weapon, values)
                    else
                        N_0x4757f00bc6323cfe(weapon, values)
                    end
                end
            end
        end
        if Config.noCritikHits == true then
            local ply = playerpedidddddddddd
            SetPedSuffersCriticalHits(ply, false)
        end

        if GetPlayerWantedLevel(playeridd) ~= 0 then
            SetPlayerWantedLevel(playeridd, 0, false)
            SetPlayerWantedLevelNow(playeridd, false)
        end

        SetVehicleDensityMultiplierThisFrame(0.1)
        SetPedDensityMultiplierThisFrame(0.1)
        SetRandomVehicleDensityMultiplierThisFrame(0.1)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
        SetScenarioPedDensityMultiplierThisFrame(0.1, 0.1)
    end
end)

--Thread Without Loop Wait()
Citizen.CreateThread(function()    
    if Config.Setting.train == true then
        --SwitchTrainTrack(0, true) -- Train.
        SwitchTrainTrack(3, true) -- Metro.
        N_0x21973bbf8d17edfa(0, 120000)
        SetRandomTrains(1)
    end
    if Config.Setting.escMenutext == true then
        AddTextEntry('FE_THDR_GTAO', Config.escText) --Text menu escap
    end
end)


--______Thread for my test______--
--[[
Citizen.CreateThread(function()

end)
--]]

--[[					__SUP2Ak__                            
    /Discord SUP2Ak FiveM-Dev : https://discord.gg/hYCR2YKgxB    /  
    /GitHub : https://github.com/SUP2Ak	                        /   
    /Youtube : https://www.youtube.com/SUPAAkHD                /
    __________________________________________________________/
    |                   __MyProject__
    |    /Serveur RP : AlphaV RP
 ___|    /FiveM      : myServerESX (qui est dans le liens Discord : FiveM-Dev)					  
]]







-------------POLICE APPEL---------------
Citizen.CreateThread(function()
    for i = 1, 12 do
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(10)
       
--         if GetPlayerWantedLevel(playeridd) ~= 0 then
--             SetPlayerWantedLevel(playeridd, 0, false)
--             SetPlayerWantedLevelNow(playeridd, false)
--         end

--         SetVehicleDensityMultiplierThisFrame(0.1)
--         SetPedDensityMultiplierThisFrame(0.1)
--         SetRandomVehicleDensityMultiplierThisFrame(0.1)
--         SetParkedVehicleDensityMultiplierThisFrame(0.0)
--         SetScenarioPedDensityMultiplierThisFrame(0.1, 0.1)
--     end
-- end)

-- PNJ = {
--     RelationshipGroups = {
--         `AGGRESSIVE_INVESTIGATE`,
--         `AMBIENT_GANG_BALLAS`,
--         `AMBIENT_GANG_CULT`,
--         `AMBIENT_GANG_FAMILY`,
--         `AMBIENT_GANG_HILLBILLY`,
--         `AMBIENT_GANG_LOST`,
--         `AMBIENT_GANG_MARABUNTE`,
--         `AMBIENT_GANG_MEXICAN`,
--         `AMBIENT_GANG_SALVA`,
--         `AMBIENT_GANG_WEICHENG`,
--         `ARMY`,
--         `CAT`,
--         `CIVFEMALE`,
--         `CIVMALE`,
--         `COP`,
--         --`COUGAR`,
--         `DEALER`,
--         `DEER`,
--         `DOMESTIC_ANIMAL`,
--         `FIREMAN`,
--         `GANG_1`,
--         `GANG_2`,
--         `GANG_9`,
--         `GANG_10`,
--         `GUARD_DOG`,
--         `HATES_PLAYER`,
--         `HEN`,
--         `MEDIC`,
--         `MISSION2`,
--         `MISSION3`,
--         `MISSION4`,
--         `MISSION5`,
--         `MISSION6`,
--         `MISSION7`,
--         `MISSION8`,
--         `NO_RELATIONSHIP`,
--         `PLAYER`,
--         `PRISONER`,
--         `PRIVATE_SECURITY`,
--         `SECURITY_GUARD`,
--         --`SHARK`,
--         `SPECIAL`,
--         --`WILD_AN
--     },
--     PickupWeapons = {
--         `PICKUP_AMMO_BULLET_MP`,
--         `PICKUP_AMMO_FIREWORK`,
--         `PICKUP_AMMO_FIREWORK_MP`,
--         `PICKUP_AMMO_FLAREGUN`,
--         `PICKUP_AMMO_GRENADELAUNCHER`,
--         `PICKUP_AMMO_GRENADELAUNCHER_MP`,
--         `PICKUP_AMMO_HOMINGLAUNCHER`,
--         `PICKUP_AMMO_MG`,
--         `PICKUP_AMMO_MINIGUN`,
--         `PICKUP_AMMO_MISSILE_MP`,
--         `PICKUP_AMMO_PISTOL`,
--         `PICKUP_AMMO_RIFLE`,
--         `PICKUP_AMMO_RPG`,
--         `PICKUP_AMMO_SHOTGUN`,
--         `PICKUP_AMMO_SMG`,
--         `PICKUP_AMMO_SNIPER`,
--         `PICKUP_WEAPON_ADVANCEDRIFLE`,
--         `PICKUP_WEAPON_APPISTOL`,
--         `PICKUP_WEAPON_ASSAULTRIFLE`,
--         `PICKUP_WEAPON_ASSAULTRIFLE_MK2`,
--         `PICKUP_WEAPON_ASSAULTSHOTGUN`,
--         `PICKUP_WEAPON_ASSAULTSMG`,
--         `PICKUP_WEAPON_AUTOSHOTGUN`,
--         `PICKUP_WEAPON_BAT`,
--         `PICKUP_WEAPON_BATTLEAXE`,
--         `PICKUP_WEAPON_BOTTLE`,
--         `PICKUP_WEAPON_BULLPUPRIFLE`,
--         `PICKUP_WEAPON_BULLPUPRIFLE_MK2`,
--         `PICKUP_WEAPON_BULLPUPSHOTGUN`,
--         `PICKUP_WEAPON_CARBINERIFLE`,
--         `PICKUP_WEAPON_CARBINERIFLE_MK2`,
--         `PICKUP_WEAPON_COMBATMG`,
--         `PICKUP_WEAPON_COMBATMG_MK2`,
--         `PICKUP_WEAPON_COMBATPDW`,
--         `PICKUP_WEAPON_COMBATPISTOL`,
--         `PICKUP_WEAPON_COMPACTLAUNCHER`,
--         `PICKUP_WEAPON_COMPACTRIFLE`,
--         `PICKUP_WEAPON_CROWBAR`,
--         `PICKUP_WEAPON_DAGGER`,
--         `PICKUP_WEAPON_DBSHOTGUN`,
--         `PICKUP_WEAPON_DOUBLEACTION`,
--         `PICKUP_WEAPON_FIREWORK`,
--         `PICKUP_WEAPON_FLAREGUN`,
--         `PICKUP_WEAPON_FLASHLIGHT`,
--         `PICKUP_WEAPON_GRENADE`,
--         `PICKUP_WEAPON_GRENADELAUNCHER`,
--         `PICKUP_WEAPON_GUSENBERG`,
--         `PICKUP_WEAPON_GolfClub`,
--         `PICKUP_WEAPON_HAMMER`,
--         `PICKUP_WEAPON_HATCHET`,
--         `PICKUP_WEAPON_HEAVYPISTOL`,
--         `PICKUP_WEAPON_HEAVYSHOTGUN`,
--         `PICKUP_WEAPON_HEAVYSNIPER`,
--         `PICKUP_WEAPON_HEAVYSNIPER_MK2`,
--         `PICKUP_WEAPON_HOMINGLAUNCHER`,
--         `PICKUP_WEAPON_KNIFE`,
--         `PICKUP_WEAPON_KNUCKLE`,
--         `PICKUP_WEAPON_MACHETE`,
--         `PICKUP_WEAPON_MACHINEPISTOL`,
--         `PICKUP_WEAPON_MARKSMANPISTOL`,
--         `PICKUP_WEAPON_MARKSMANRIFLE`,
--         `PICKUP_WEAPON_MARKSMANRIFLE_MK2`,
--         `PICKUP_WEAPON_MG`,
--         `PICKUP_WEAPON_MICROSMG`,
--         `PICKUP_WEAPON_MINIGUN`,
--         `PICKUP_WEAPON_MINISMG`,
--         `PICKUP_WEAPON_MOLOTOV`,
--         `PICKUP_WEAPON_MUSKET`,
--         `PICKUP_WEAPON_NIGHTSTICK`,
--         `PICKUP_WEAPON_PETROLCAN`,
--         `PICKUP_WEAPON_PIPEBOMB`,
--         `PICKUP_WEAPON_PISTOL`,
--         `PICKUP_WEAPON_PISTOL50`,
--         `PICKUP_WEAPON_PISTOL_MK2`,
--         `PICKUP_WEAPON_POOLCUE`,
--         `PICKUP_WEAPON_PROXMINE`,
--         `PICKUP_WEAPON_PUMPSHOTGUN`,
--         `PICKUP_WEAPON_PUMPSHOTGUN_MK2`,
--         `PICKUP_WEAPON_RAILGUN`,
--         `PICKUP_WEAPON_RAYCARBINE`,
--         `PICKUP_WEAPON_RAYMINIGUN`,
--         `PICKUP_WEAPON_RAYPISTOL`,
--         `PICKUP_WEAPON_REVOLVER`,
--         `PICKUP_WEAPON_REVOLVER_MK2`,
--         `PICKUP_WEAPON_RPG`,
--         `PICKUP_WEAPON_SAWNOFFSHOTGUN`,
--         `PICKUP_WEAPON_SMG`,
--         `PICKUP_WEAPON_SMG_MK2`,
--         `PICKUP_WEAPON_SMOKEGRENADE`,
--         `PICKUP_WEAPON_SNIPERRIFLE`,
--         `PICKUP_WEAPON_SNSPISTOL`,
--         `PICKUP_WEAPON_SNSPISTOL_MK2`,
--         `PICKUP_WEAPON_SPECIALCARBINE`,
--         `PICKUP_WEAPON_SPECIALCARBINE_MK2`,
--         `PICKUP_WEAPON_TACTICALRIFLE`,
--         `PICKUP_WEAPON_STICKYBOMB`,
--         `PICKUP_WEAPON_STONE_HATCHET`,
--         `PICKUP_WEAPON_STUNGUN`,
--         `PICKUP_WEAPON_SWITCHBLADE`,
--         `PICKUP_WEAPON_VINTAGEPISTOL`,
--         `PICKUP_WEAPON_WRENCH`,
--     },
--     SuppressedVehiclesModels = {
--         -- Tankers
--         `armytanker`,
--         `tanker`,
--         `tanker2`,
--         -- Military
--         `apc`,
--         `barracks`,
--         `barracks2`,
--         `barracks3`,
--         `barrage`,
--         `chernobog`,
--         `crusader`,
--         `halftrack`,
--         `khanjali`,
--         `minitank`,
--         `rhino`,
--         `scarab`,
--         `scarab2`,
--         `scarab3`,
--         `thruster`,
--         `trailersmall2`,
--         -- Helico
--         `polmav`,
--         `akula`,
--         `annihilator`,
--         `buzzard`,
--         `buzzard2`,
--         `cargobob`,
--         `cargobob2`,
--         `cargobob3`,
--         `cargobob4`,
--         `frogger`,
--         `frogger2`,
--         `havok`,
--         `hunter`,
--         `maverick`,
--         `savage`,
--         `seasparrow`,
--         `skylift`,
--         `supervolito`,
--         `supervolito2`,
--         `swift`,
--         `swift2`,
--         `valkyrie`,
--         `valkyrie2`,
--         `volatus`,
--         -- planes
--         `alphaz1`,
--         `avenger`,
--         `avenger2`,
--         `besra`,
--         `blimp`,
--         `blimp2`,
--         `blimp3`,
--         `bombushka`,
--         `cargoplane`,
--         `cuban800`,
--         `dodo`,
--         `duster`,
--         `howard`,
--         `hydra`,
--         `jet`,
--         `lazer`,
--         `luxor`,
--         `luxor2`,
--         `mammatus`,
--         `microlight`,
--         `miljet`,
--         `mogul`,
--         `molotok`,
--         `nimbus`,
--         `nokota`,
--         `pyro`,
--         `rogue`,
--         `seabreeze`,
--         `shamal`,
--         `starling`,
--         `strikeforce`,
--         `stunt`,
--         `titan`,
--         `tula`,
--         `velum`,
--         `velum2`,
--         `vestra`,
--         `volatol`,
--     },
--     SuppressedPedsModels = {
--         --`a_c_mtlion`,
--         `a_c_cormorant`,
--         `a_c_pigeon`,
--         `a_c_chickenhawk`,
--         `a_c_crow`,
--         `a_c_seagull`,
--     }
-- }

-- CreateThread(function()
--         -- Désactivation des PNJ agressif
-- 	for _, relationshipGroup in ipairs(PNJ.RelationshipGroups) do
-- 		SetRelationshipBetweenGroups(1, relationshipGroup, `PLAYER`)
-- 	end

--     -- Désactivation dispatch
-- 	for i = 1, 15 do
-- 		EnableDispatchService(i, false)
-- 	end

--     -- Désactivation des drops d'arme LSPD
-- 	for _, weapon in ipairs(PNJ.PickupWeapons) do
-- 		ToggleUsePickupsForPlayer(playerpedidddddddddd, weapon, false)
-- 	end

--         -- Suppresion de certains spawn de véhicule
-- 	for _, model in pairs(PNJ.SuppressedVehiclesModels) do
-- 		SetVehicleModelIsSuppressed(model, true)
-- 	end

--     -- Suppression de certains spawn de peds
-- 	for _, model in pairs(PNJ.SuppressedPedsModels) do
-- 		SetPedModelIsSuppressed(model, true)
-- 	end

--     -- Désactivation des spawn police
-- 	SetCreateRandomCopsNotOnScenarios(false)
-- 	SetCreateRandomCops(false)
-- end)