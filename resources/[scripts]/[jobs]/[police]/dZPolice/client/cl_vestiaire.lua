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

-- Function --

function applySkinSpecific(infos)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local uniformObject
		if skin.sex == 0 then
			uniformObject = infos.variations.male
		else
			uniformObject = infos.variations.female
		end
		if uniformObject then
			TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
		end

		infos.onEquip()
	end)
end

-- MENU FUNCTION --

local open = false 
local mainMenu6 = RageUI.CreateMenu('~b~Vestaire', '~b~Ouverture du cassier..')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenVestiaireLSPD()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 

              RageUI.Separator("↓ ~y~Tenues de service ~s~↓")
                for _,infos in pairs(PoliceCloak.clothes.specials) do
                  RageUI.Button(infos.label, nil, {RightLabel = ">"}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                    onSelected = function()
                        applySkinSpecific(infos)
                      end
                    })

                    -- RageUI.Separator("~o~Gestion du Gilet par balle")
                    -- for _,infos in pairs(PoliceCloakGilet.clothesGilet.gilet) do
                    --   RageUI.Button(infos.labelGilet, nil, {RightLabel = ">"}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                    --     onSelected = function()
                    --         applySkinSpecific(infos)
                    --         SetPedArmour(PlayerPedId(), 100)
                    --       end
                    --     })
                    --   end

              end
            end)
          Wait(0)
         end
      end)
   end
end

----OUVRIR LE MENU------------

local position = {
	{x = -1098.217, y = -831.256, z = 14.282}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 5.0 then
            wait = 0
            DrawMarker(22, -1098.217, -831.256, 14.282, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 183, 28, 28, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour intéragir avec les ~r~vestiaire", 1) 
                if IsControlJustPressed(1,51) then
                  OpenVestiaireLSPD()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


