function ReturnPlayerId(UniqueID)
	for _,p in pairs(adminManagement.Players) do
		if p.UniqueID == tonumber(UniqueID) then
			return p
		end
	end

	return false
end

function adminManagement:getPlayerFromUniqueID(UniqueID)
	for _,p in pairs(adminManagement.Players) do
		if p.UniqueID == tonumber(UniqueID) then
			local xPlayer = ESX.GetPlayerFromId(p.source)
			local isStaff = adminManagement.Service[p.UniqueID] or false
			return isStaff, xPlayer
		end
	end

	return false, false
end

function ReturnPlayerIdUseESXfunctions(UniqueID)
	for _,p in pairs(adminManagement.Players) do
		if p.UniqueID == tonumber(UniqueID) then
			return ESX.Players[tonumber(p.id)]
		end
	end

	return false
end

RegisterCommand('setgroup', function(source, args)
	if source ~= 0 then
		local myPlayer = ESX.GetPlayerFromId(source)
		if not Config.Staff.HavePermission('ManagePlayers', 'changegroup', myPlayer) then
			return
		end
	end
	local xPlayer = ReturnPlayerId(args[1])

	if xPlayer then
		if args[2] == nil then return end
		if not ESX.Groups[args[2]] then return end

		local playerSet = ESX.GetPlayerFromId(xPlayer.id)

		playerSet.setGroup(args[2])

		adminManagement.staffList[xPlayer.id] = {
            name = GetPlayerName(xPlayer.id),
            id = xPlayer.id,
            UniqueID = xPlayer.UniqueID,
            group = args[2],
            job = 'xPlayer.getJob()',
            job2 = 'xPlayer.getJob2()',
            service = false
        }

		Wait(1000)

		TriggerClientEvent('zmain:admin:restart', -1)
		adminManagement:UpdateStaffs()
	end
end)

RegisterCommand('revive', function(source, args)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if source ~= 0 then
		if not Config.Staff.HavePermission('ManagePlayers', 'revive', xPlayer) then return end
		if not adminManagement.Service[xPlayer.UniqueID] then return end
	end

	local player = ReturnPlayerId(args[1])

	if player ~= false then
		if GetPlayerName(player.id) ~= nil then
			TriggerClientEvent('zmain:ambulance:revive', player.id)
		end
	else
		TriggerClientEvent('zmain:ambulance:revive', source)
	end
end)

RegisterCommand('sc', function(source, args)
	if #args <= 0 then return end
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getGroup() == 'user' then return end

	for k,v in pairs(adminManagement.Players) do
		if v.group == 'user' then goto continue end

		TriggerClientEvent('zmain:admin:sc', k, GetPlayerName(source), table.concat(args, " "))
		
		::continue::
	end
end)

RegisterCommand('goto', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if source ~= 0 then
		if not adminManagement.Service[xPlayer.UniqueID] then return end
		if xPlayer.getGroup() == 'user' then return end
	end
	if args[1] == nil then return end

	if not ReturnPlayerId(args[1]) then return end

	TriggerClientEvent('zmain:admin:teleport', source, GetEntityCoords(GetPlayerPed(ReturnPlayerId(args[1]).id)))
end)

RegisterCommand('tp', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not adminManagement.Service[xPlayer.UniqueID] then return end
	if xPlayer.getGroup() == 'user' then return end
	if args[1] == nil then return end

	if not ReturnPlayerId(args[1]) then return end

	TriggerClientEvent('zmain:admin:teleport', ReturnPlayerId(args[1]).id, GetEntityCoords(GetPlayerPed(source)))
end)

RegisterCommand('kick', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if source ~= 0 then
		if not adminManagement.Service[xPlayer.UniqueID] then return end
		if not Config.Staff.HavePermission('COMMANDS', 'KICK', xPlayer) then return end
		if xPlayer.getGroup() == 'user' then return end
	end
	if args[1] == nil then return end
	if args[2] == nil then return end

	if not ReturnPlayerId(args[1]) then return end

	DropPlayer(ReturnPlayerId(args[1]).id, 'Vous avez été déconnectez du serveur\nRaison: '..table.concat(args, ' ', 2))
end)

RegisterCommand('tppc', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not adminManagement.Service[xPlayer.UniqueID] then return end
	if xPlayer.getGroup() == "user" then return end

	if args[1] == nil then return end

	local player = ReturnPlayerId(args[1])

	if not player then return end

	TriggerClientEvent('zmain:admin:teleport', player.id, vector3(231.169, -796.4821, 30.57599))
end)

RegisterNetEvent('zmain:fire:start', function(id, coords, with)
	TriggerClientEvent('events:fires:client:start', -1, id, coords, with)
end)

RegisterCommand('patchNote', function(_, args)
    sendLog(('Nouveau Patchnote par %s'):format('Zmain'), {
        author = 'Zmain',
        fields = {
            {title = 'Update', subtitle = table.concat(args, ' ')},
        },
        channel = 'patchnote'
    }, function(data)

    end)
end)