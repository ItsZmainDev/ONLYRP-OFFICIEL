AddEventHandler('chatMessage', function(source, author, message)
	if (message):find(Config.CommandPrefix) ~= 1 then
		return
	end

	local commandArgs = ESX.StringSplit(((message):sub((Config.CommandPrefix):len() + 1)), ' ')
	local commandName = (table.remove(commandArgs, 1)):lower()
	local command = ESX.Commands[commandName]

	if command then
		CancelEvent()
		local xPlayer = ESX.GetPlayerFromId(source)


		if command.group ~= nil then
			if ESX.GroupsRankRelative[xPlayer.getGroup()]  >= command.group then
				if not ESX.ByPASS_GROUP[xPlayer.getGroup()] then
					if not exports['ZmainDev']:getService(source) then return ESX.Notifi(xPlayer.source, 'Vous n\'êtes pas en service staff') end
				end
				if (command.arguments > -1) and (command.arguments ~= #commandArgs) then
					TriggerEvent("esx:incorrectAmountOfArguments", source, command.arguments, #commandArgs)
				else
					command.callback(source, commandArgs, xPlayer)
				end
			else
				return ESX.Notifi(xPlayer.source, 'Vous n\'avez pas les permissions suffisantes')
			end
		else
			if (command.arguments > -1) and (command.arguments ~= #commandArgs) then
				TriggerEvent("esx:incorrectAmountOfArguments", source, command.arguments, #commandArgs)
			else
				command.callback(source, commandArgs, xPlayer)
			end
		end
	end
end)

function ESX.AddGroupCommand(command, group, callback, suggestion, arguments)
	ESX.Commands[command] = {}
	ESX.Commands[command].group = tonumber(group)
	ESX.Commands[command].callback = callback
	ESX.Commands[command].arguments = arguments or -1

	if type(suggestion) == 'table' then
		if type(suggestion.params) ~= 'table' then
			suggestion.params = {}
		end

		if type(suggestion.help) ~= 'string' then
			suggestion.help = ''
		end

		table.insert(ESX.CommandsSuggestions, {name = ('%s%s'):format(Config.CommandPrefix, command), help = suggestion.help, params = suggestion.params})
	end
end

function ESX.AddGroupCommand(command, group, callback, suggestion, arguments)
	ESX.Commands[command] = {}
	ESX.Commands[command].group = tonumber(group)
	ESX.Commands[command].callback = callback
	ESX.Commands[command].arguments = arguments or -1

	if type(suggestion) == 'table' then
		if type(suggestion.params) ~= 'table' then
			suggestion.params = {}
		end

		if type(suggestion.help) ~= 'string' then
			suggestion.help = ''
		end

		table.insert(ESX.CommandsSuggestions, {name = ('%s%s'):format(Config.CommandPrefix, command), help = suggestion.help, params = suggestion.params})
	end
end

function ESX.RegisterGroupCommand(command, group, callback)
	ESX.Commands[command] = {}
	ESX.Commands[command].group = group
	ESX.Commands[command].callback = callback
	ESX.Commands[command].arguments = arguments or -1
end


ESX.AddGroupCommand('car', 3, function(source, args)
	TriggerClientEvent('esx:spawnVehicle', source, args[1])
end, {})

-- SCRIPT --
ESX.AddGroupCommand('pos', 3, function(source, args, user)
	local x, y, z = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
	
	if x and y and z then
		TriggerClientEvent('esx:teleport', source, vector3(x, y, z))
	else
		ESX.ChatMessage(source, "Invalid coordinates!")
	end
end, {help = "Teleport to coordinates", params = {
	{name = "x", help = "X coords"},
	{name = "y", help = "Y coords"},
	{name = "z", help = "Z coords"}
}})

ESX.AddGroupCommand('setjob', 3, function(source, args, user)
	if tonumber(args[1]) and args[2] and tonumber(args[3]) then
		local player = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

		if player then
			local xPlayer = ESX.GetPlayerFromId(player.id)

			if args[1] == 'me' then
				xPlayer[source].setJob(args[2], args[3])
			else
				if xPlayer then
					if ESX.DoesJobExist(args[2], args[3]) then
						xPlayer.setJob(args[2], args[3])
					else
						ESX.ChatMessage(source, 'That job does not exist.')
					end
				end
			end
		else
			ESX.ChatMessage(source, 'Invalid usage.')
		end
	else
		ESX.ChatMessage(source, 'Player not online.')
	end
end, {help = _U('setjob'), params = {
	{name = "playerId", help = _U('id_param')},
	{name = "job", help = _U('setjob_param2')},
	{name = "grade_id", help = _U('setjob_param3')}
}})

ESX.AddGroupCommand('setjob2', 3, function(source, args, user)
	if tonumber(args[1]) and args[2] and tonumber(args[3]) then
		local player = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

		if player then
			local xPlayer = ESX.GetPlayerFromId(player.id)

			if xPlayer then
				if ESX.DoesJobExist(args[2], args[3]) then
					xPlayer.setJob2(args[2], args[3])
				else
					ESX.ChatMessage(source, 'That job does not exist.')
				end
			end
		else
			ESX.ChatMessage(source, 'Invalid usage.')
		end
	else
		ESX.ChatMessage(source, 'Player not online.')
	end
end, {help = _U('setjob'), params = {
	{name = "playerId", help = _U('id_param')},
	{name = "job2", help = _U('setjob_param2')},
	{name = "grade_id", help = _U('setjob_param3')}
}})

ESX.AddGroupCommand('dv', 3, function(source, args, user)
	TriggerClientEvent('esx:deleteVehicle', source, args[1])
end, {help = _U('delete_vehicle'), params = {
	{name = 'radius', help = 'Optional, delete every vehicle within the specified radius'}
}})

ESX.AddGroupCommand('giveitem', 3, function(source, args, user)
	local player = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

	if player then
		local xPlayer = ESX.GetPlayerFromId(player.id)

		if xPlayer then
			local item = args[2]
			local count = tonumber(args[3])
	
			if count then
				if ESX.Items[item] then
					xPlayer.addInventoryItem(item, count)
				else
					xPlayer.showNotification(_U('invalid_item'))
				end
			else
				xPlayer.showNotification(_U('invalid_amount'))
			end
		end
	else
		ESX.ChatMessage(source, 'Player not online.')
	end
end, {help = _U('giveitem'), params = {
	{name = "playerId", help = _U('id_param')},
	{name = "item", help = _U('item')},
	{name = "amount", help = _U('amount')}
}})

ESX.AddGroupCommand('giveweapon', 6, function(source, args, user)
	local player = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

	if player then
		local xPlayer = ESX.GetPlayerFromId(player.id)
		if xPlayer then
			local weaponName = args[2] or 'unknown'
	
			if ESX.GetWeapon(weaponName) then
				xPlayer.addWeapon(weaponName, tonumber(args[3]))
			else
				ESX.ChatMessage(source, 'Le nom de l\'arme est invalide.')
			end
		end
	else
		ESX.ChatMessage(source, 'Player not online.')
	end
end, {help = _U('giveweapon'), params = {
	{name = "playerId", help = _U('id_param')},
	{name = "weaponName", help = _U('weapon')},
	{name = "ammo", help = _U('amountammo')}
}})

ESX.AddGroupCommand('giveweaponcomponent', 6, function(source, args, user)
	
	local player = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

	if player then
		local xPlayer = ESX.GetPlayerFromId(player.id)

		if xPlayer then
			local weaponName = args[2] or 'unknown'
	
			if ESX.GetWeapon(weaponName) then
				if xPlayer.hasWeapon(weaponName) then
					local component = ESX.GetWeaponComponent(weaponName, args[3] or 'unknown')
	
					if component then
						xPlayer.addWeaponComponent(weaponName, args[3])
					else
						ESX.ChatMessage(source, 'Invalid weapon component.')
					end
				else
					ESX.ChatMessage(source, 'Player does not have that weapon.')
				end
			else
				ESX.ChatMessage(source, 'Invalid weapon.')
			end
		end
	else
		ESX.ChatMessage(source, 'Player not online.')
	end
end, {help = 'Give weapon component', params = {
	{name = 'playerId', help = _U('id_param')},
	{name = 'weaponName', help = _U('weapon')},
	{name = 'componentName', help = 'weapon component'}
}})

ESX.AddGroupCommand('clearall', 6, function(source, args, user)
	TriggerEvent("ratelimit", source, "clearall")
	TriggerClientEvent('chat:clear', -1)
end, {help = _U('chat_clear_all')})

ESX.AddGroupCommand('clearinventory', 5, function(source, args, user)
	if args[1] == nil then return end

	if args[1] then
		local player = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

		if player then
			xPlayer = ESX.GetPlayerFromId(player.id)
		else
			xPlayer = ESX.GetPlayerFromId(source)
		end
	else
		xPlayer = ESX.GetPlayerFromId(source)
	end

	if xPlayer then
		for i = 1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end
	else
		ESX.ChatMessage(source, 'Player not online.')
	end
end, {help = _U('command_clearinventory'), params = {
	{name = "playerId", help = _U('command_playerid_param')}
}})

ESX.AddGroupCommand('clearloadout', 5, function(source, args, user)
	if args[1] == nil then return end

	if args[1] then
		local player = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

		if player then
			xPlayer = ESX.GetPlayerFromId(player.id)
			
		else
			xPlayer = ESX.GetPlayerFromId(source)
		end
	else
		xPlayer = ESX.GetPlayerFromId(source)
	end

	if xPlayer then
		for i = #xPlayer.loadout, 1, -1 do
			xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
	else
		ESX.ChatMessage(source, 'Player not online.')
	end
end, {help = _U('command_clearloadout'), params = {
	{name = "playerId", help = _U('command_playerid_param')}
}})

ESX.AddGroupCommand('giveaccountmoney', 6, function(source, args, user)
	local _source = source

	local player = exports['ZmainDev']:getPlayerWithUniqueID(args[1])

	if player then
		local xPlayer = ESX.GetPlayerFromId(player.id)

		local account = args[2]

		local amount  = tonumber(args[3])


		if xPlayer then
			if amount ~= nil then

				if xPlayer.getAccount(account) ~= nil then
		
					xPlayer.addAccountMoney(account, amount)
		
				else
		
					TriggerClientEvent('esx:showNotification', _source, _U('invalid_account'))
		
				end
		
			else
		
				TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
		
			end
		end
	else
		return TriggerClientEvent('esx:showNotification', 'Joueur non connécté')
	end
end, {help = 'giveaccountmoney', params = {
	{name = "playerId", help = 'PlayerId'}
}})