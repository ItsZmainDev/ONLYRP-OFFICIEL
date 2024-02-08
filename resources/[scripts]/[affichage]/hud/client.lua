ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local loaded = false
local open = false
local close = false
local show = false
local hunger, thirst, oxygen, alcool = 0, 0, 0, 0

local seatbelt = false
local cs, fs = 0.0, 0.0
local limiter = false

local cinematic = false
local mapalways = true
local firstmap = false

local defaultAspectRatio = 1920/1080 -- Don't change this.
local resolutionX, resolutionY = GetActiveScreenResolution()
local aspectRatio = resolutionX/resolutionY
local minimapOffset = 0
if aspectRatio > defaultAspectRatio then
	minimapOffset = ((defaultAspectRatio-aspectRatio)/3.6)-0.008
end

CreateThread(function()
	local attempppp = 0
	while true do
		if 	hunger < 1 or thirst < 1 then
			ESX.ShowNotification('Vous êtes trop faible, ~b~hydratez~s~ et ~y~nourrissez~s~ vous !')
			SetEntityHealth(PlayerPedId(), GetEntityHealth()-5)
		else
			-- FreezeEntityPosition(PlayerPedId(), false)
		end
		if 	hunger < 50 or thirst < 50 then
			attempppp = attempppp + 1

			if attempppp < 2 then
				ESX.ShowNotification('Vous êtes trop faible, ~b~hydratez~s~ et ~y~nourrissez~s~ vous !')
			end
		end
		local ped = PlayerPedId()
		local vhc = IsPedInAnyVehicle(ped, false)
		local heal = GetEntityHealth(ped) - 100
		local armour = GetPedArmour(ped)
		local p = PlayerId()
        local sleep = Config.RefreshTime
        local pos = GetEntityCoords(ped)
		SetPedConfigFlag(ped, 35, false)
		if loaded then
			if not IsPauseMenuActive() then
				if vhc then
					local vehicle = GetVehiclePedIsIn(ped, false)
					inVehicle = true
					if GetPedInVehicleSeat(vehicle, -1) then
                        sleep = Config.RefreshTimeInCar
						close = false
						local door    = false
						local lights  = false
						local engine  = GetIsVehicleEngineRunning(vehicle)
						local fuel    = GetVehicleFuelLevel(vehicle)
						local sped    = math.floor((tonumber(GetEntitySpeed(vehicle))) * 3.6)
                        local damage  = GetVehicleEngineHealth(vehicle)
                        local rpm     = GetVehicleCurrentRpm(vehicle)
                        local gear    = GetVehicleCurrentGear(vehicle)
                        local hbreake = GetVehicleHandbrake(vehicle)
                        local _,lightson,highbeams = GetVehicleLightsState(vehicle)

						if GetVehicleDoorAngleRatio(vehicle, 0) ~= 0 then
							door = true
						end
						if GetVehicleDoorAngleRatio(vehicle, 1) ~= 0 then
							door = true
						end
						if GetVehicleDoorAngleRatio(vehicle, 2) ~= 0 then
							door = true
						end
						if GetVehicleDoorAngleRatio(vehicle, 3) ~= 0 then
							door = true
						end
						if GetVehicleDoorAngleRatio(vehicle, 4) ~= 0 then
							door = true
						end
						if GetVehicleDoorAngleRatio(vehicle, 5) ~= 0 then
							door = true
						end

						SendNUIMessage({
							type    = "carStatus",
							engine  = engine,
							door    = door,
							light   = lightson,
							fuel    = fuel,
							speed   = sped,
                            ehealt  = damage,
                            rpm     = rpm,
                            gear    = gear,
                            hbreake = hbreake,
                            belt    = seatbelt,
						})

						if not open then
							open = true
							SendNUIMessage({
								type   = "inCar"
							})
							seatbelt = false
						end

					else
                        sleep = Config.RefreshTime
					end
				else
                    sleep = Config.RefreshTime
					open = false
					inVehicle = false
					seatbelt = false
					if not close then
						close = true
						SendNUIMessage({
							type   = "outCar"
						})
					end
				end

                if not IsEntityInWater(ped) then
					oxygen = 100 - GetPlayerSprintStaminaRemaining(p)
				end

				if IsEntityInWater(ped) then


					sleep = 150

					oxygen = GetPlayerUnderwaterTimeRemaining(p) * 10

					if oxygen <= 0 then
						SetEntityHealth(PlayerPedId(), 0)
					end
				end

				SendNUIMessage({
					type 	= "playerStatus",
					heal    = heal,
					armour  = armour,
					hunger  = hunger,
					thirst  = thirst,
					alcool  = alcool,
                    oxygen  = oxygen,
                    weather = IsEntityInWater(ped)
				})

				if not show then
					show = true
					SendNUIMessage({
						type = "show"
					})
					TriggerEvent('tempui:toggleUi', true)
				end

			else
				show = false
				SendNUIMessage({
					type = "pause"
				})
				TriggerEvent('tempui:toggleUi', false)
			end
		end
		Wait(sleep)
	end
end)

CreateThread(function()
	while true do
		local p = PlayerId()
		if not Config.Saltychat then
			SendNUIMessage({
				type  = 'mic',
				state = NetworkIsPlayerTalking(p)
			})
		end
		Wait(250)
	end
end)

CreateThread(function()
	-- local minimap = RequestScaleformMovie("minimap")
    -- SetRadarBigmapEnabled(false, false)

	while true do

		Citizen.Wait(0)

		-- BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        -- ScaleformMovieMethodAddParamInt(3)
        -- EndScaleformMovieMethod()

		if loaded then
			
			if inVehicle then
				HideHudComponentThisFrame(6)
				HideHudComponentThisFrame(7)
				HideHudComponentThisFrame(8)
				HideHudComponentThisFrame(9)
				HideHudComponentThisFrame(4) -- ID pour le texte d'armure

				if seatbelt then
					DisableControlAction(0, 75)
				end

				if not cinematic then
					--DisplayRadar(true)
				else
					--DisplayRadar(false)
				end

				local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
				fs = cs
				cs =  GetEntitySpeed(vehicle)
				mfwd = GetEntitySpeedVector(vehicle, true).y > 1.0
				vhfr = (fs - cs) / GetFrameTime() > 981
				
				if not seatbelt then
					if mfwd and fs*3.6 > 80 and vhfr then
						ragdollP()
					else
						prevVelocity = GetEntityVelocity(vehicle)
					end
				end
			else
				
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do 
		Wait(5000)
		if inVehicle then 
			if not seatbelt then 
				TriggerEvent('InteractSound_CL:PlayOnOne',  'beltalarm', 0.7)
			end
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	Wait(2500)
	SendNUIMessage({
		type = "pLoaded"
	})
	first()
	loaded = true
	ScaleformMovieMethodAddParamInt(3)
end)

AddEventHandler('onClientResourceStart', function(resName)
	if (GetCurrentResourceName() == resName) then
        Wait(500)
        SendNUIMessage({
            type = "pLoaded"
        })
		first()
        loaded = true

		show = true
		SendNUIMessage({
			type = "show"
		})
	end
end)

CreateThread(function()
	hunger = 100
	thirst = 100
	alcool = 100
end)

-- RegisterNetEvent('esx_status:onTick', function(status)
-- 	for k,v in pairs(status) do
-- 		if v.name == "hunger" then
-- 			hunger = v.percent
-- 		end
-- 		if v.name == "thirst" then
-- 			thirst = v.percent
-- 		end
-- 	end
-- end)

AddEventHandler('esx_newui:updateBasics', function(status)
	for k,v in pairs(status) do
		if v.name == "hunger" then
			hunger = v.percent
		end
		if v.name == "thirst" then
			thirst = v.percent
		end
	end
end)


AddEventHandler("food:updateValue", function(h,t)
	hunger = h
	thirst = t
end)

RegisterNetEvent('SaltyChat_TalkStateChanged', function(status)
    SendNUIMessage({
		type  = 'mic',
		state = status
	})
end)

RegisterNetEvent('SaltyChat_VoiceRangeChanged', function(range)
	SendNUIMessage({
		type  = "micDistance",
		range = Config.SaltychatRange[tostring(range)][2],
		rname = Config.SaltychatRange[tostring(range)][1]
	})
end)

RegisterNetEvent('pma-voice:setTalkingMode', function(ranges)
	SendNUIMessage({
		type  = "micDistance",
		range = Config.PmaRange[ranges][2],
		rname = Config.PmaRange[ranges][1]
	})
end)

RegisterNetEvent('wais:hudShow', function(boolen)
	if boolen then
		SetNuiFocus(false, false)
		SendNUIMessage({
			type = "triggerevent",
			state = true
		})
	else
		SendNUIMessage({
			type = "triggerevent",
			state = false
		})
	end
end)

RegisterCommand("ss", function()
	local boolen = true
	if boolen then
		SetNuiFocus(false, false)
		SendNUIMessage({
			type = "triggerevent",
			state = true
		})
	else
		SendNUIMessage({
			type = "triggerevent",
			state = false
		})
	end
end)

RegisterKeyMapping('seatbelt', 'Mettre la Ceinture', 'keyboard', Config.Sealtbelt)
RegisterCommand('seatbelt', function()
	if not IsPauseMenuActive() then
		if inVehicle then
			if not seatbelt then
				TriggerEvent('InteractSound_CL:PlayOnOne',  'seatbelt', 0.7)
				--ESX.ShowNotification('Belt plug')
				seatbelt = true
			else
				TriggerEvent('InteractSound_CL:PlayOnOne',  'seatbeltoff', 0.7)
				--ESX.ShowNotification('Belt interest')
				seatbelt = false
			end
		end
	end
end)

RegisterKeyMapping('hud', 'Open hud settings', 'keyboard', Config.SettingsMenu)
RegisterCommand('hud', function()
	if not IsPauseMenuActive() then
		SetNuiFocus(true, true)
		SendNUIMessage({
			type = "menu_open"
		})
	end
end)

RegisterNUICallback('close', function()
	SendNUIMessage({
		type = "menu_close"
	})
	SetNuiFocus(false, false)
end)

RegisterNUICallback('checkbox', function(data)
	if data.data == "map" then
		if data.state then
			loadmap("circle")
		else
			loadmap("square")
		end
	elseif data.data == "cinematic" then
		cinematic = data.state
	elseif data.data == "showmap" then
		mapalways = data.state
	end
end)

-- RegisterNUICallback('loadnui', function(data)
-- 	CreateThread(function()
-- 		while true do
-- 			if firstmap then
-- 				if data.showmap == "true" then
-- 					mapalways = true
-- 				elseif data.showmap == "false" then
-- 					mapalways = false
-- 				end
-- 				loadmap(data.maptype)
-- 				break
-- 			end
-- 			Citizen.Wait(1)
-- 		end
-- 	end)
-- end)

function ragdollP()
    if not seatbelt then 
		playerPed = PlayerPedId()
        local position = GetEntityCoords(playerPed)
        SetEntityCoords(playerPed, position.x, position.y, position.z - 0.47, true, true, true)
        SetEntityVelocity(playerPed, prevVelocity.x, prevVelocity.y, prevVelocity.z)
        Citizen.Wait(1)
        SetPedToRagdoll(playerPed, 1000, 1000, 0, 0, 0, 0)
        Citizen.Wait(1000)
    end
end

function loadmap(maptype)
end

function first() 
end