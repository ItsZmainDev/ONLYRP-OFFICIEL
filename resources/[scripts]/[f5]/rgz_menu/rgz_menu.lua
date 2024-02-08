local menuOn = false

local keybindControls = {
	["F1"] = 289, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166
}

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         local keybindControl = keybindControls["F5"]
--         if IsControlPressed(0, keybindControl) then
--             menuOn = true
--             SendNUIMessage({
--                 type = 'init',
--                 resourceName = GetCurrentResourceName()
--             })
--             SetCursorLocation(0.5, 0.5)
--             SetNuiFocus(true, true)
--             PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
--             while menuOn == true do Citizen.Wait(100) end
--             Citizen.Wait(1000)
--             while IsControlPressed(0, keybindControl) do Citizen.Wait(100) end

--         end
--     end
-- end)

RegisterCommand('rgz_menu', function()
    menuOn = true
    SendNUIMessage({
        type = 'init',
        resourceName = GetCurrentResourceName()
    })
    SetCursorLocation(0.5, 0.5)
    SetNuiFocus(true, true)
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
end)
RegisterKeyMapping('rgz_menu', 'Menu F5', 'keyboard', 'F5')

RegisterNUICallback('closemenu', function(data, cb)
    menuOn = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
    cb('ok')
end)


RegisterNUICallback('openmenu', function(data)
    menuOn = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'destroy'
    })
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
    if data.id == 'inventory' then
        TriggerEvent("c_inventaire:openInventory")
    elseif data.id == 'billing' then
        TriggerEvent("SP:openMenuPersonnel")
    elseif data.id == 'test' then
        TriggerEvent("SP:openMenuPersonnel")		
    elseif data.id == 'id' then
        TriggerEvent("talkiwalkie")
    elseif data.id == 'work' then
        ExecuteCommand('zmainleplusbg')
    elseif data.id == 'menu' then
        TriggerEvent("esx_billing:getBills")  
    elseif data.id == 'phone' then
        TriggerEvent("takeh:openM")
    elseif data.id == 'porter' then
        ExecuteCommand("porter")
    end

--[[
    PATTERN FOR CLIENT
    RegisterNetEvent("esx_billing:openBillings")
    AddEventHandler("esx_billing:openBillings", function()
            ShowBillsMenu()
    end)
]]--

end)
-- Callback function for testing
RegisterNUICallback('testprint', function(data, cb)
    -- Print message
    TriggerEvent('chatMessage', "[test]", {255,0,0}, data.message)

    -- Send ACK to callback function
    cb('ok')
end)
