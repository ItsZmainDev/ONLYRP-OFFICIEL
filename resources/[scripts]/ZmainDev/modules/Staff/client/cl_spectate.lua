-- Last spectate location stored in a vec3
local lastSpectateLocation
-- Spectated ped
local storedTargetPed
-- Spectated player's client ID
local storedTargetPlayerId
-- Spectated players associated GameTag
local storedGameTag

local function InstructionalButton(controlButton, text)
    ScaleformMovieMethodAddParamPlayerNameString(controlButton)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

local function createScaleformThread()
    CreateThread(function()
        -- yay, scaleforms
        local scaleform = RequestScaleformMovie("instructional_buttons")
        while not HasScaleformMovieLoaded(scaleform) do
            Wait(1)
        end
        PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
        PushScaleformMovieFunctionParameterInt(200)
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
        PushScaleformMovieFunctionParameterInt(1)
        InstructionalButton(GetControlInstructionalButton(1, 194), "Quitter")
        PopScaleformMovieFunctionVoid()


        PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
        PushScaleformMovieFunctionParameterInt(0)
        PushScaleformMovieFunctionParameterInt(0)
        PushScaleformMovieFunctionParameterInt(0)
        PushScaleformMovieFunctionParameterInt(80)
        PopScaleformMovieFunctionVoid()

        while adminManagement.isSpectateMod do
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            Wait(0)
        end
        SetScaleformMovieAsNoLongerNeeded()
    end)
end

local function calculateSpectatorCoords(coords)
    return vec3(coords[1], coords[2], coords[3] - 100.0)
end

local function preparePlayerForSpec(bool)
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, bool)
    SetEntityVisible(playerPed, not bool, 0)
end

local function createSpectatorTeleportThread()
    CreateThread(function()
        while adminManagement.isSpectateMod do
            Wait(500)

            -- Check if ped still exists
            if not DoesEntityExist(storedTargetPed) then
                local _ped = GetPlayerPed(storedTargetPlayerId)
                if _ped == 0 then
                    toggleSpectate(storedTargetPed, storedTargetPlayerId)
                    break
                end
            end

            -- Update Teleport
            local newSpectateCoords = calculateSpectatorCoords(GetEntityCoords(storedTargetPed))
            SetEntityCoords(PlayerPedId(), newSpectateCoords.x, newSpectateCoords.y, newSpectateCoords.z, 0, 0, 0, false)
        end
    end)
end

function toggleSpectate(targetPed, targetPlayerId)
    local playerPed = PlayerPedId()

    if adminManagement.isSpectateMod then
        adminManagement.isSpectateMod = false
        Wait(500)
        --DoScreenFadeOut(500)
        --while not IsScreenFadedOut() do Wait(0) end

        RequestCollisionAtCoord(lastSpectateLocation.x, lastSpectateLocation.y, lastSpectateLocation.z)
        SetEntityCoords(playerPed, lastSpectateLocation.x, lastSpectateLocation.y, lastSpectateLocation.z)
        -- The player is still frozen while we wait for collisions to load
        while not HasCollisionLoadedAroundEntity(playerPed) do
            Wait(5)
        end

        preparePlayerForSpec(false)

        NetworkSetInSpectatorMode(false, storedTargetPed)
        DoScreenFadeIn(500)

        storedTargetPed = nil
    else
        storedTargetPed = targetPed
        storedTargetPlayerId = targetPlayerId
        local targetCoords = GetEntityCoords(targetPed)

        RequestCollisionAtCoord(targetCoords.x, targetCoords.y, targetCoords.z)
        while not HasCollisionLoadedAroundEntity(targetPed) do
            Wait(5)
        end

        NetworkSetInSpectatorMode(true, targetPed)
        DoScreenFadeIn(500)
        adminManagement.isSpectateMod = true
        createSpectatorTeleportThread()
        createScaleformThread()
    end
end

RegisterCommand('zmain:admin:endSpectate', function()
    if (adminManagement) then 
        if adminManagement.isSpectateMod then
            toggleSpectate(storedTargetPed)
            preparePlayerForSpec(false)
        end
    end
end)
RegisterKeyMapping('zmain:admin:endSpectate', '(STAFF) Quitter le mode spectate', 'keyboard', 'BACK')

local function cleanupFailedResolve()
    local playerPed = PlayerPedId()

    RequestCollisionAtCoord(lastSpectateLocation.x, lastSpectateLocation.y, lastSpectateLocation.z)
    SetEntityCoords(playerPed, lastSpectateLocation.x, lastSpectateLocation.y, lastSpectateLocation.z)
    -- The player is still frozen while we wait for collisions to load
    while not HasCollisionLoadedAroundEntity(playerPed) do
        Wait(5)
    end
    preparePlayerForSpec(false)

    DoScreenFadeIn(500)
end

-- Client-side event handler for an authorized spectate request
RegisterNetEvent('zmain:admin:specPlayerResp', function(targetServerId, coords)
    local spectatorPed = PlayerPedId()
    lastSpectateLocation = GetEntityCoords(spectatorPed)

    local targetPlayerId = GetPlayerFromServerId(targetServerId)
    if targetPlayerId == PlayerId() then
        return ESX.ShowNotification('Vous ne pouvez pas vous spectate vous même')
    end

    --DoScreenFadeOut(500)
    --while not IsScreenFadedOut() do Wait(0) end

    local tpCoords = calculateSpectatorCoords(coords)
    SetEntityCoords(spectatorPed, tpCoords.x, tpCoords.y, tpCoords.z, 0, 0, 0, false)
    preparePlayerForSpec(true)

    --- We need to wait to make sure that the player is actually available once we teleport
    --- this can take some time so we do this. Automatically breaks if a player isn't resolved
    --- within 5 seconds.
    local resolvePlayerAttempts = 0
    local resolvePlayerFailed

    repeat
        if resolvePlayerAttempts > 100 then
            resolvePlayerFailed = true
            break;
        end
        Wait(50)
        targetPlayerId = GetPlayerFromServerId(targetServerId)
        resolvePlayerAttempts = resolvePlayerAttempts + 1
    until (GetPlayerPed(targetPlayerId) > 0) and targetPlayerId ~= -1

    if resolvePlayerFailed then
        return cleanupFailedResolve()
    end

    toggleSpectate(GetPlayerPed(targetPlayerId), targetPlayerId)
end)