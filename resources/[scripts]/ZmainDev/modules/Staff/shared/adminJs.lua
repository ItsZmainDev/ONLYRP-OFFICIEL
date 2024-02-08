exports('reviveJS', function(UniqueID)
    local player = ReturnPlayerId(UniqueID)

	if player then
		if GetPlayerName(player.id) ~= nil then
			TriggerClientEvent('zmain:ambulance:revive', player.id)
		end
	else
		return print('Le joueur n\'est pas connécté')
	end
end)

exports('kick', function(UniqueID, reason)
	local player = ReturnPlayerId(UniqueID)

	if player then
		DropPlayer(player.args, 'Vous avez été déconnectez du serveur\nRaison: '..reason)
	else
		return print('Le joueur n\'est pas connécté')
	end
end)