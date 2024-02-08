ESX = nil
societypolice = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

-- MENU FUNCTION --

local open = false 
local mainMenu = RageUI.CreateMenu('~r~Boss Action', '~r~interaction')
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end


function OpenMenuBossLSPD()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
            RageUI.IsVisible(mainMenu,function() 
            
                if societypolice ~= nil then
                    RageUI.Button('Argent de la société:', " ", {RightLabel = "~g~"..societypolice.."$"}, true, {onSelected = function()end});   
                end
                RageUI.Separator("↓ Actions ↓") 
                RageUI.Button('Retirer de l\'argent.', " ", {RightLabel = ">"}, true, {onSelected = function()
                    local money = KeyboardInput('Combien voulez vous retirer :', '', 10)
                    TriggerServerEvent("police:withdrawMoney","society_"..ESX.PlayerData.job.name ,money)
                    RefreshMoney()
                end});   
    
                RageUI.Button('Déposer de l\'argent.', " ", {RightLabel = ">"}, true, {onSelected = function()
                    local money = KeyboardInput('Combien voulez vous retirer :', '', 10)
                    TriggerServerEvent("police:depositMoney","society_"..ESX.PlayerData.job.name ,money)
                    RefreshMoney()
                end});
                
               end)
             Wait(0)
            end
         end)
      end
    end


    function RefreshMoney()
        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
            ESX.TriggerServerCallback('police:getSocietyMoney', function(money)
                societypolice = money
            end, "society_"..ESX.PlayerData.job.name)
        end
    end
    
    function Updatessocietypolicemoney(money)
        societypolice = ESX.Math.GroupDigits(money)
        
    end
    
    
    function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
    
        AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
        DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
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

----OUVRIR LE MENU------------

local position = {
	{x = -1113.222, y = -832.994, z = 34.361}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'boss' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(22, -1113.222, -832.994, 34.361, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 183, 28, 28, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour le Menu ~r~Boss", 1) 
                if IsControlJustPressed(1,51) then
                    OpenMenuBossLSPD()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)