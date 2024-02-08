ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local knockedOut = false
local wait = 15
local count = 60

Citizen.CreateThread(function()
	while true do
		Wait(1)
		local myPed = GetPlayerPed(-1)
		if IsPedInMeleeCombat(myPed) then
			if GetEntityHealth(myPed) < 115 then
				TriggerEvent('zmain:anticheat:bypassGodMod', true)
				SetPlayerInvincible(PlayerId(), true)
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
				ShowNotification("~r~Vous etes KO !")
				wait = 15
				knockedOut = true
				SetEntityHealth(myPed, 116)
			end
		end
		if knockedOut == true then
			SetPlayerInvincible(PlayerId(), true)
			DisablePlayerFiring(PlayerId(), true)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			ResetPedRagdollTimer(myPed)
			
			if wait >= 0 then
				count = count - 1
				if count == 0 then
					count = 60
					wait = wait - 1
					SetEntityHealth(myPed, GetEntityHealth(myPed)+4)
				end
			else
				SetPlayerInvincible(PlayerId(), false)
				knockedOut = false
				TriggerEvent('zmain:anticheat:bypassGodMod', false)
			end
		end
	end
end)


-- AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
--     if eventName == "CEventNetworkEntityDamage" then
-- 		if (GetWeaponDamageType(weaponUsed) == 2) and weaponUsed ~= -1716189206 then 
-- 			imKoWithMelee = true
-- 			ESX.ShowNotification('Vous ête KO !')
-- 			Citizen.SetTimeout(10000, function()
-- 				imKoWithMelee = false
-- 			end)
-- 			while imKoWithMelee do 
-- 				Wait(0)
-- 				DisablePlayerFiring(PlayerId(), true)
-- 				SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
-- 				ResetPedRagdollTimer(PlayerPedId())
-- 			end
-- 		end
-- 	end
-- end)

function ShowNotification(text)
	ESX.ShowNotification(text)
end

-- local NumberJump = 15

-- Citizen.CreateThread(function()
--   local Jump = 0
--   while true do

--       Citizen.Wait(1)

--       local ped = PlayerPedId()

--       if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then

--         Jump = Jump + 1

--           if Jump == NumberJump then

--               SetPedToRagdoll(ped, 5000, 1400, 2)

--               Jump = 1

--           end

--       else 

--           Citizen.Wait(500)
          
--       end
--   end
-- end)

-- CONFIG --

-- Allow passengers to shoot
local passengerDriveBy = false

-- CODE --

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Wait(1)

-- 		playerPed = GetPlayerPed(-1)
-- 		car = GetVehiclePedIsIn(playerPed, false)
-- 		if car then
-- 			if GetPedInVehicleSeat(car, -1) == playerPed then
-- 				SetPlayerCanDoDriveBy(PlayerId(), false)
-- 			elseif passengerDriveBy then
-- 				SetPlayerCanDoDriveBy(PlayerId(), true)
-- 			else
-- 				SetPlayerCanDoDriveBy(PlayerId(), false)
-- 			end
-- 		end
-- 	end
-- end)

AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
	local inCar = false
    if eventName == 'CEventNetworkPlayerEnteredVehicle' then 
		inCar = true
        local entityId = eventArguments[2]
        if DoesEntityExist(entityId) then 
			while GetVehiclePedIsIn(PlayerPedId(), false) == entityId and inCar do 
				Wait(1)
				playerPed = GetPlayerPed(-1)
				car = GetVehiclePedIsIn(playerPed, false)
				if car then
					if GetPedInVehicleSeat(car, -1) == playerPed then
						SetPlayerCanDoDriveBy(PlayerId(), false)
					elseif passengerDriveBy then
						SetPlayerCanDoDriveBy(PlayerId(), true)
					else
						SetPlayerCanDoDriveBy(PlayerId(), false)
					end
				end
				if not inCar then
					break
				end
			end
			
            inCar = false
		end
	end
end)

