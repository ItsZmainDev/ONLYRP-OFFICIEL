local kmh = 3.6
local mph = 2.23693629
local carspeed = 0
-----------------
--   E D I T   --
-----------------
local speed = kmh -- or mph
local drift_speed_limit = 100.0 
local toggle = 244	 -- Numpad 9

local inDrift = false

local diftMode = true

RegisterNetEvent('zmain:drift:update', function(bool)
	diftMode = bool
end)

-- Thread
-- Citizen.CreateThread(function()

-- 	while true do

-- 		Citizen.Wait(1)

-- 		if IsControlJustPressed(1, 244) then

-- 			driftmode = not driftmode

-- 			if driftmode then
-- 				TriggerEvent("chatMessage", 'DRIFT', { 255,255,255}, '^2ON')
-- 			else
-- 				TriggerEvent("chatMessage", 'DRIFT', { 255,255,255}, '^1OFF')
-- 			end
-- 		end

-- 		if driftmode then

-- 			if IsPedInAnyVehicle(GetPed(), false) then

-- 				CarSpeed = GetEntitySpeed(GetCar()) * speed

-- 				if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then

-- 					if CarSpeed <= drift_speed_limit then  

-- 						if IsControlPressed(1, 21) then
		
-- 							SetVehicleReduceGrip(GetCar(), true)
		
-- 						else
		
-- 							SetVehicleReduceGrip(GetCar(), false)
		
-- 						end
-- 					end
-- 				end
-- 			end
-- 		end
-- 	end
-- end)

AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
    if eventName == 'CEventNetworkPlayerEnteredVehicle' then 
        local entityId = eventArguments[2]
        while GetVehiclePedIsIn(PlayerPedId(), false) == entityId do 
			Wait(0)
			if diftMode then
				local playerPed = PlayerPedId()
				local playerVehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleSeat = GetPedInVehicleSeat(playerVehicle, -1)
	
				CarSpeed = GetEntitySpeed(GetCar()) * speed
	
				if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then
	
					if CarSpeed <= drift_speed_limit then  
	
						if IsControlPressed(1, 21) then
		
							SetVehicleReduceGrip(GetCar(), true)
		
						else
		
							SetVehicleReduceGrip(GetCar(), false)
		
						end
					end
				end
			end
		end
	else
		inDrift = false
	end
end)


-- Function
function GetPed() return GetPlayerPed(-1) end
function GetCar() return GetVehiclePedIsIn(GetPlayerPed(-1),false) end