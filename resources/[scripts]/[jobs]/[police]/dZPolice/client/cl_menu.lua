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

local PlayerData, CurrentActionData, handcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, IsHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
blip = nil
local policeDog = false
local PlayerData = {}
closestDistance, closestEntity = -1, nil
local IsHandcuffed, DragStatus = false, {}
DragStatus.IsDragged          = false
local attente = 0
local currentTask = {}

-- MenuFouille

local Items = {}      
local Armes = {}    
local ArgentSale = {} 

local PlayerData = {}

local function MarquerJoueur()
	local ped = GetPlayerPed(ESX.Game.GetClosestPlayer())
	local pos = GetEntityCoords(ped)
	local target, distance = ESX.Game.GetClosestPlayer()
	if distance <= 4.0 then
	DrawMarker(2, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 1, nil, nil, 0)
end
end

local function getPlayerInv(player)
	Items = {}
	Armes = {}
	ArgentSale = {}
	
	ESX.TriggerServerCallback('police:getOtherPlayerData', function(data)
		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(ArgentSale, {
					label    = ESX.Math.Round(data.accounts[i].money),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})
	
				break
			end
		end
	
		for i=1, #data.weapons, 1 do
			table.insert(Armes, {
				label    = ESX.GetWeaponLabel(data.weapons[i].name),
				value    = data.weapons[i].name,
				right    = data.weapons[i].ammo,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end
	
		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(Items, {
					label    = data.inventory[i].label,
					right    = data.inventory[i].count,
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end
	end, GetPlayerServerId(player))
	end

object = {}


local PropsLSPD = {
    {label = "Cone", props = "prop_roadcone02a"},
    {label = "Barrière", props = "prop_barrier_work05"},
    {label = "Gros carton", props = "prop_boxpile_07d"},
    {label = "Herse", props = "p_ld_stinger_s"},
}
-- MENU FUNCTION --

local open = false 
local mainMenu8 = RageUI.CreateMenu('', '~r~Interaction')
local MenuProps = RageUI.CreateMenu('~r~Menu Props', '~r~Interation')
local lspd = RageUI.CreateMenu('~r~Props LSPD', '~r~Interation')
local suppr = RageUI.CreateMenu('~r~Suppression', '~r~Interation')
local subMenu8 = RageUI.CreateSubMenu(mainMenu8, "~r~Annonces", "~r~Interaction")
local subMenu14 = RageUI.CreateSubMenu(mainMenu8, "~r~Infos Radio", "~r~Interaction")
local subMenu10 = RageUI.CreateSubMenu(mainMenu8, "~r~Renfort", "~r~Demande de Renfort")
local subMenu12 = RageUI.CreateSubMenu(mainMenu8, "~r~Chien", "~r~Interaction Chien")
local CitoyenFouille = RageUI.CreateSubMenu(mainMenu8, "Intéraction", "LSPD")
local subMenu11 = RageUI.CreateSubMenu(mainMenu8, "Intéraction", "LSPD")
local CitoyenPerso = RageUI.CreateSubMenu(mainMenu8, "Intéraction", "LSPD")
local subMenu13 = RageUI.CreateSubMenu(mainMenu8, "Fouille", "LSPD")
local subMenu16 = RageUI.CreateSubMenu(mainMenu8, "Licence", "LSPD")
local cam = RageUI.CreateSubMenu(mainMenu8, "Caméra", "LSPD")
mainMenu8.Display.Header = true 
mainMenu8.Closed = function()
  open = false
end

function OpenMenuF6LSPD()
	if open then 
		open = false
		RageUI.Visible(mainMenu8, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu8, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu8,function() 

			RageUI.Checkbox("Prendre son service", nil, servicelspdnation, {}, {
                onChecked = function(index, items)
					prisedeservice()
                    servicelspdnation = true
					ESX.ShowNotification("~g~Vous avez pris votre service !")
                end,
                onUnChecked = function(index, items)
					findeservice()
                    servicelspdnation = false
					ESX.ShowNotification("~r~Vous avez quitté votre service !")
                end
            })

			if servicelspdnation then
			RageUI.Button("Infos Radio", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu14)

			RageUI.Button("Amende", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
					OpenBillingMenuLSPD()
					LogsAmende()
                    RageUI.CloseAll()
				end
			})

			RageUI.Button("Demande de renfort", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu10)

			RageUI.Button("Gérer les license", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
		   }, subMenu16)

			RageUI.Button("Intéraction Citoyen", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, CitoyenFouille)

			RageUI.Button("Intéraction Personnelle", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, CitoyenPerso)

			RageUI.Button("Intéraction sur un Véhicule", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu11)

			RageUI.Button("Menu K-9", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu12)

			RageUI.Button("Props LSPD", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, MenuProps)

			RageUI.Button("Menu Caméra", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, cam)

		end
			end)

			RageUI.IsVisible(cam,function() 

				RageUI.Button("Caméra 1 (Ballas)", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 25) 
					end
				})
	
				RageUI.Button("Caméra 2 (Families)", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 26) 
					end
				})
	
				RageUI.Button("Caméra 3 (Vagos)", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 27) 
					end
				})

				RageUI.Button("Caméra 4 (Superette Unicorn)", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 1) 
					end
				})

				RageUI.Button("Caméra 5 (Superette Ballas)", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 2) 
					end
				})

				RageUI.Button("Caméra 6 (Superette Ballas)", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 3) 
					end
				})

				RageUI.Button("Caméra 7 (Superette BurgerShot)", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 4) 
					end
				})

				RageUI.Button("Caméra 8 (Superette Taxi)", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 5) 
					end
				})

				RageUI.Button("Caméra 9 (Superette Vinewood)", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 6) 
					end
				})

				RageUI.Button("Caméra 10 (", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 7) 
					end
				})

				RageUI.Button("Caméra 11", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 8) 
					end
				})

				RageUI.Button("Caméra 12", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 9) 
					end
				})

				RageUI.Button("Caméra 13", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 10) 
					end
				})

				RageUI.Button("Caméra 14", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 11) 
					end
				})

				RageUI.Button("Caméra 15", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 12) 
					end
				})

				RageUI.Button("Caméra 16", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 13) 
					end
				})

				RageUI.Button("Caméra 17", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 14) 
					end
				})

				RageUI.Button("Caméra 18", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 15) 
					end
				})
				RageUI.Button("Caméra 19", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 16) 
					end
				})

				RageUI.Button("Caméra 20", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 17) 
					end
				})

				RageUI.Button("Caméra 21", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 18) 
					end
				})

				RageUI.Button("Caméra 22", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 19) 
					end
				})

				RageUI.Button("Caméra 23", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 20) 
					end
				})

				RageUI.Button("Caméra 24", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 21) 
					end
				})

				RageUI.Button("Caméra 25", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 22) 
					end
				})

				RageUI.Button("Caméra 26", nil, {RightLabel = "→→"}, true , {
					onSelected = function()
						TriggerEvent('cctv:camera', 23) 
					end
				})
				end)

			RageUI.IsVisible(subMenu11,function() 

				RageUI.Button("Rechercher une plaque", nil, {RightLabel = "→"}, true , {
					onSelected = function()
						local numplaque = KeyboardInput("Combien ?", "", 10)
						local length = string.len(numplaque)
						if not numplaque or length < 2 or length > 8 then
							ESX.ShowNotification("Ce n'est ~r~pas~s~ un numéro enregistrement dans les fichier de ~b~police")
						else
							Rechercherplaquevoiture(numplaque)
							RageUI.CloseAll()
						end
					end,})
			
				RageUI.Button("Mettre le véhicule en fourrière", nil, {RightLabel = "→"}, true , {
					onSelected = function()
						local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
						local playerPed = PlayerPedId()
						if dist4 < 5 then
							TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
							Citizen.Wait(7500)
							DeleteEntity(veh)
							ClearPedTasksImmediately(playerPed)
							ESX.ShowNotification("Véhicule en fourrière ")
						end
					end,})
			
				RageUI.Button("Ouvrir le véhicule de force", nil, {RightLabel = "→"}, true , {
					onSelected = function()
						local playerPed = PlayerPedId()
						local vehicle = ESX.Game.GetVehicleInDirection()
						local coords = GetEntityCoords(playerPed)
			
						if IsPedSittingInAnyVehicle(playerPed) then
							ESX.ShowNotification('Action impossible')
							return
						end
			
						if DoesEntityExist(vehicle) then
							isBusy = true
							TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
							Citizen.CreateThread(function()
								Citizen.Wait(10000)
			
								SetVehicleDoorsLocked(vehicle, 1)
								SetVehicleDoorsLockedForAllPlayers(vehicle, false)
								ClearPedTasksImmediately(playerPed)
			
								ESX.ShowNotification('Véhicule dévérouiller')
								isBusy = false
							end)
						else
							ESX.ShowNotification('Pas de véhicules à proximité')
						end
				end,})
			
				end)

			RageUI.IsVisible(subMenu8,function() 

			 RageUI.Button("Annonce Ouvertures", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('Ouvre:lspd')
				end
			})

			RageUI.Button("Annonce Fermetures", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('Ferme:lspd')
				end
			})

			RageUI.Button("Annonce Recrutement", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerServerEvent('Recru:lspd')
				end
			})

			RageUI.Button("Message Personnalisé", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					local te = KeyboardInput("Message", "", 100)
					ExecuteCommand("amu " ..te)
				end
			})
			end)

			RageUI.IsVisible(CitoyenFouille,function() 

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			if closestDistance <= 3.0 then 
				RageUI.Button("Fouiller", nil, {RightLabel = "→"}, true, {
					onActive = function()
						if closestPlayer ~= -1 then
							MarquerJoueur()
						end
					end,
					onSelected = function() 
						if closestDistance <= 5.0 then 
							getPlayerInv(closestPlayer)
							ExecuteCommand("me fouille l'individu")	
						end
					end,
				}, subMenu13)
			else
				RageUI.Button("Fouiller", "~r~Personnes aux Alentours !", {RightLabel = ">"}, false, {
					onSelected = function() 
					end
				})
			end

			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			RageUI.Button("Menotter/démenotter", nil, {RightLabel = "→"}, true, {
				onSelected = function() 
					if closestDistance <= 5.0 then 
					TriggerServerEvent('police:handcuff', GetPlayerServerId(closestPlayer))
				else
					ESX.ShowNotification('Aucun joueurs à proximité')
				end
			end
		})


	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	RageUI.Button("Escorter", nil, {RightLabel = "→"}, true, {
		onSelected = function() 
			if closestDistance <= 5.0 then 
			TriggerServerEvent('police:drag', GetPlayerServerId(closestPlayer))
		else
			ESX.ShowNotification('Aucun joueurs à proximité')
		end
	end
})

      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      RageUI.Button("Mettre dans un véhicule", nil, {RightLabel = "→"}, true, {
	       onSelected = function() 
		if closestDistance <= 5.0 then 
		TriggerServerEvent('police:putInVehicle', GetPlayerServerId(closestPlayer))
	else
		ESX.ShowNotification('Aucun joueurs à proximité')
	end
end
})

      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      RageUI.Button("Sortir du véhicule", nil, {RightLabel = "→"}, true, {
	     onSelected = function() 
		 if closestDistance <= 5.0 then 
		 TriggerServerEvent('police:OutVehicle', GetPlayerServerId(closestPlayer))
	 else
		 ESX.ShowNotification('Aucun joueurs à proximité')
	 end
  end
  })
			   end)

			   RageUI.IsVisible(subMenu13,function()


				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		
				RageUI.Separator("↓ ~r~Argent(s) sale(s) ~s~↓")
				for k,v  in pairs(ArgentSale) do
					RageUI.Button("Argent sale :", nil, {RightLabel = "~g~"..v.label.."$"}, true, {
						onSelected = function() 
							local combien = KeyboardInput("Combien ?", '' , 8)
							if tonumber(combien) > v.amount then
								RageUI.Popup({message = "~r~quantité invalide"})
							else
								TriggerServerEvent('police:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
								TriggerEvent('Ise_Logs', Config.Logs_Fouille, 3447003, "FOUILLE POLICE", "Nom : "..GetPlayerName(PlayerId())..".\nA confisquer de l'argent sale: x"..combien.." "..v.value.." à "..GetPlayerName(closestPlayer))
							end
							RageUI.GoBack()
						end
					})
				end
		
				RageUI.Separator("↓ ~r~Objet(s) ~s~↓")
				for k,v  in pairs(Items) do
					RageUI.Button(v.label, nil, {RightLabel = "~g~x"..v.right}, true, {
						onSelected = function() 
							local combien = KeyboardInput("Combien ?", '' , '', 8)
							if tonumber(combien) > v.amount then
								RageUI.Popup({message = "~r~quantité invalide"})
							else
								TriggerServerEvent('police:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
								TriggerEvent('Ise_Logs', Config.Logs_Fouille, 3447003, "FOUILLE POLICE", "Nom : "..GetPlayerName(PlayerId())..".\nA confisquer : x"..combien.." "..v.value.." à "..GetPlayerName(closestPlayer))
							end
							RageUI.GoBack()
						end
					})
				end
	
				RageUI.Separator("↓ ~r~Arme(s) ~s~↓")
	
				for k,v  in pairs(Armes) do
					RageUI.Button(v.label, nil, {RightLabel = "com ~g~"..v.right.. " ~s~munitions"}, true, {
						onSelected = function() 
							local combien = KeyboardInput("Combien ?", '' , '', 8)
							if tonumber(combien) > v.amount then
								RageUI.Popup({message = "~r~quantité invalide"})
							else
								TriggerServerEvent('police:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
								TriggerEvent('Ise_Logs', Config.Logs_Fouille, 3447003, "FOUILLE POLICE", "Nom : "..GetPlayerName(PlayerId())..".\nA confisquer une arme : x"..combien.." "..v.value.." à "..GetPlayerName(closestPlayer))
							end
							RageUI.GoBack()
						end
					})
				end
		
				end)

			RageUI.IsVisible(subMenu10,function() 

				RageUI.Button("Code-2", nil, {RightLabel = "→"}, true , {
				   onSelected = function()
					local raison = 'petit'
					local elements  = {}
					local playerPed = PlayerPedId()
					local coords  = GetEntityCoords(playerPed)
					local name = GetPlayerName(PlayerId())
				TriggerServerEvent('renfort', coords, raison)
				   end
			   })
   
			   RageUI.Button("Code-3", nil, {RightLabel = "→"}, true , {
				   onSelected = function()
					local raison = 'importante'
					local elements  = {}
					local playerPed = PlayerPedId()
					local coords  = GetEntityCoords(playerPed)
					local name = GetPlayerName(PlayerId())
				TriggerServerEvent('renfort', coords, raison)
				   end
			   })
   
			   RageUI.Button("CODE-99", nil, {RightLabel = "→"}, true , {
				   onSelected = function()
					local raison = 'omgad'
					local elements  = {}
					local playerPed = PlayerPedId()
					local coords  = GetEntityCoords(playerPed)
					local name = GetPlayerName(PlayerId())
				TriggerServerEvent('renfort', coords, raison)
				   end
			   })
			   end)

			   RageUI.IsVisible(subMenu12,function() 

				RageUI.Button("Sortir/Rentrer le chien", nil, {RightLabel = "→"}, true , {
				   onSelected = function()
					if not DoesEntityExist(policeDog) then
                        RequestModel(351016938)
                        while not HasModelLoaded(351016938) do Wait(0) end
                        policeDog = CreatePed(4, 351016938, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                        SetEntityAsMissionEntity(policeDog, true, true)
                        ESX.ShowNotification('~g~Chien Spawn')
                    else
                        ESX.ShowNotification('~r~Chien Rentrer')
                        DeleteEntity(policeDog)
                    end
				   end
			   })
   
			   RageUI.Button("Assis", nil, {RightLabel = "→"}, true , {
				   onSelected = function()
					if DoesEntityExist(policeDog) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog), true) <= 5.0 then
                            if IsEntityPlayingAnim(policeDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 3) then
                                ClearPedTasks(policeDog)
                            else
                                loadDict('rcmnigel1c')
                                TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
                                Wait(2000)
                                loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                                TaskPlayAnim(policeDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                            end
                        else
                            ESX.ShowNotification('dog_too_far')
                        end
                    else
                        ESX.ShowNotification('no_dog')
                    end
				   end
			   })

			   RageUI.Button("Cherche de drogue", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					if DoesEntityExist(policeDog) then
						if not IsPedDeadOrDying(policeDog) then
							if GetDistanceBetweenCoords(GetEntityCoords(policeDog), GetEntityCoords(PlayerPedId()), true) <= 3.0 then
								local player, distance = ESX.Game.GetClosestPlayer()
								if distance ~= -1 then
									if distance <= 3.0 then
										local playerPed = GetPlayerPed(player)
										if not IsPedInAnyVehicle(playerPed, true) then
											TriggerServerEvent('esx_policedog:hasClosestDrugs', GetPlayerServerId(player))
										end
									end
								end
							end
						else
							ESX.ShowNotification('Votre chien est mort')
						end
					else
						ESX.ShowNotification('Vous n\'avez pas de chien')
					end
				end
			})
		end)

		RageUI.IsVisible(MenuProps,function() 

			DisableControlAction(0, 22, true)
                DisableControlAction(0, 21, true)
                DisableControlAction(0, 37, true) -- Select Weapon
                DisableControlAction(0, 47, true)  -- Disable weapon

                
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 263, true) -- Melee Attack 1


                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
                RageUI.Button("LSPD", nil, {RightLabel = "→→→"}, true, {
                    onSelected = function() 
                    end
                }, lspd)

                RageUI.Button("Suppression d'objets", nil, {RightLabel = "XXX"}, true, {
                    onSelected = function() 
                    end
                }, suppr)


 
            end
		   	end)

			   RageUI.IsVisible(lspd, function()

				for k,v in pairs(PropsLSPD) do
					RageUI.Button(v.label, "Appuyer sur [~g~E~w~] pour poser les objet", {RightLabel = "→"}, true, {
						onSelected = function() 
							SpawnObj(v.props)
						end
					})
				end
		   end)

		   RageUI.IsVisible(suppr, function()

				for k,v in pairs(object) do
					if GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))) == 0 then table.remove(object, k) end
					RageUI.Button("Object: "..GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))).." ["..v.."]", nil, {RightLabel = ""}, true, {
						onActive = function()
							local entity = NetworkGetEntityFromNetworkId(v)
							local ObjCoords = GetEntityCoords(entity)
							DrawMarker(0, ObjCoords.x, ObjCoords.y, ObjCoords.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 1, 0, 2, 1, nil, nil, 0)
						end,
						onSelected = function() 
							RemoveObj(v, k)
						end,
					})
				end

			end)

		RageUI.IsVisible(CitoyenPerso, function()

			RageUI.Checkbox("Sortir/Rentrer un Bouclier", nil, bouclier, {}, {
				onChecked = function(index, items)
					bouclier = true
					EnableShield()
				end,
				onUnChecked = function(index, items)
					bouclier = false
					DisableShield()
				end
			})

			RageUI.Button("Poser/Prendre Radar", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerEvent('police:POLICE_radar')
				end
			})
	end)

			RageUI.IsVisible(subMenu14,function() 

				RageUI.Button("Prise de service", nil, {RightLabel = "→"}, true , {
				   onSelected = function()
					local info = 'prise'
				TriggerServerEvent('police:PriseEtFinservice', info)
				   end
			   })
   
			   RageUI.Button("Fin de service", nil, {RightLabel = "→"}, true , {
				   onSelected = function()
					local info = 'fin'
				TriggerServerEvent('police:PriseEtFinservice', info)
				   end
			   })

			   RageUI.Button("Pause de service", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					local info = 'pause'
				TriggerServerEvent('police:PriseEtFinservice', info)
				end
			   })

			   RageUI.Button("Standby", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					local info = 'standby'
				TriggerServerEvent('police:PriseEtFinservice', info)
				end
			   })

			   RageUI.Button("Contrôle en cours", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					local info = 'control'
				TriggerServerEvent('police:PriseEtFinservice', info)
				end
			   })

			   RageUI.Button("Refus d'obtempérer", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					local info = 'refus'
				TriggerServerEvent('police:PriseEtFinservice', info)
				end
			   })

			   RageUI.Button("Crime en cours", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					local info = 'crime'
				TriggerServerEvent('police:PriseEtFinservice', info)
				end
			   })
		end)

		RageUI.IsVisible(subMenu16, function()

			RageUI.Separator("↓ License ↓")

RageUI.Button('Saisir le permis de conduire (V,M,C)', nil, {RightLabel = "→"}, true , {
  onHovered = function()
	  DisplayClosetPlayer()
  end,
  onSelected = function()
	  local player, dst = GetClosestPlayer()
	  if dst ~= nil and dst < 2 then
		  local sID = GetPlayerServerId(player)
		  TriggerServerEvent("esx_license:removeLicense", sID, "drive")
		  ESX.ShowNotification("Vous avez retiré le permis de la personne.")
	  end
  end,
})

RageUI.Separator("License d'arme")

RageUI.Button("Permis d'arme", nil, {RightLabel = "~g~30000$"}, true , {
  onSelected = function()
	  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	  if closestPlayer ~= -1 and closestDistance <= 3.0 then
		  TriggerServerEvent('esx_license:addLicense', GetPlayerServerId(closestPlayer), 'weapon')
		  ESX.ShowNotification('Permis d\'arme attribuer avec suces.')
	  else
		  ESX.ShowNotification('Aucun joueurs à proximité')
	  end
  end
  })

  RageUI.Button('Saisir le permis d\'arme', nil, {RightLabel = "→"}, true , {
	  onHovered = function()
		  DisplayClosetPlayer()
	  end,
	  onSelected = function()
		  local player, dst = GetClosestPlayer()
		  if dst ~= nil and dst < 2 then
			  local sID = GetPlayerServerId(player)
			  TriggerServerEvent("esx_license:removeLicense", sID, "weapon")
			  ESX.ShowNotification("Vous avez retiré le permis de la personne.")
		  end
	  end,
  })

		
		
		end)
		 Wait(0)
		end
	 end)
  end
end

-- FUNCTION BILLING --

function OpenBillingMenuLSPD()

	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Amende"
	  },
	  function(data, menu)
	  
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer()
  
		if player ~= -1 and distance <= 3.0 then
  
		  menu.close()
		  if amount == nil then
			  ESX.ShowNotification("~r~Problèmes~s~: Montant invalide")
		  else
			local playerPed        = GetPlayerPed(-1)
			TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
			Citizen.Wait(5000)
			TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', ('police'), amount)
			  Citizen.Wait(100)
			  ESX.ShowNotification("~r~Vous avez bien envoyer l'Amende")
			  ClearPedTasksImmediately(PlayerPedId())
		  end
  
		else
		  ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
		end
  
	  end,
	  function(data, menu)
		  menu.close()
	  end
	)
  end


-------------------------- Intéraction 


RegisterNetEvent('police:handcuff')
AddEventHandler('police:handcuff', function()

  IsHandcuffed    = not IsHandcuffed;
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    if IsHandcuffed then

        RequestAnimDict('mp_arresting')
        while not HasAnimDictLoaded('mp_arresting') do
            Citizen.Wait(100)
        end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      DisableControlAction(2, 37, true)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      FreezeEntityPosition(playerPed,  true)
      DisableControlAction(0, 24, true) -- Attack
      DisableControlAction(0, 257, true) -- Attack 2
      DisableControlAction(0, 25, true) -- Aim
      DisableControlAction(0, 263, true) -- Melee Attack 1
      DisableControlAction(0, 37, true) -- Select Weapon
      DisableControlAction(0, 47, true)  -- Disable weapon
      

    else

      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed,  true)
      FreezeEntityPosition(playerPed, false)

    end

  end)
end)


RegisterNetEvent('police:putInVehicle')
AddEventHandler('police:putInVehicle', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

    local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  5.0,  0,  71)

    if DoesEntityExist(vehicle) then

      local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
      local freeSeat = nil

      for i=maxSeats - 1, 0, -1 do
        if IsVehicleSeatFree(vehicle,  i) then
          freeSeat = i
          break
        end
      end

      if freeSeat ~= nil then
        TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
      end

    end

  end

end)


RegisterNetEvent("police:OutVehicle")
AddEventHandler("police:OutVehicle", function()
    TaskLeaveAnyVehicle(GetPlayerPed(-1), 0, 0)
end)


local EnTrainEscorter = false
local PolicierEscorte = nil
RegisterNetEvent("police:drag")
AddEventHandler("police:drag", function(player)
    EnTrainEscorter = not EnTrainEscorter
    print(EnTrainEscorter)
    PolicierEscorte = tonumber(player)
    if EnTrainEscorter then
        escort()
    end
end)

function escort()
    Citizen.CreateThread(function()
        local pPed = GetPlayerPed(-1)
	    while EnTrainEscorter do
            Wait(1)
            pPed = GetPlayerPed(-1)
	    	local targetPed = GetPlayerPed(GetPlayerFromServerId(PolicierEscorte))

	    	if not IsPedSittingInAnyVehicle(targetPed) then
	    		AttachEntityToEntity(pPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
	    	else
	    		EnTrainEscorter = false
	    		DetachEntity(pPed, true, false)
	    	end

	    	if IsPedDeadOrDying(targetPed, true) then
	    		EnTrainEscorter = false
	    		DetachEntity(pPed, true, false)
	    	end
        end
        DetachEntity(pPed, true, false)
    end)
end

function GetClosestPlayer()
	local pPed = GetPlayerPed(-1)
	local players = GetActivePlayers()
	local coords = GetEntityCoords(pPed)
	local pCloset = nil
	local pClosetPos = nil
	local pClosetDst = nil
	for k,v in pairs(players) do
		if GetPlayerPed(v) ~= pPed then
			local oPed = GetPlayerPed(v)
			local oCoords = GetEntityCoords(oPed)
			local dst = GetDistanceBetweenCoords(oCoords, coords, true)
			if pCloset == nil then
				pCloset = v
				pClosetPos = oCoords
				pClosetDst = dst
			else
				if dst < pClosetDst then
					pCloset = v
					pClosetPos = oCoords
					pClosetDst = dst
				end
			end
		end
	end

	return pCloset, pClosetDst
end

RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords, raison)
	if raison == 'petit' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-2\n~w~Importance : ~g~Légère.', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 2
	elseif raison == 'importante' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-3\n~w~Importance : ~b~Importante.', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 47
	elseif raison == 'omgad' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Demande de renfort', 'Demande de renfort demandé.\nRéponse : ~g~CODE-99\n~w~Importance : ~r~URGENTE !\nDANGER IMPORTANT', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
		color = 1
	end
	local blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, 161)
	SetBlipScale(blipId, 1.2)
	SetBlipColour(blipId, color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Demande renfort')
	EndTextCommandSetBlipName(blipId)
	Wait(80 * 1000)
	RemoveBlip(blipId)
end)

RegisterNetEvent('police:InfoService')
AddEventHandler('police:InfoService', function(service, nom)
	if service == 'prise' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Prise de service', 'Agent : ~g~'..nom..'\n~w~Code : ~g~10-8\n~w~Information : ~g~Prise de service.', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'fin' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Fin de service', 'Agent : ~g~'..nom..'\n~w~Code : ~g~10-10\n~w~Information : ~g~Fin de service.', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'pause' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Pause de service', 'Agent : ~g~'..nom..'\n~w~Code : ~g~10-6\n~w~Information : ~g~Pause de service.', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'standby' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Mise en standby', 'Agent : ~g~'..nom..'\n~w~Code : ~g~10-12\n~w~Information : ~g~Standby, en attente de dispatch.', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'control' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Control routier', 'Agent : ~g~'..nom..'\n~w~Code : ~g~10-48\n~w~Information : ~g~Control routier en cours.', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'refus' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Refus d\'obtemperer', 'Agent : ~g~'..nom..'\n~w~Code : ~g~10-30\n~w~Information : ~g~Refus d\'obtemperer / Delit de fuite en cours.', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'crime' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Centrale LSPD', '~b~Crime en cours', 'Agent : ~g~'..nom..'\n~w~Code : ~g~10-31\n~w~Information : ~g~Crime en cours / poursuite en cours.', 'CHAR_CALL911', 0)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	end
end)

function spawnObject(name)
	local plyPed = PlayerPedId()
	local coords = GetEntityCoords(plyPed, false) + (GetEntityForwardVector(plyPed) * 1.0)

	ESX.Game.SpawnObject(name, coords, function(obj)
		SetEntityHeading(obj, GetEntityPhysicsHeading(plyPed))
		PlaceObjectOnGroundProperly(obj)
	end)
end

function Rechercherplaquevoiture(plaquerechercher)
    local PlaqueMenu = RageUI.CreateMenu("Info plaque", "Informations")
    ESX.TriggerServerCallback('police:getVehicleInfos', function(retrivedInfo)
    RageUI.Visible(PlaqueMenu, not RageUI.Visible(PlaqueMenu))
        while PlaqueMenu do
            Citizen.Wait(0)
					RageUI.IsVisible(PlaqueMenu,function()
                            RageUI.Button("Numéro de plaque : ", nil, {RightLabel = retrivedInfo.plate}, true, {
                                	onSelected = function()
                                    end
                                })
						
                            if not retrivedInfo.owner then
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = "Inconnu"}, true, {
                                    	onSelected = function()
                                		end
                                    })
                            else
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = retrivedInfo.owner}, true, {
                                    	onSelected = function()
										end
                                    })

								local hashvoiture = retrivedInfo.vehicle.model
								local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
								local nomvoituretexte  = GetLabelText(nomvoituremodele)

                                RageUI.Button("Modèle du véhicule : ", nil, {RightLabel = nomvoituretexte}, true, {
                                    	onSelected = function()
										end
                                    })
                            end
                end, function()
                end)
            if not RageUI.Visible(PlaqueMenu) then
            PlaqueMenu = RMenu:DeleteType("plaque d'immatriculation", true)
        end
    end
end, plaquerechercher)
end

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end

-- ANIM
local animDict = "combat@gestures@gang@pistol_1h@beckon"
local animName = "0"

local prop = "prop_ballistic_shield"

function EnableShield()
    shieldActive = true
    local ped = GetPlayerPed(-1)
    local pedPos = GetEntityCoords(ped, false)
    
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(250)
    end

    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)

    RequestModel(GetHashKey(prop))
    while not HasModelLoaded(GetHashKey(prop)) do
        Citizen.Wait(250)
    end

    local shield = CreateObject(GetHashKey(prop), pedPos.x, pedPos.y, pedPos.z, 1, 1, 1)
    shieldEntity = shield
    AttachEntityToEntity(shieldEntity, ped, GetEntityBoneIndexByName(ped, "IK_L_Hand"), 0.0, -0.05, -0.10, -30.0, 180.0, 40.0, 0, 0, 1, 0, 0, 1)
    SetWeaponAnimationOverride(ped, GetHashKey("Gang1H"))
    SetEnableHandcuffs(ped, true)
end

function DisableShield()
    local ped = GetPlayerPed(-1)
    DeleteEntity(shieldEntity)
    ClearPedTasksImmediately(ped)
    SetWeaponAnimationOverride(ped, GetHashKey("Default"))
    SetEnableHandcuffs(ped, false)
    shieldActive = false
end

-- Citizen.CreateThread(function()
--     while true do
--         if shieldActive then
--             local ped = GetPlayerPed(-1)
--             if not IsEntityPlayingAnim(ped, animDict, animName, 1) then
--                 RequestAnimDict(animDict)
--                 while not HasAnimDictLoaded(animDict) do
--                     Citizen.Wait(100)
--                 end
            
--                 TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)
--             end
--         end
--         Citizen.Wait(500)
--     end
-- end)


-- OUVERTURE DU MENU --

Keys.Register('F6', 'lspd', 'Ouvrir le menu lspd', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
    	OpenMenuF6LSPD()
	end
end)

	---------------- PROPS

	service = false
WantedVehList = {}
Matricule = nil
NomDeLagent = ""

function PriseService(status)
    Citizen.CreateThread(function()
        if not status then
            service = status
        elseif status then
            service = status
        else
            -- Erreur prise service
        end
    end)
end


function SpawnObj(obj)
    local playerPed = PlayerPedId()
	local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
    local objectCoords = (coords + forward * 1.0)
    local Ent = nil

    SpawnObject(obj, objectCoords, function(obj)
        SetEntityCoords(obj, objectCoords, 0.0, 0.0, 0.0, 0)
        SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
        Ent = obj
        Wait(1)
    end)
    Wait(1)
    while Ent == nil do Wait(1) end
    SetEntityHeading(Ent, GetEntityHeading(playerPed))
    PlaceObjectOnGroundProperly(Ent)
    local placed = false
    while not placed do
        Citizen.Wait(1)
        local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
        local objectCoords = (coords + forward * 2.0)
        SetEntityCoords(Ent, objectCoords, 0.0, 0.0, 0.0, 0)
        SetEntityHeading(Ent, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(Ent)
        SetEntityAlpha(Ent, 170, 170)

        if IsControlJustReleased(1, 38) then
            placed = true
        end
    end

    FreezeEntityPosition(Ent, true)
    SetEntityInvincible(Ent, true)
    ResetEntityAlpha(Ent)
    local NetId = NetworkGetNetworkIdFromEntity(Ent)
    table.insert(object, NetId)

end


function RemoveObj(id, k)
    Citizen.CreateThread(function()
        SetNetworkIdCanMigrate(id, true)
        local entity = NetworkGetEntityFromNetworkId(id)
        NetworkRequestControlOfEntity(entity)
        local test = 0
        while test > 100 and not NetworkHasControlOfEntity(entity) do
            NetworkRequestControlOfEntity(entity)
            Wait(1)
            test = test + 1
        end
        SetEntityAsNoLongerNeeded(entity)

        local test = 0
        while test < 100 and DoesEntityExist(entity) do 
            SetEntityAsNoLongerNeeded(entity)
            TriggerServerEvent("DeleteEntity", NetworkGetNetworkIdFromEntity(entity))
            DeleteEntity(entity)
            DeleteObject(entity)
            if not DoesEntityExist(entity) then 
                table.remove(object, k)
            end
            SetEntityCoords(entity, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0)
            Wait(1)
            test = test + 1
        end
    end)
end

function GoodName(hash)
    if hash == GetHashKey("prop_roadcone02a") then
        return "Cone"
    elseif hash == GetHashKey("prop_barrier_work05") then
        return "Barrière"
    else
        return hash
    end

end



function SpawnObject(model, coords, cb)
	local model = GetHashKey(model)

	Citizen.CreateThread(function()
		RequestModels(model)
        Wait(1)
		local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)

		if cb then
			cb(obj)
		end
	end)
end


function RequestModels(modelHash)
	if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
		RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
		end
	end
end


local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

--------------- LOGS
function prisedeservice()
    TriggerServerEvent("priseservice")
end
  
function findeservice()
    TriggerServerEvent("finservice")
end

function amendelol()
    TriggerServerEvent("LogsAmende")
end

------------- RADAR
local maxSpeed = 0
-- local minSpeed = 0
local info = ""
local isRadarPlaced = false -- bolean to get radar status
local Radar -- entity object
local RadarBlip -- blip
local RadarPos = {} -- pos
local RadarAng = 0 -- angle
local LastPlate = ""
local LastVehDesc = ""
local LastSpeed = 0
local LastInfo = ""
 
function GetPlayers2()
    local players = {}
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end
 
function GetClosestDrivingPlayerFromPos(radius, pos)
    local players = GetPlayers2()
    local closestDistance = radius or -1
    local closestPlayer = -1
    local closestVeh = -1
    for _ ,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local ped = GetPlayerPed(value)
            if GetVehiclePedIsUsing(ped) ~= 0 then
                local targetCoords = GetEntityCoords(ped, 0)
                local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], pos["x"], pos["y"], pos["z"], true)
                if(closestDistance == -1 or closestDistance > distance) then
                    closestVeh = GetVehiclePedIsUsing(ped)
                    closestPlayer = value
                    closestDistance = distance
                end
            end
        end
    end
    return closestPlayer, closestVeh, closestDistance
end
 
 
function radarSetSpeed(defaultText)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", defaultText or "", "", "", "", 5)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local gettxt = tonumber(GetOnscreenKeyboardResult())
        if gettxt ~= nil then
            return gettxt
        else
            ClearPrints()
            SetTextEntry_2("STRING")
            AddTextComponentString("~r~Veuillez entrer un nombre correct !")
            DrawSubtitleTimed(3000, 1)
            return
        end
    end
    return
end
 
 
function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
 
RegisterNetEvent('police:POLICE_radar')
AddEventHandler('police:POLICE_radar', function (data)

    POLICE_radar()
end)

function POLICE_radar()

    if isRadarPlaced then 
        
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), RadarPos.x, RadarPos.y, RadarPos.z, true) < 0.9 then 
       
            RequestAnimDict("anim@apt_trans@garage")
            while not HasAnimDictLoaded("anim@apt_trans@garage") do
               Wait(1)
            end
            TaskPlayAnim(GetPlayerPed(-1), "anim@apt_trans@garage", "gar_open_1_left", 1.0, -1.0, 5000, 0, 1, true, true, true) 
       
            Citizen.Wait(2000) 
       
            SetEntityAsMissionEntity(Radar, false, false)
           
            DeleteObject(Radar)
            DeleteEntity(Radar)
            Radar = nil
            RadarPos = {}
            RadarAng = 0
            isRadarPlaced = false
           
            RemoveBlip(RadarBlip)
            RadarBlip = nil
            LastPlate = ""
            LastVehDesc = ""
            LastSpeed = 0
            LastInfo = ""
           
        else
           
            ClearPrints()
            SetTextEntry_2("STRING")
            AddTextComponentString("~r~Vous n'êtes pas à coté de votre Radar !")
            DrawSubtitleTimed(3000, 1)
           
            Citizen.Wait(1500) 
       
        end
   
    else 
        maxSpeed = radarSetSpeed("50")
       
        Citizen.Wait(200) 
        RadarPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 1.5, 0)
        RadarAng = GetEntityRotation(GetPlayerPed(-1))
       
        if maxSpeed ~= nil then 
       
            RequestAnimDict("anim@apt_trans@garage")
            while not HasAnimDictLoaded("anim@apt_trans@garage") do
               Wait(1)
            end
            TaskPlayAnim(GetPlayerPed(-1), "anim@apt_trans@garage", "gar_open_1_left", 1.0, -1.0, 5000, 0, 1, true, true, true) -- animation
           
            Citizen.Wait(1500)
           
            RequestModel("prop_cctv_pole_01a")
            while not HasModelLoaded("prop_cctv_pole_01a") do
               Wait(1)
            end
           
            Radar = CreateObject(GetHashKey('prop_cctv_pole_01a'), RadarPos.x, RadarPos.y, RadarPos.z - 7, true, true, true) 
            SetEntityRotation(Radar, RadarAng.x, RadarAng.y, RadarAng.z - 115)
            SetEntityAsMissionEntity(Radar, true, true)
           
            FreezeEntityPosition(Radar, true) 
 
            isRadarPlaced = true
           
            RadarBlip = AddBlipForCoord(RadarPos.x, RadarPos.y, RadarPos.z)
            SetBlipSprite(RadarBlip, 380) 
            SetBlipColour(RadarBlip, 1) 
            SetBlipAsShortRange(RadarBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Radar")
            EndTextCommandSetBlipName(RadarBlip)
       
        end
       
    end
end
 
Citizen.CreateThread(function()
	local interbal = 2000
    while true do
        Wait(interbal)

		interbal = 2000
 
        if isRadarPlaced then
			interbal = 1
       
            if HasObjectBeenBroken(Radar) then 
               
                SetEntityAsMissionEntity(Radar, false, false)
                SetEntityVisible(Radar, false)
                DeleteObject(Radar) 
                DeleteEntity(Radar) 
               
                Radar = nil
                RadarPos = {}
                RadarAng = 0
                isRadarPlaced = false
               
                RemoveBlip(RadarBlip)
                RadarBlip = nil
               
                LastPlate = ""
                LastVehDesc = ""
                LastSpeed = 0
                LastInfo = ""
               
            end
           
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), RadarPos.x, RadarPos.y, RadarPos.z, true) > 300 then 
           
                SetEntityAsMissionEntity(Radar, false, false)
                SetEntityVisible(Radar, false)
                DeleteObject(Radar) 
                DeleteEntity(Radar) 
               
                Radar = nil
                RadarPos = {}
                RadarAng = 0
                isRadarPlaced = false
               
                RemoveBlip(RadarBlip)
                RadarBlip = nil
               
                LastPlate = ""
                LastVehDesc = ""
                LastSpeed = 0
                LastInfo = ""
               
                ClearPrints()
                SetTextEntry_2("STRING")
                AddTextComponentString("~r~Vous êtes parti trop loin de votre Radar !")
                DrawSubtitleTimed(3000, 1)
               
            end
           
        end
       
        if isRadarPlaced then

			interbal = 1
 
            local viewAngle = GetOffsetFromEntityInWorldCoords(Radar, -8.0, -4.4, 0.0) 
            local ply, veh, dist = GetClosestDrivingPlayerFromPos(30, viewAngle) 

            if veh ~= nil then
           
                local vehPlate = GetVehicleNumberPlateText(veh) or ""
                local vehSpeedKm = GetEntitySpeed(veh)*3.6
                local vehDesc = GetDisplayNameFromVehicleModel(GetEntityModel(veh))--.." "..GetVehicleColor(veh)
                if vehDesc == "CARNOTFOUND" then vehDesc = "" end
                       
                     
                if vehSpeedKm < maxSpeed then
                    info = string.format("   Vehicule ~r~%s ~w~Plaque ~r~%s ~w~Km/h ~g~%s", vehDesc, vehPlate, math.ceil(vehSpeedKm))
                else
                    info = string.format("   Vehicule ~r~%s ~w~Plaque ~r~%s ~w~Km/h ~r~%s", vehDesc, vehPlate, math.ceil(vehSpeedKm))
                    if LastPlate ~= vehPlate then
                        LastSpeed = vehSpeedKm
                        LastVehDesc = vehDesc
                        LastPlate = vehPlate
                    elseif LastSpeed < vehSpeedKm and LastPlate == vehPlate then
                            LastSpeed = vehSpeedKm
                    end
                    LastInfo = string.format("   Vehicule ~r~%s ~w~Plaque ~r~%s ~w~Km/h ~r~%s", LastVehDesc, LastPlate, math.ceil(LastSpeed))
                end
                   
                DrawRect(0.88, 0.97, 0.2, 0.03, 0, 0, 0, 220)
                drawTxt(0.88, 0.97, 0.2, 0.03, 0.24, info, 255, 255, 255, 255)
               
                DrawRect(0.88, 0.93, 0.2, 0.03, 0, 0, 0, 220)
                drawTxt(0.88, 0.93, 0.2, 0.03, 0.24, LastInfo, 255, 255, 255, 255)
               
            end
           
        end
           
    end  
end)

---------------------------- CAMERA

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

scanId = 0
cityRobbery = false
local myspawns = {}

CCTVCamLocations = {
	[1] =  { ['x'] = 24.18,['y'] = -1347.35,['z'] = 29.5,['h'] = 271.32, ['info'] = ' Store Camera 1', ["recent"] = false },
	[2] =  { ['x'] = -46.56,['y'] = -1757.98,['z'] = 29.43,['h'] = 48.68, ['info'] = ' Store Camera 2', ["recent"] = false },
	[3] =  { ['x'] = -706.02,['y'] = -913.61,['z'] = 19.22,['h'] = 85.61, ['info'] = ' Store Camera 3', ["recent"] = false },
	[4] =  { ['x'] = -1221.97,['y'] = -908.42,['z'] = 12.33,['h'] = 31.1, ['info'] = ' Store Camera 4', ["recent"] = false },
	[5] =  { ['x'] = 1164.99,['y'] = -322.78,['z'] = 69.21,['h'] = 96.91, ['info'] = ' Store Camera 5', ["recent"] = false },
	[6] =  { ['x'] = 372.25,['y'] = 326.43,['z'] = 103.57,['h'] = 252.9, ['info'] = ' Store Camera 6', ["recent"] = false },
	[7] =  { ['x'] = -1819.98,['y'] = 794.57,['z'] = 138.09,['h'] = 126.56, ['info'] = ' Store Camera 7', ["recent"] = false },
	[8] =  { ['x'] = -2966.24,['y'] = 390.94,['z'] = 15.05,['h'] = 84.58, ['info'] = ' Store Camera 8', ["recent"] = false },
	[9] =  { ['x'] = -3038.92,['y'] = 584.21,['z'] = 7.91,['h'] = 19.43, ['info'] = ' Store Camera 9', ["recent"] = false },
	[10] =  { ['x'] = -3242.48,['y'] = 999.79,['z'] = 12.84,['h'] = 351.35, ['info'] = ' Store Camera 10', ["recent"] = false },
	[11] =  { ['x'] = 2557.14,['y'] = 380.64,['z'] = 108.63,['h'] = 353.01, ['info'] = ' Store Camera 11', ["recent"] = false },
	[12] =  { ['x'] = 1166.02,['y'] = 2711.15,['z'] = 38.16,['h'] = 175.0, ['info'] = ' Store Camera 12', ["recent"] = false },
	[13] =  { ['x'] = 549.32,['y'] = 2671.3,['z'] = 42.16,['h'] = 94.96, ['info'] = ' Store Camera 13', ["recent"] = false },
	[14] =  { ['x'] = 1959.96,['y'] = 3739.99,['z'] = 32.35,['h'] = 296.38, ['info'] = ' Store Camera 14', ["recent"] = false },
	[15] =  { ['x'] = 2677.98,['y'] = 3279.28,['z'] = 55.25,['h'] = 327.81, ['info'] = ' Store Camera 15', ["recent"] = false },
	[16] =  { ['x'] = 1392.88,['y'] = 3606.7,['z'] = 34.99,['h'] = 201.69, ['info'] = ' Store Camera 16', ["recent"] = false },
	[17] =  { ['x'] = 1697.8,['y'] = 4922.69,['z'] = 42.07,['h'] = 322.95, ['info'] = ' Store Camera 17', ["recent"] = false },
	[18] =  { ['x'] = 1728.82,['y'] = 6417.38,['z'] = 35.04,['h'] = 233.94, ['info'] = ' Store Camera 18', ["recent"] = false },
	[19] =  { ['x'] = 733.45,['y'] = 127.58,['z'] = 80.69,['h'] = 285.51, ['info'] = ' Cam Power' },
	[20] =  { ['x'] = 1887.25,['y'] = 2605.35,['z'] = 50.40,['h'] = 111.88, ['info'] = ' Cam Jail Front' },
	[21] =  { ['x'] = 1709.37,['y'] = 2569.90,['z'] = 56.18,['h'] = 50.18, ['info'] = ' Cam Jail Prisoner Drop Off' },
	[22] =  { ['x'] = -644.24,['y'] = -241.11,['z'] = 37.97,['h'] = 282.81, ['info'] = ' Cam Jewelry Store' },
	[23] =  { ['x'] = -115.3,['y'] = 6441.41,['z'] = 31.53,['h'] = 341.95, ['info'] = ' Cam Paleto Bank Outside' },
	[24] =  { ['x'] = 240.07,['y'] = 218.97,['z'] = 106.29,['h'] = 276.14, ['info'] = ' Cam Main Bank 1' },
	[25] =  { ['x'] = 92.17,['y'] = -1923.14,['z'] = 29.5,['h'] = 205.95, ['info'] = ' Ballas', ["recent"] = false },
	[26] =  { ['x'] = -176.26,['y'] = -1681.15,['z'] = 47.43,['h'] = 313.29, ['info'] = ' Famillies', ["recent"] = false },
	[27] =  { ['x'] = 285.95,['y'] = -2003.95,['z'] = 35.0,['h'] = 226.0, ['info'] = ' Vagos', ["recent"] = false },	
}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	  PlayerData = ESX.GetPlayerData()
	end
end)

inCam = false
cctvCam = 0
RegisterNetEvent("cctv:camera")
AddEventHandler("cctv:camera", function(camNumber)
	camNumber = tonumber(camNumber)
	if inCam then
		inCam = false
		PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
		-- TriggerEvent('animation:tablet',false)
		Wait(250)
		ClearPedTasks(GetPlayerPed(-1))
	else
		if camNumber > 0 and camNumber < #CCTVCamLocations+1 then
			PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
			TriggerEvent("cctv:startcamera",camNumber)
		else
			exports['mythic_notify']:SendAlert('error', "This camera appears to be faulty")
		end
	end
end)

RegisterNetEvent("cctv:startcamera")
AddEventHandler("cctv:startcamera", function(camNumber)

	TriggerEvent('animation:tablet',true)
	local camNumber = tonumber(camNumber)
	local x = CCTVCamLocations[camNumber]["x"]
	local y = CCTVCamLocations[camNumber]["y"]
	local z = CCTVCamLocations[camNumber]["z"]
	local h = CCTVCamLocations[camNumber]["h"]

	print("starting cam")
	inCam = true

	SetTimecycleModifier("heliGunCam")
	SetTimecycleModifierStrength(1.0)
	local scaleform = RequestScaleformMovie("TRAFFIC_CAM")
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end

	local lPed = GetPlayerPed(-1)
	cctvCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	SetCamCoord(cctvCam,x,y,z+1.2)						
	SetCamRot(cctvCam, -15.0,0.0,h)
	SetCamFov(cctvCam, 110.0)
	RenderScriptCams(true, false, 0, 1, 0)
	PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
	PopScaleformMovieFunctionVoid()

	while inCam do
		SetCamCoord(cctvCam,x,y,z+1.2)						
		-- SetCamRot(cctvCam, -15.0,0.0,h)
		PushScaleformMovieFunction(scaleform, "SET_ALT_FOV_HEADING")
		PushScaleformMovieFunctionParameterFloat(GetEntityCoords(h).z)
		PushScaleformMovieFunctionParameterFloat(1.0)
		PushScaleformMovieFunctionParameterFloat(GetCamRot(cctvCam, 2).z)
		PopScaleformMovieFunctionVoid()
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		Citizen.Wait(1)
	end
	ClearFocus()
	ClearTimecycleModifier()
	RenderScriptCams(false, false, 0, 1, 0)
	SetScaleformMovieAsNoLongerNeeded(scaleform)
	DestroyCam(cctvCam, false)
	SetNightvision(false)
	SetSeethrough(false)	

end)

Citizen.CreateThread(function ()
	local interbal  = 2000
	while true do
		
		Citizen.Wait(interbal)

		interbal = 2000

		if inCam then

			interbal = 1

			local rota = GetCamRot(cctvCam, 2)

			if IsControlPressed(1, Keys['N4']) then
				SetCamRot(cctvCam, rota.x, 0.0, rota.z + 0.7, 2)
			end

			if IsControlPressed(1, Keys['N6']) then
				SetCamRot(cctvCam, rota.x, 0.0, rota.z - 0.7, 2)
			end

			if IsControlPressed(1, Keys['N8']) then
				SetCamRot(cctvCam, rota.x + 0.7, 0.0, rota.z, 2)
			end

			if IsControlPressed(1, Keys['N5']) then
				SetCamRot(cctvCam, rota.x - 0.7, 0.0, rota.z, 2)
			end
		end
	end
end)

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         local myCoords = GetEntityCoords(GetPlayerPed(-1))
--         ClearAreaOfCops(myCoords.x, myCoords.y, myCoords.z, 100.0, 0)
--     end
-- end)

Citizen.CreateThread(function()
    for i = 1, 12 do
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
       
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)