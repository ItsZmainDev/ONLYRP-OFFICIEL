local primaryColor, secondaryColor = nil, nil

function bateau()
    TriggerServerEvent('zmain:caca:setInstance')
    local anim = true
    DoScreenFadeOut(1000)
    Wait(1500)
    ESX.ShowNotification('✈️ Vous êtes entrain d\'attérrir')
    TriggerEvent('InteractSound_CL:PlayOnOne', 'avionvoi', 1)
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    local boatModel = GetHashKey('jet')
    modelHash = boatModel

    pilotModel = GetHashKey("s_m_m_pilot_01")

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Citizen.Wait(0)
    end

    RequestModel(pilotModel)
    while not HasModelLoaded(pilotModel) do
        Citizen.Wait(0)
    end

    local playerPed = PlayerPedId()


    CreateThread(function()
        while anim == true do
            Wait(0)
            SetPedCanBeDraggedOut(GetPlayerPed(-1), false)
            DisableControlAction(27, 75, true) -- Désactive le bouton de sortie (INPUT_VEH_EXIT)
            DisableControlAction(0, 23, true) -- Désactive le bouton de sortie (INPUT_ENTER)
            DisableControlAction(2, 37, true)
            SetEnableHandcuffs(playerPed, true)
            SetPedCanPlayGestureAnims(playerPed, false)
            FreezeEntityPosition(playerPed,  true)
            DisableControlAction(0, 75, true)
            DisableControlAction(1, 75, true)
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 37, true) -- Select Weapon
            DisableControlAction(0, 47, true)  -- Disable weapon
        end
    end)

    SetOverrideWeather("EXTRASUNNY")
	
    if HasModelLoaded(modelHash) and HasModelLoaded(pilotModel) then

        Boat = CreateVehicle(modelHash, -1650.178, -2753.953, 17.55166, 329.90744018555, false, false)
        primaryColor, secondaryColor = GetVehicleColours(Boat)
        SetVehicleColours(Boat, primaryColor, 1)
        -- CreateThread(function()
        --     SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 90.0/3.6)
        -- end)
        SetVehicleColours(boat, 1, 1)

        pilot = CreatePedInsideVehicle(Boat, 6, pilotModel, -1, true, false)

        SetBlockingOfNonTemporaryEvents(pilot, true)

        local netPedid = NetworkGetNetworkIdFromEntity(pilot)
        SetNetworkIdCanMigrate(netPedid, true)
        NetworkRegisterEntityAsNetworked(pilot)
        NetworkSetEntityInvisibleToNetwork(pilot, true)

        totalSeats = GetVehicleModelNumberOfSeats(modelHash)

        SetPedIntoVehicle(GetPlayerPed(-1), Boat, 0)
      
        SetModelAsNoLongerNeeded(modelHash)
        SetModelAsNoLongerNeeded(pilotModel)
    
        TaskVehicleDriveToCoordLongrange(pilot, Boat, -1377.498, -2282.22, 13.96906, 329.90744018555, 524863, 0)
    end
    
    Wait(2000)

    DoScreenFadeIn(1000)

    Wait(18000)

    DoScreenFadeOut(1500)
    Wait(2000)
    DeleteEntity(pilot)
    DeleteEntity(Boat)
    
    Boat = CreateVehicle(modelHash, -1204.212, -2628.775, 13.94494, 155.0013885498, false, false)
    SetVehicleColours(Boat, primaryColor, 1)
    -- CreateThread(function()
    --     SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 2.0/3.6)
    -- end)
    SetVehicleColours(boat, 1, 1)

    pilot = CreatePedInsideVehicle(Boat, 6, pilotModel, -1, true, false)

    SetBlockingOfNonTemporaryEvents(pilot, true)

    local netPedid = NetworkGetNetworkIdFromEntity(pilot)
    SetNetworkIdCanMigrate(netPedid, true)
    NetworkRegisterEntityAsNetworked(pilot)
    NetworkSetEntityInvisibleToNetwork(pilot, true)

    totalSeats = GetVehicleModelNumberOfSeats(modelHash)

    SetPedIntoVehicle(GetPlayerPed(-1), Boat, 0)
  
    SetModelAsNoLongerNeeded(modelHash)
    SetModelAsNoLongerNeeded(pilotModel)

    TaskVehicleDriveToCoordLongrange(pilot, Boat, -1206.147, -2631.925, 13.94494, 149.53707885742, 524863, 0)

    Wait(500)
    DoScreenFadeIn(1500)

    ESX.ShowNotification('✈️ Vous êtes arrivé à destination')

    TriggerEvent('InteractSound_CL:PlayOnOne', 'doeu', 1)

    Wait(5000)
    FreezeEntityPosition(Boat, true)
    DeleteEntity(pilot)

    TriggerEvent('InteractSound_CL:PlayOnOne', '', 1)

    Wait(13500)
    anim = false
    DoScreenFadeOut(1000)
    Wait(1000)
    DeleteEntity(Boat)
    ClearPedSecondaryTask(playerPed)
    SetEnableHandcuffs(playerPed, false)
    SetPedCanPlayGestureAnims(playerPed,  true)
    FreezeEntityPosition(playerPed, false)
    DisplayRadar(true)
    SetEntityCoords(PlayerPedId(), vector3(-1051.484, -2762.215, 4.639796))
    SetEntityHeading(PlayerPedId(), 330.75811767578)
    Wait(1000)
    DoScreenFadeIn(1000)
    ESX.ShowNotification('Bienvenue sur 🌴 ~p~Only\'RP~s~')

    TriggerServerEvent('zmain:caca:sortInstance')
end