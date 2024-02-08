function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(1.0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        return result
    else
        Wait(500)
        return nil
    end
end

argentsolde = 0
argentsoldebank = 0
amountt = nil
to = nil

Aurezia = {
    DeposerList = {"Personnalisé", "~g~500$~s~", "~g~1000$~s~", "~g~1500$~s~"},
    DeposerIndex = 1,
    RetirerList = {"Personnalisé", "~g~500$~s~", "~g~1000$~s~", "~g~1500$~s~"},
    RetirerIndex = 1
}

RegisterNetEvent("eDBank:RefreshArgentBank")
AddEventHandler("eDBank:RefreshArgentBank", function(money, cash)
    argentsoldebank = tonumber(money)
end)

function RefreshArgentBank()
    TriggerServerEvent("eDBank:ArgentBank", action)
end

function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

-- By Dako ----------------------------------------
Keys.Register("E", "-openbankatm", "Ouvrir le menu ATM", function()
    for index, objects in ipairs(Bank.ATMObjects) do
        local myCoords = GetEntityCoords(PlayerPedId())
        local getClosestObjects = GetClosestObjectOfType(myCoords.x, myCoords.y, myCoords.z, 0.7, GetHashKey(objects),
            true, true, true)
        if getClosestObjects ~= 0 then
            playAnim('mp_common', 'givetake2_a', 2500)
            Citizen.Wait(1000)
            OpenMenuBank()
            RefreshArgentBank()
        end
    end
end)

CreateThread(function()
    local interval = 2000
    while true do
        interval = 2000
        Wait(interval)
        for index, objects in ipairs(Bank.ATMObjects) do
            local myCoords = GetEntityCoords(PlayerPedId())
            local getClosestObjects = GetClosestObjectOfType(myCoords.x, myCoords.y, myCoords.z, 0.7, GetHashKey(objects),
                true, true, true)
            if getClosestObjects ~= 0 then
                interval  = 1
               ESX.ShowHelpNotification('[E] pour intéragir')
            end
        end
    end
end)
---------------------------------------------------

