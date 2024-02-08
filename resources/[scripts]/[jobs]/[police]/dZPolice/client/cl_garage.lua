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
local mainMenu6 = RageUI.CreateMenu('~r~Garage', '~r~Véhicule')
mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = false
end

function OpenMenuGarageLSPD()
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

              RageUI.Button("Ranger votre véhicule", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                  local playerPed = PlayerPedId()
      
                  if IsPedSittingInAnyVehicle(playerPed) then
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
            
                    if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                      ESX.ShowNotification('La voiture a été mis en dans le garage')
                      ESX.Game.DeleteVehicle(vehicle)
                       
                    else
                      ESX.ShowNotification('Mais toi place conducteur, ou sortez de la voiture.')
                    end
                  else
                    local vehicle = ESX.Game.GetVehicleInDirection()
            
                    if DoesEntityExist(vehicle) then
                      ESX.ShowNotification('La voiture à été placer dans le garage.')
                      ESX.Game.DeleteVehicle(vehicle)
            
                    else
                      ESX.ShowNotification('Aucune voitures autours')
                    end
                  end
              end,})

              local pCo = GetEntityCoords(PlayerPedId())

              for k,v in pairs(vehicles.car) do
                if v.category ~= nil then 
                  RageUI.Separator(v.category)
                else 
                RageUI.Button(v.label, nil, {RightLabel = "Stock(s): [~b~"..v.stock.."~s~]"}, ESX.PlayerData.job.grade >= v.minimum_grade, {
                    onSelected = function()
                      if v.stock > 0 then
                        Citizen.CreateThread(function()
                          local model = GetHashKey(v.model)
                          RequestModel(model)
                          while not HasModelLoaded(model) do Citizen.Wait(1) end
                          local vehicle = CreateVehicle(model, Config.spawn.spawnvoiture.position.x, Config.spawn.spawnvoiture.position.y, Config.spawn.spawnvoiture.position.z, Config.spawn.spawnvoiture.position.h, true, false)
                          SetModelAsNoLongerNeeded(model)
                          SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                          TriggerServerEvent('ddx_vehiclelock:givekey', 'no', GetVehicleNumberPlateText(vehicle))
                          SetVehicleMaxMods(vehicle)
                          police_garage = false
                          RageUI.CloseAll()
                          v.stock = v.stock - 1
                        end)
                        else 
                          Visual.Subtitle("Plus de véhicule chef", 1) 
                        end
                    end
                })
              end
            end

            for k,v in pairs(vehicles.heli) do
              if v.category ~= nil then 
                RageUI.Separator(v.category)
              else 
              RageUI.Button(v.label, nil, {RightLabel = "Stock(s): [~b~"..v.stock.."~s~]"}, ESX.PlayerData.job.grade >= v.minimum_grade, {
                  onSelected = function()
                    if v.stock > 0 then
                      Citizen.CreateThread(function()
                        local model = GetHashKey(v.model)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(1) end
                        local vehicle = CreateVehicle(model, Config.spawn.spawnheli.position.x, Config.spawn.spawnheli.position.y, Config.spawn.spawnheli.position.z, Config.spawn.spawnheli.position.h, true, false)
                        SetModelAsNoLongerNeeded(model)
                        SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                        TriggerServerEvent('ddx_vehiclelock:givekey', 'no', GetVehicleNumberPlateText(vehicle))
                        SetVehicleMaxMods(vehicle)
                        police_garage = false
                        RageUI.CloseAll()
                        v.stock = v.stock - 1
                      end)
                      else 
                        Visual.Subtitle("Plus de véhicule chef", 1) 
                      end
                  end
              })
            end
          end
            
            end)
          Wait(0)
         end
      end)
   end
end

function spawnuniCarre(car)
  local car = GetHashKey(car)
  RequestModel(car)
  while not HasModelLoaded(car) do
      RequestModel(car)
      Citizen.Wait(0)
  end
  local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
  local vehicle = CreateVehicle(car, Config.spawn.spawnheli.position.x, Config.spawn.spawnheli.position.y, Config.spawn.spawnheli.position.z, Config.spawn.spawnheli.position.h, true, false)
  SetEntityAsMissionEntity(vehicle, true, true)
  local Keys = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
  local plaque = math.random(11, 99) .. Keys[math.random(1, #Keys)] .. Keys[math.random(1, #Keys)] .. Keys[math.random(1, #Keys)] .. math.random(111, 999)
  SetVehicleNumberPlateText(vehicle, plaque) 
  SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
  SetVehicleMaxMods(vehicle)
end


function SetVehicleMaxMods(vehicle)
  local props = {
    modEngine       = 2,
    modBrakes       = 2,
    modTransmission = 2,
    modSuspension   = 3,
    modTurbo        = true,
  }
  ESX.Game.SetVehicleProperties(vehicle, props)
end

----OUVRIR LE MENU------------

local position = {
	{x = -1078.071, y = -845.830, z = 4.884}
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
            DrawMarker(22, -1078.071, -845.830, 4.884, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 183, 28, 28, 255, true, true, p19, true)  

        
            if dist <= 5.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour intéragir avec le ~r~garage", 1) 
                if IsControlJustPressed(1,51) then
                  OpenMenuGarageLSPD()
            end
        end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


