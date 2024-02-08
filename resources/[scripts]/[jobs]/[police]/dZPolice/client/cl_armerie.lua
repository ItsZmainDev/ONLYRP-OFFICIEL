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
local mainMenu6 = RageUI.CreateMenu('Armurie', 'Interaction')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  FreezeEntityPosition(PlayerPedId(), false)
  open = false
end

function ArmerieLSPD()
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
              
              RageUI.Separator("↓ ~y~   Déposer ses armes  ~s~↓")

              RageUI.Button("~g~Déposer ses armes", nil, {RightLabel = "→→"}, true , {
                onSelected = function() 
                  RemoveAllPedWeapons(PlayerPedId(), true)
                  ESX.ShowNotification("Vous avez ~g~déposé ~s~toutes vos ~r~armes ~s~!")
                  end
                })
             
                if ESX.PlayerData.job.grade_name == 'recruit' or ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then  
              RageUI.Separator("↓ ~y~   Equipement de Recrue  ~s~↓")

              RageUI.Button("Equipement de Recrue", nil, {RightLabel = "→→"}, true , {
                onSelected = function() 
                    TriggerServerEvent('equipementrecrue')
                  end
                })

                if ESX.PlayerData.job.grade_name == 'officer' or ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then                
                  RageUI.Separator("↓ ~y~   Equipement D'officer  ~s~↓")
                  RageUI.Button("Equipement de Officer", nil, {RightLabel = "→→"}, true , {
                  onSelected = function() 
                      TriggerServerEvent('equipementofficer')
                    end
                  })

                  if ESX.PlayerData.job.grade_name == 'sergeant' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then                  
                    RageUI.Separator("↓ ~y~   Equipement de Sergent  ~s~↓")
                    RageUI.Button("Equipement de Sergent", nil, {RightLabel = "→→"}, true , {
                    onSelected = function() 
                        TriggerServerEvent('equipementsergeant')
                      end
                    })

                    if ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'boss' then               
                      RageUI.Separator("↓ ~y~   Equipement de Lieutenant  ~s~↓")
                      RageUI.Button("Equipement de Lieutenant", nil, {RightLabel = "→→"}, true , {
                      onSelected = function() 
                          TriggerServerEvent('equipementlieutenant')
                        end
                      })

                      if ESX.PlayerData.job.grade_name == 'boss' then             
                        RageUI.Separator("↓ ~y~   Equipement de Commandant  ~s~↓")
                        RageUI.Button("Equipement de Commandant", nil, {RightLabel = "→→"}, true , {
                        onSelected = function() 
                            TriggerServerEvent('equipementboss')
                          end
                        })

                      end
                  end
                  end
                  end
                end
                end)
                Wait(0)
               end
            end)
         end
      end
		-------------------------------------------------------------------------------------------------------

----OUVRIR LE MENU------------
local position = {
	{x = -1098.887, y = -826.120, z = 14.282}
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
            DrawMarker(22, -1098.887, -826.120, 14.282, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 183, 28, 28, 255, true, true, p19, true)  

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur [~b~E~w~] pour intéragir", 1) 
                if IsControlJustPressed(1,51) then
					ArmerieLSPD()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)