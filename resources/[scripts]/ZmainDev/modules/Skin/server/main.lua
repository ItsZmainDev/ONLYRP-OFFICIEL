ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_skin:save')
AddEventHandler('esx_skin:save', function(skin)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET skin = @skin WHERE identifier = @identifier', {
		['@skin'] = json.encode(skin),
		['@identifier'] = xPlayer.identifier
	})
end)

ESX.RegisterServerCallback('esx_skin:getPlayerSkin', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		local user, skin = users[1]

		local jobSkin = {
			skin_male = xPlayer.job.skin_male,
			skin_female = xPlayer.job.skin_female
		}

		if user.skin then
			skin = json.decode(user.skin)
		end

		cb(skin, jobSkin)
	end)
end)

RegisterCommand('skin', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if source ~= 0 then
		if xPlayer.getGroup() == 'user' then return end
	end

	local player = ReturnPlayerId(args[1])

	if not player then
		TriggerClientEvent('zmain:openSkinMenu', source)
	else
		TriggerClientEvent('zmain:openSkinMenu', player.id)
	end
end)

RegisterNetEvent('zmain:skin:restart', function()
	local source = source

	TriggerClientEvent('zmain:skin:restart', source)
end)