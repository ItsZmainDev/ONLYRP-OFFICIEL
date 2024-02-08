AddEventHandler("gameEventTriggered", function(eventName, eventArguments)
    if eventName == 'CEventNetworkPlayerEnteredVehicle' then 
        local entityId = eventArguments[2]
        if DoesEntityExist(entityId) then 
			while GetVehiclePedIsIn(PlayerPedId(), false) == entityId do 
				Wait(0)
				local playerPed = PlayerPedId()
				local playerVehicle = GetVehiclePedIsIn(playerPed, false)
				local vehicleSeat = GetPedInVehicleSeat(playerVehicle, -1)

				if(playerVehicle ~= 0 ) and (not IsPauseMenuActive()) and vehicleSeat == playerPed then
                    HideHudComponentThisFrame(7)
                    HideHudComponentThisFrame(9)
                    SendNUIMessage({
                        action = "show",
                        isMetric = ShouldUseMetricMeasurements(),
                        speed = math.ceil(GetEntitySpeed(playerVehicle)),
                        rpm = GetVehicleCurrentRpm(playerVehicle),
                        gear = GetVehicleCurrentGear(playerVehicle)
                    })
				else
                    SendNUIMessage({
                        action = "hide"
                    })
				end
			end

            SendNUIMessage({
                action = "hide"
            })
		end
	end
end)
