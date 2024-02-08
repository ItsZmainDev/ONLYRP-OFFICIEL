local function OpenVehiclegARAGE()
	CreateThread(function()
		local coords = GetEntityCoords(PlayerPedId(), false)
		local VehUse = GetVehiclePedIsIn(PlayerPedId()) ~= 0 and GetVehiclePedIsIn(PlayerPedId()) or ESX.Game.GetClosestVehicle(coords, 7.0, 0, 71)

		if VehUse == 0 then
			return ESX.ShowNotification('❌ Aucun véhicule proche')
		end

		local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), GetEntityCoords(VehUse))

		if dist > 10 then

			ESX.ShowNotification('❌ Aucun véhicule proche')

		else

			ESX.TriggerServerCallback('zmain:garage:requestPlayerCars', function(isOwnedVehicle)
				if isOwnedVehicle then
					local locked = GetVehicleDoorLockStatus(VehUse)
					if locked == 1 then
						SetVehicleDoorsLocked(VehUse, 2)
						ESX.ShowNotification("❌ Vous avez ~r~fermé~s~ le véhicule.")

					elseif locked == 2 then
						SetVehicleDoorsLocked(VehUse, 1)
						ESX.ShowNotification("✔️ Vous avez ~g~ouvert~s~ le véhicule.")
					end
				else
					return ESX.ShowNotification("❌ Vous n'avez pas les clés de ce véhicule.")
				end
			end, GetVehicleNumberPlateText(VehUse))

			local dict = "anim@mp_player_intmenu@key_fob@"
		
			RequestAnimDict(dict)
			
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
		
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local isNetwork = closestPlayer > 0 and closestDistance < 10.0
			local vehicleKeys = CreateObject(`prop_cuff_keys_01`, playerCoords.x, playerCoords.y, playerCoords.z, isNetwork, false, false)
			AttachEntityToEntity(vehicleKeys, playerPed, GetPedBoneIndex(playerPed, 57005), 0.11, 0.03, -0.03, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
			TaskPlayAnim(playerPed, dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
		
			Citizen.Wait(1500)
		
			ESX.Game.DeleteEntity(vehicleKeys)

			if not DoesEntityExist(VehUse) then return end
			SetVehicleLights(VehUse, 2)
			Wait(200)
			SetVehicleLights(VehUse, 0)
			StartVehicleHorn(VehUse, 100, 1, false)
			Wait(200)
			SetVehicleLights(VehUse, 2)
			Wait(400)
			SetVehicleLights(VehUse, 0)

		end
	end)
end

RegisterCommand("vehicule_lock", function()

   OpenVehiclegARAGE()

end)

RegisterKeyMapping("vehicule_lock", "Ouvrir/Fermer Véhicule", "keyboard", 'U')