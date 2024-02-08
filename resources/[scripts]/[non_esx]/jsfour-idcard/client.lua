local open = false

-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})

	Citizen.CreateThread(function()
		while open do
			Wait(0)
			if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
				SendNUIMessage({
					action = "close"
				})
				open = false
			end
		end
	end)
end)

local function RequestAndWaitDict(dictName) -- Request une animation (dict)
	if dictName and DoesAnimDictExist(dictName) and not HasAnimDictLoaded(dictName) then
		RequestAnimDict(dictName)
		while not HasAnimDictLoaded(dictName) do Citizen.Wait(100) end
	end
end
local function RequestAndWaitModel(modelName) -- Request un modèle de véhicule
	if modelName and IsModelInCdimage(modelName) and not HasModelLoaded(modelName) then
		RequestModel(modelName)
		while not HasModelLoaded(modelName) do Citizen.Wait(100) end
	end
end

RegisterNetEvent('zmain:caca:identi', function()
	local pPed = PlayerPedId()

	RequestAndWaitDict("mp_common")
	RequestAndWaitModel(props)
	RequestAndWaitModel('hei_prop_heist_cash_pile')

	local cCreate =  CreateObject(GetHashKey('p_ld_id_card_01'), 0, 0, 0, true)
	AttachEntityToEntity(cCreate, pPed, GetPedBoneIndex(pPed, 57005), 0.13, 0.02, 0.0, -90.0, 0, 0, 1, 1, 0, 1, 0, 1)
	TaskPlayAnim(pPed, 'mp_common', 'givetake1_a', 8.0, 8.0, -1, 0, 1, false, false, false)

	Wait(1300)
	DeleteEntity(cCreate)
end)

-- Key events
-- Citizen.CreateThread(function()
-- 	while true do
-- 		Wait(0)
-- 		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
-- 			SendNUIMessage({
-- 				action = "close"
-- 			})
-- 			open = false
-- 		end
-- 	end
-- end)
