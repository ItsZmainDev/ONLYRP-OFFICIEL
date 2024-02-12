local loopFrames = 2500
local PlayersShow = {}

Citizen.CreateThread(function()
	while ESX == nil do Citizen.Wait(0) end

	while true do
		loopFrames = 2500
		for k,v in pairs(PlayersShow) do 
			local playerPos = v.coords

			local distance = #(GetEntityCoords(PlayerPedId())-v.coords)

			if distance < 20 then 
				if distance < 5 then 
					loopFrames = 1
					local text = ('Déconnexion d\'un Joueur\nID Unique : %s\nRaison: %s'):format(v.playerId, v.reason)
					ESX.Game.Utils.DrawText3D(v.coords, text, 0.75, 4)
				end
			end
			PlayersShow[k].state = PlayersShow[k].state + 1

			if PlayersShow[k].state >= 2500 then
				PlayersShow[k] = nil
			end
		end
		Wait(loopFrames)
	end
end)

RegisterNetEvent('zmain:tempShowDisconnect:newPlayer', function(data)
	PlayersShow[data.playerId] = data
end)