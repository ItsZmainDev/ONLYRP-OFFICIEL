ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

AddEventHandler('esx:playerLoaded', function()
    CreateThread(function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            if skin ~= nil then
                StartConnect()
            end
        end)
    end)
end)

local playerSpawned = false

function StartConnect()
    SendNUIMessage({
        action = "showConnexion",
    })
    SetNuiFocus(true, true)
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityVisible(PlayerPedId(), false, 0)
    CameraConnect = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    SetCamCoord(CameraConnect, 1600.397, -2432.388, 323.4131)
    SetCamRot(CameraConnect, 0.0, 0.0, 26.352119445801)
    SetCamFov(CameraConnect, 90.97)
    ShakeCam(CameraConnect, "HAND_SHAKE", 0.2)
    SetCamActive(CameraConnect, true)
    RenderScriptCams(true, false, 2000, true, true)
    DisplayRadar(false)
end

function ValidateConnect()
    local pPed = PlayerPedId()
    SetNuiFocus(false, false)
    DoScreenFadeOut(1500)
    Wait(2000)
    RenderScriptCams(false, false, 0, true, true)
    Wait(1000)
    FreezeEntityPosition(pPed, false)
    SetEntityVisible(pPed, true, 0)
    DoScreenFadeIn(2000)
    -- TaskStartScenarioInPlace(pPed, "WORLD_HUMAN_STAND_MOBILE", 0, 0)

    ESX.TriggerServerCallback('zmain:getPhoonne', function(cb)
        if cb then
            exports["lb-phone"]:ToggleOpen(true, false)

            exports["lb-phone"]:SendNotification({
                app = 'Twitter',
                title = 'Bienvenue',
                content = 'Bienvenue sur 🌴 Only\'RP',
            })
        else
            ESX.ShowAdvancedNotification("Information", "", "Bienvenue sur ~b~🌌 Only'RP~s~", 'CHAR_MP_FM_CONTACT', 1)
        end
    end)
    Wait(1000)
    DisplayRadar(true)

    playerLoaded = true

    ESX.TriggerServerCallback('zmain:ambulance:getPlayerDead', function(cb)
        if cb then
            TriggerServerEvent('zmain:ambulance:onPlayerDeath')
            ESX.ShowNotification('Vous vous êtes deconnecté en étant mort !')
        end
    end)
end


RegisterNuiCallback("CloseUI", function()
    ValidateConnect()
end)

RegisterCommand("enter", function()
    StartConnect()
end)

exports('playerLoaded', function()
    return playerLoaded
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    playerLoaded = true
end)