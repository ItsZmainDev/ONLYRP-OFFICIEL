JailData, inJail, inTimer = {}, false, nil

TimerBar = function(seconds)
    local timerValue = {}
    local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0
    if seconds <= 0 then
        return 0, 0
    else
        local hours = string.format('%02.f', math.floor(seconds / 3600))
        local mins = string.format('%02.f', math.floor(seconds / 60 - (hours * 60)))
        local secs = string.format('%02.f', math.floor(seconds - hours * 3600 - mins * 60))
        timerValue = {mins, secs}
        return timerValue
    end
end

Input = function(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
		blockinput = false
        return result
    else
        Citizen.Wait(500)
		blockinput = false
        return nil
    end
end

RegisterNetEvent("cxJail:receiveInfos")
AddEventHandler("cxJail:receiveInfos", function(receiveData)
    if Jails.MenuIsOpen then 
        JailData = receiveData
    end
end)

ZmainUI = nil

TriggerEvent('ZmainUI:sendShared', function(obj) ZmainUI = obj end)

RegisterNetEvent("cxJail:jailPlayer")
AddEventHandler("cxJail:jailPlayer", function(timeValue, staffName)
    SetEntityCoords(PlayerPedId(), Jails.Settings.JailZone)
    inJail = true 
    inTimer = timeValue
    ESX.ShowNotification("Vous avez été mis au jail !")
    if Jails.Settings.ViewOtherPlayer then 
        TriggerServerEvent("cxJail:setBucket")
    end
    CreateThread(function()
        while inTimer ~= nil do 
            inTimer = inTimer - 1 
            TriggerServerEvent("cxJail:updateTime", inTimer)
            if inTimer == 0 then 
                TriggerEvent("cxJail:exitPlayer")
            end
            Wait(1000)
        end
    end)
    CreateThread(function()
        while inJail do 
            local pCoords = GetEntityCoords(PlayerPedId())
            if #(pCoords - Jails.Settings.JailZone) > 100 then 
                SetEntityCoords(PlayerPedId(), Jails.Settings.JailZone)
            end
            -- DisableControlAction(2, 30, true)
			-- DisableControlAction(2, 31, true)
			-- DisableControlAction(2, 32, true)
			-- DisableControlAction(2, 33, true)
			-- DisableControlAction(2, 34, true)
			-- DisableControlAction(2, 35, true)
			-- DisableControlAction(2, 322, true)
			-- DisableControlAction(0, 25, true) 
            -- DisableControlAction(0, 24, true) 
            -- DisableControlAction(0, 1, true) 
            -- DisableControlAction(0, 2, true) 
            -- DisableControlAction(0, 257, true) 
            -- DisableControlAction(0, 263, true) 
            -- DisableControlAction(0, 45, true) 
            -- DisableControlAction(0, 44, true) 
            -- DisableControlAction(0, 37, true) 
            -- DisableControlAction(0, 23, true) 
            -- DisableControlAction(0, 73, true) 
            -- DisableControlAction(2, 199, true) 
            -- DisableControlAction(0, 288,  true) 
            -- DisableControlAction(0, 289, true) 
            -- DisableControlAction(0, 170, true) 
            -- DisableControlAction(0, 167, true) 
            -- DisableControlAction(0, 327, true) 
            -- DisableControlAction(0, 318, true)  
            -- DisableControlAction(0, 0, true) 
            -- DisableControlAction(0, 26, true) 
            -- DisableControlAction(0, 73, true)
            -- DisableControlAction(2, 199, true) 
            -- DisableControlAction(0, 59, true) 
            -- DisableControlAction(0, 71, true) 
            -- DisableControlAction(0, 72, true) 
            -- DisableControlAction(2, 36, true) 
            -- DisableControlAction(0, 47, true)  
            -- DisableControlAction(0, 264, true) 
            -- DisableControlAction(0, 257, true) 
            -- DisableControlAction(0, 140, true) 
            -- DisableControlAction(0, 141, true) 
            -- DisableControlAction(0, 142, true) 
            -- DisableControlAction(0, 143, true) 
            -- DisableControlAction(0, 75, true)  
            -- DisableControlAction(27, 75, true) 
            Time = TimerBar(inTimer)
            exports['ZmainUI']:drawInfo('Informations Jail', {
                {titlebar = 'Temps', subtitle = Time[1]..':'..Time[2]},
                {titlebar2 = 'Staff', subtitle2 = staffName},
            })
            Wait(1)
        end
    end)
end)

RegisterNetEvent("cxJail:exitPlayer")
AddEventHandler("cxJail:exitPlayer", function()
    SetEntityCoords(PlayerPedId(), Jails.Settings.ExitZone)
    inJail, inTimer = false, nil
    TriggerServerEvent("cxJail:unjailPlayer")
    if Jails.Settings.ViewOtherPlayer then 
        TriggerServerEvent("cxJail:setNormalBucket")
    end
    exports['ZmainUI']:hide()
end)