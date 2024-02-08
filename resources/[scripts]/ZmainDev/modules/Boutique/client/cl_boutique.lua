local boutiqueMENUOpen = true
local reopenBoutiqueMenu = false
local oldPosPlayer

local oldLabelVehicle = nil
local oldSpawnNameVehicle = oldSpawnNameVehicle
local oldSpawnNameVehicleMoto = nil
local oldVehBoutiqueTest = nil
sortirvoitureacheter = {}

local visu = false
local visutextname = 'Visualiser le véhicule'

local exit = false

local IsTimeFinish = true
local IsTimeRetest = true
local IsInvehicle = false

local IsTimeBoutique = nil
InfoPlayer = {
    coins = 0,
    totalCoins = 0,
    reward = false
}

local boutique = {}

local selectedWeaponName = nil
local weaponComponent = {}

local driftMod = false

local currentVehicle;

local BoutiqueActive = false

RegisterNetEvent('boutique:update', function(new, total, reward)
    print(new, total)
    InfoPlayer.coins = tonumber(new)
    InfoPlayer.totalCoins = tonumber(total)
    InfoPlayer.reward = reward
end)

local isInLoadedVehicle = false

openMenuBoutique = function()
    if SetEntityRagdoll then return end
    Player.playerPed = PlayerPedId()

    if boutique.lastPos == nil then
        boutique.lastPos = nil
    end
    boutique.currentVehicle = nil
    boutique.isInVehicle = false
    boutique.vehiclePosition = vector3(-75.16219, -819.2629, 325.1755)

    local scaleform = gtaui.Scaleform("mp_car_stats_01")
    scaleform:load()
    local main = RageUI.CreateMenu('', 'Actions Disponibles')
    local menuVehicle = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local mainVoiture = RageUI.CreateSubMenu(menuVehicle, '', 'Actions Disponibles')
    local mainMoto = RageUI.CreateSubMenu(menuVehicle, '', 'Actions Disponibles')
    local mainAerien = RageUI.CreateSubMenu(menuVehicle, '', 'Actions Disponibles')
    local mainActionVeh = RageUI.CreateSubMenu(menuVehicle, '', 'Actions Disponibles')
    local mainBateau = RageUI.CreateSubMenu(menuVehicle, '', 'Actions Disponibles')

    -- new

    mainCaisses = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    CaisseSilver = RageUI.CreateSubMenu(mainCaisses, '', 'Actions Disponibles')
    CaisseVisualSilver = RageUI.CreateSubMenu(CaisseSilver, '', 'Actions Disponibles')

    local mainVehicles = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local mainTestVehicles = RageUI.CreateSubMenu(mainVehicles, '', 'Actions Disponibles')

    local vipMenu = RageUI.CreateSubMenu(main, '', 'Actions Disponibles')
    local weaponVipMenu = RageUI.CreateSubMenu(vipMenu, '', 'Actions Disponibles')
    local petMenu = RageUI.CreateSubMenu(vipMenu, '', 'Actions Disponibles')

    main.Closable = true
    mainTestVehicles.Closable = true
    function reopenMenu()
        main.Closable = true
        mainTestVehicles.Closable = true
    end

    local VehicleSpawned = {}
    local LastVeh = nil
    local loadedVehicle = false

    mainVehicles.Closed = function()
        if boutiqueMENUOpen then
            SetEntityRagdoll = false
            local vehicles = ESX.Game.GetVehiclesInArea(boutique.vehiclePosition, 5.0)
    
            for k2,v2 in pairs(vehicles) do
                DeleteVehicle(v2)
            end
            
            SetEntityCoords(PlayerPedId(), boutique.lastPos)
            FreezeEntityPosition(PlayerPedId(), false)
            SetEntityVisible(PlayerPedId(), true)
    
            SetTimeout(5000, function()
                if boutique.isInVehicle == true then
                    SetEntityCoords(PlayerPedId(), boutique.lastPos)
    
                    boutique.isInVehicle = false
                end
            end)
        end
    end

    RageUI.Visible(main, not RageUI.Visible(main))
    BoutiqueActive = true
    while main do
        Wait(0)
        RageUI.IsVisible(main, function()

            RageUI.Separator('Boutique de ~p~Only\'RP~s~')
            RageUI.Separator(('Code Boutique: ~p~%s~s~'):format(ESX.GetPlayerData().UniqueID))
            RageUI.Separator(('Vous avez ~p~%s~s~ points boutique'):format(InfoPlayer.coins))
            RageUI.Separator(('Vous avez utilisé ~p~%s~s~ points boutique'):format(InfoPlayer.totalCoins))
            RageUI.Button('Acheter des points boutique', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    ExecuteCommand(("openUrl %s"):format('https://onlyrp-boutique.tebex.io/category/coins'))
                end
            })
            RageUI.WLine()
            RageUI.Button('Véhicules', exports['zonesafe']:getSafeZone() == false and '\nVous devez être en SafeZone et hors d\'un véhicule\n' or nil, {}, exports['zonesafe']:getSafeZone() and not Player.isInVehicle, {
                onSelected = function()
                    boutique.isInVehicle = true
                    boutique.lastPos = GetEntityCoords(PlayerPedId())
                    SetEntityVisible(PlayerPedId(), false)
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetEntityCoords(Player.playerPed, vector3(-74.97778, -823.6355, 326.1755))
                    RageUI.Visible(mainVehicles, true)
                    Citizen.CreateThread(function ()
                        while boutique.isInVehicle do
                            if (scaleform) and boutique.currentVehicle ~= nil and DoesEntityExist(boutique.currentVehicle) then
                                local x, y, z = table.unpack(GetEntityCoords(boutique.currentVehicle))
                                local height = GetEntityHeight(boutique.currentVehicle, x, y, z, true, false)
                                local rot = GetGameplayCamRot(0)
                                local scale = 0.9
                                local size = vector3((15 * 0.8) * scale, (9 * 0.8) * scale, 1 * scale)
                                local coords = vector3(x, y, z + 3.4 + height)
                
                                scaleform:draw3D(coords, rot, size)
                            end
                
                            Citizen.Wait(0)
                        end
                    end)
                end
            })
            RageUI.Button('Caisses', exports['zonesafe']:getSafeZone() == false and '\nVous devez être en SafeZone et hors d\'un véhicule\n' or nil, {}, exports['zonesafe']:getSafeZone() and not Player.isInVehicle, {
                onSelected = function()
                end
            }, mainCaisses)
            RageUI.Button('VIP', nil, {RightLabel = ('~y~%s Heure(s)~s~'):format(VIP.data.time)}, VIP.haveVip(), {
                onSelected = function()
                    
                end
            }, vipMenu)
            if InfoPlayer.reward == 0 or InfoPlayer.reward == false then
                RageUI.Separator('~r~↓ CADEAU ↓~s~')
                RageUI.Button('Récupérer votre cadeau', nil, {Color = {BackgroundColor = {255,0,0,150}}}, true, {
                    onSelected = function()
                        TriggerServerEvent('zmain:boutique:sendReward')
                    end
                })
            end
        end)

        RageUI.IsVisible(vipMenu, function()
            if not VIP.haveVip() then
                RageUI.CloseAll()
            end

            RageUI.Separator('VIP: ~y~GOLD~s~')
            RageUI.Separator(('Temps restant: ~y~%s Heure(s)~s~'):format(VIP.data.time))

            RageUI.WLine()

            RageUI.Button('Accessoires D\'armes', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    local weapon, weaponSelected = GetCurrentPedWeapon(PlayerPedId(), false)

                    if not weapon then
                        return ESX.ShowNotification('Vous devez avoir une arme en main')
                    end

                    for k,v in pairs(WeaponList) do
                        if v.hash == weaponSelected then
                            selectedWeaponName = v.name
                            selectedWeapnHash = weaponSelected
                        end
                    end

                    RageUI.Visible(weaponVipMenu, true)
                end
            })
            RageUI.Button('Animaux', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {
                onSelected = function()
                    
                end
            }, petMenu)
            
            -- RageUI.Checkbox('Mode Drift', nil, driftMod, {}, {
            --     onChecked = function()
            --         driftMod = true 
            --         TriggerEvent('zmain:drift:update', driftMod)
            --     end,
            --     onUnChecked = function()
            --         driftMod = false
            --         TriggerEvent('zmain:drift:update', driftMod)
            --     end
            -- })
        end)

        RageUI.IsVisible(petMenu, function()
            if VIP.entity.sorted == true then
                RageUI.Button('Rentrer mon animal', nil, {RigthBadge = RageUI.BadgeStyle.Star}, true, {
                    onSelected = function()
                        TriggerEvent('zmain:vip:animals:remove')
                    end
                })
                RageUI.Button('Demander de s\'asseoir', nil, {RigthBadge = RageUI.BadgeStyle.Star}, not VIP.entity.sitting, {
                    onSelected = function()
                        local entity = Entity(VIP.entity.entityid).state.entityId
                        local entityCoords = GetEntityCoords(entity)

                        local dist = #(GetEntityCoords(PlayerPedId())-entityCoords)

                        if dist > 3 then return
                            ESX.ShowNotification('🐕 Votre animal est trop éloigné de vous')
                        end

                        if not VIP.entity.sitting then
                            loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                            TaskPlayAnim(entity, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                            VIP.entity.sitting = true
                        else
                            ClearPedTasks(entity)
                            VIP.entity.sitting = false
                        end
                    end
                })
                if VIP.entity.sitting then
                    RageUI.Button('Demander de lever', nil, {RigthBadge = RageUI.BadgeStyle.Star}, VIP.entity.sitting, {
                        onSelected = function()
                            local entity = Entity(VIP.entity.entityid).state.entityId
                            local entityCoords = GetEntityCoords(entity)
    
                            local dist = #(GetEntityCoords(PlayerPedId())-entityCoords)
    
                            if dist > 3 then return
                                ESX.ShowNotification('🐕 Votre animal est trop éloigné de vous')
                            end
    
                            ClearPedTasks(entity)
                            VIP.entity.sitting = false
                        end
                    })
                end

                RageUI.Button('Demander de me suivre', nil, {RigthBadge = RageUI.BadgeStyle.Star}, not VIP.entity.followMe, {
                    onSelected = function()
                        TriggerEvent('zmain:vip:animals:followMe')
                    end
                })
                if VIP.entity.followMe == true then
                    RageUI.Button('Demander d\'arrêter me suivre', nil, {RigthBadge = RageUI.BadgeStyle.Star}, VIP.entity.followMe, {
                        onSelected = function()
                            VIP.entity.followMe = false

                            SetTimeout(2000, function()
                                local entity = Entity(VIP.entity.entityid).state.entityId

                                loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                                TaskPlayAnim(entity, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                                VIP.entity.sitting = true
                            end)
                        end
                    })
                end
                RageUI.Button('Donner un nom à mon animal', nil, {RigthBadge = RageUI.BadgeStyle.Star}, VIP.entity.nameActive == false, {
                    onSelected = function()
                        KeyboardUtils.use('Nom de l\'animal', function(data)
                            if data == nil or data == '' then return end

                            TriggerServerEvent('zmain:vip:animals:setName', VIP.entity.entityid, data)

                            VIP.entity.nameActive = true

                            -- TriggerEvent('zmain:animals:setName', data)
                        end)
                    end
                })
                if VIP.entity.nameActive ~= false then
                    RageUI.Button('Changer le nom de mon animal', nil, {RigthBadge = RageUI.BadgeStyle.Star}, true, {
                        onSelected = function()
                            KeyboardUtils.use('Nouveau nom', function(data)
                                if data == nil or data == '' then return end

                                TriggerServerEvent('zmain:vip:animals:editName', VIP.entity.entityid, data)
                            end)
                        end
                    })
                    RageUI.Button('Retirer le nom de mon animal', nil, {Color = {BackgroundColor = {255,0,0,100}}}, true, {
                        onSelected = function()
                            TriggerServerEvent('zmain:vip:animals:removeName', VIP.entity.entityid)
                            VIP.entity.nameActive = false
                        end
                    })
                end
                RageUI.WLine()
            end
            for k,v in ipairs(VIP.animals) do
                RageUI.Button(('%s (%s)'):format(v.label, v.entityName), nil, {RightLabel = '>>'}, true, {
                    onSelected = function()
                        KeyboardUtils.use('Taper Y pour valider', function(data)
                            if data == 'y' or data == 'Y' then
                                if VIP.entity.sorted == true then return ESX.ShowNotification('🐕 Vous avez déjà un animal de sorti') end
                                TriggerServerEvent('zmain:ips:animals:createPed', GetEntityCoords(PlayerPedId()), v.entityName)
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(weaponVipMenu, function()
            local ped = PlayerPedId()
            for k,v in ipairs(ESX.GetWeaponComponents(selectedWeaponName)) do
                local hasAccessories = false
                -- print(HasPedGotWeaponComponent(ped, selectedWeapnHash, v.hash))
                if HasPedGotWeaponComponent(ped, selectedWeapnHash, v.hash) then
                    hasAccessories = true
                end
                RageUI.Checkbox(('%s (%s)'):format(v.label, v.name), nil, hasAccessories, {}, {
                    onChecked = function()
                        GiveWeaponComponentToPed(ped, selectedWeapnHash, v.hash)
                        hasAccessories = true
                    end,
                    onUnChecked = function()
                        RemoveWeaponComponentFromPed(ped, selectedWeapnHash, v.hash)
                        hasAccessories = false
                    end
                })
            end
        end)

        RageUI.IsVisible(mainCaisses, function()
            RageUI.Button('Caisse ~y~VEHICULES~s~', nil, {}, true, {

            }, CaisseSilver)
        end)

        RageUI.IsVisible(CaisseSilver, function()
            BoutiqueConfig:CaisseSilverCount()
        end)

        RageUI.IsVisible(CaisseVisualSilver, function()
            BoutiqueConfig:CaisserVisualLots('vehicle_case')
        end)

        RageUI.IsVisible(mainVehicles, function()
            SetEntityRagdoll = true
            for k,v in pairs(BoutiqueConfig['Voiture']) do
                RageUI.Button(v.label, nil, {RightLabel = ('~b~%s~s~'):format(v.price)}, true, {
                    onActive = function()
                        if ESX.Game.IsSpawnPointClear(boutique.vehiclePosition, 5.0) then
                            if IsModelValid(v.spawnName) then
                                RequestModel(v.spawnName)
                                while not HasModelLoaded(v.spawnName) do
                                    Citizen.Wait(0)
                                end
                                ESX.Game.SpawnLocalVehicle(v.spawnName, boutique.vehiclePosition, 90.0, function(vehicle)
                                    boutique.currentVehicle = vehicle
                                    SetEntityHeading(vehicle, 348.57849121094)
                                    SetEntityCollision(vehicle, false)
                                    SetVehicleDoorsLocked(vehicle, 2)
                                    SetVehicleDirtLevel(vehicle, 0.0)
                                    FreezeEntityPosition(vehicle, true)
                                    SetModelAsNoLongerNeeded(v.spawnName)
                                    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

                                    local name = ("%s"):format(v.label)
                                    local maxSpeed = GetVehicleModelEstimatedMaxSpeed(GetEntityModel(vehicle)) * 1.25
                                    local acceleration = GetVehicleModelAcceleration(GetEntityModel(vehicle)) * 200
                                    local braking = GetVehicleModelMaxBraking(GetEntityModel(vehicle)) * 100;
                                    local traction = GetVehicleModelMaxTraction(GetEntityModel(vehicle)) * 25

                                    if scaleform then
                                        scaleform:callFunction(
                                            "SET_VEHICLE_INFOR_AND_STATS",
                                            name,
                                            --("Coffre : %sKG"):format(CoffreVehicle.Limit[GetEntityModel(vehicle)] ~= nil and CoffreVehicle.Limit[GetEntityModel(vehicle)] or 50),
                                            "CHAR_SOCIAL_CLUB",
                                            "CHAR_SOCIAL_CLUB",
                                            "Vitesse max",
                                            "Accélération",
                                            "Frein",
                                            "Suspension",
                                            maxSpeed,
                                            acceleration,
                                            braking,
                                            traction
                                        )
                                    end
                                end)
                            end
                        else
                            local vehicles = ESX.Game.GetVehiclesInArea(boutique.vehiclePosition, 5.0)
                            for k2,v2 in pairs(vehicles) do
                                if DoesEntityExist(v2) and GetEntityModel(v2) ~= GetHashKey(v.spawnName) then
                                    DeleteVehicle(v2)
                                end
                            end
                        end
                    end,
                    onSelected = function()
                        local PlayerPed = PlayerPedId()
                        KeyboardUtils.use('Taper Y pour l\'acheter / T pour le tester', function(data)
                            if data == 't' or data == 'T' then
                                oldPos = GetEntityCoords(PlayerPedId())
                                boutiqueMENUOpen = false
                                main.Closable = false
                                mainTestVehicles.Closable = false
                                stopprevue()
                                SetEntityVisible(PlayerPedId(), true)
                                RageUI.Visible(mainTestVehicles, true)
                                Wait(500)
                                oldPosPlayer = GetEntityCoords(PlayerPed)
                                exit = true
                                IsTimeFinish = false
                                IsTimeRetest = false
                                IsTimeBoutique = 30
                                SetEntityCoords(PlayerPedId(), vector3(-895.6179, -3203.275, 13.94444))
                                local model = GetHashKey(v.spawnName)
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(100) end
                                local veh = CreateVehicle(model, GetEntityCoords(PlayerPed), 59.733772277832, false, false)
                                SetEntityVisible(PlayerPedId(), false)
                                SetEntityHeading(veh, 24.844232559204)
                                SetVehicleCustomPrimaryColour(veh, 255, 255, 255, 255)
                                SetVehicleNumberPlateText(veh, "BOUTIQUE")
                                SetVehicleCanBeVisiblyDamaged(veh, true)
                                SetVehicleDoorsLocked(veh, 7)
                                SetEntityInvincible(veh, true)
                                TaskWarpPedIntoVehicle(PlayerPed,  veh, -1)
                                SetEntityHeading(veh, 59.733772277832)
                                oldVehBoutiqueTest = veh
                                DisableVehicleExitbOUTIUE()
                                LunchTimerBoutique()
                            elseif (tostring(data)== 'Y') then
                                if InfoPlayer.coins < v.price then return ESX.ShowNotification('~r~Vous ne possédez pas assez de coins') end
                                buyVehicle(v.spawnName, v.label, v.price, v.type)
                            elseif (tostring(data)== 'y') then
                                if InfoPlayer.coins < v.price then return ESX.ShowNotification('~r~Vous ne possédez pas assez de coins') end
                                buyVehicle(v.spawnName, v.label, v.price, v.type)
                            end
                        end)
                    end
                })
            end
        end)

        RageUI.IsVisible(mainTestVehicles, function()
            RageUI.Separator(('Il vous reste : ~b~%s~s~ secondes'):format(IsTimeBoutique or 10))
        end)


        if not RageUI.Visible(main) and
            not RageUI.Visible(mainCaisses) and
            not RageUI.Visible(CaisseSilver) and
            not RageUI.Visible(CaisseVisualSilver) and
            not RageUI.Visible(mainVehicles) and
            not RageUI.Visible(mainTestVehicles) and
            not RageUI.Visible(vipMenu) and
            not RageUI.Visible(weaponVipMenu) and
            not RageUI.Visible(petMenu) and

            not RageUI.Visible(main) then
            main = RMenu:DeleteType('main')
            BoutiqueActive = false
            DeleteEntity(VehicleSpawned[LastVeh])
            if LastVeh ~= nil then
                VehicleSpawned[LastVeh] = nil
                LastVeh = nil
            end
            if (scaleform) then
                SetScaleformMovieAsNoLongerNeeded(scaleform.id)
                scaleform = nil
            end         
            boutique.isInVehicle = false
        end

    end
end

function LunchTimerBoutique()
	Citizen.CreateThread(function()
		while true do
			Wait(1*10*100)
			if IsTimeBoutique >= 1 then
				IsTimeBoutique = IsTimeBoutique-1
            end
			if IsTimeBoutique < 1 then
                IsTimeFinish = true
                exit = false
                while not NetworkHasControlOfEntity(oldVehBoutiqueTest) do
                    Wait(1)
                end
                boutiqueMENUOpen = true
                SetEntityCoords(PlayerPedId(), boutique.lastPos)
                RageUI.CloseAll()
                reopenMenu()
                stopprevue()
                DeleteEntity(oldVehBoutiqueTest)
                IsTimeBoutique = nil
                reopenBoutiqueMenu = true
                openMenuBoutique()
                boutique.isInVehicle = true
                SetEntityVisible(PlayerPedId(), true)
                FreezeEntityPosition(PlayerPedId(), false)

                Wait(100)

                local camCoords = GetOffsetFromEntityInWorldCoords(tempVeh, 3.0, 2.0, 2.0)
                loadedVehicle = true
				break
            end
		end
        Wait(1*200*100)
        IsTimeRetest = true
	end)
end

function DisableVehicleExitbOUTIUE()
    Citizen.CreateThread(function()
        while exit do
            Wait(0)
            DisableControlAction(0, 75, true)
        end
    end)
end

function camVeh()
    local camvoiture = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    SetCamActive(camvoiture, true)
    SetCamParams(camvoiture, vector3(-70.918083190918, -823.94683837891, 327.41213989258) , 0.0 , 0.0 , 42.516128540039, 42.2442, 0, 1, 1, 2)
    SetCamFov(camvoiture, 60.0 --[[ distance (Field Of View) ]])
    RenderScriptCams(true, true --[[ activer l'animation ]], 2000 --[[ temps de l'animation ]], true, true)
end

RegisterCommand('boutique', function()
    openMenuBoutique()
end)

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())

			generatedPlate = string.upper(GetRandomLetter(4) .. GetRandomNumber(4))

		ESX.TriggerServerCallback('boutique:verifierplaquedispo', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('boutique:verifierplaquedispo', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

buyVehicle = function(spawnName, label, price, type)
    local plate = GeneratePlate()
        ESX.Game.SpawnVehicle(spawnName, vector3(748.97686767578, -4407.44140625, -0.65416955947876), GetEntityHeading(PlayerPedId()), function (vehicle)                                            table.insert(sortirvoitureacheter, vehicle)
        SetEntityVisible(vehicle, false)
        print(plate)
        local vehicleProps = ESX.Game.GetVehicleProperties(sortirvoitureacheter[#sortirvoitureacheter])
        vehicleProps.plate = plate
        SetVehicleNumberPlateText(sortirvoitureacheter[#sortirvoitureacheter], plate)
        TriggerServerEvent('shopBoutique:vehicule', vehicleProps, plate, price, label, type)
        Wait(10)
        DeleteEntity(vehicle)
    end)
end

Keys.Register("F3", "boutique", "Menu Boutique", function()
    if boutiqueMENUOpen then
        openMenuBoutique()
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        TriggerServerEvent("boutique:dynamic")
        TriggerServerEvent('boutique:load')
    end
end)

Citizen.CreateThread(function()
    for num, vehicle in ipairs(BoutiqueConfig['Voiture']) do
        AddTextEntryByHash(GetHashKey(vehicle.spawnName), vehicle.label)
    end
end)