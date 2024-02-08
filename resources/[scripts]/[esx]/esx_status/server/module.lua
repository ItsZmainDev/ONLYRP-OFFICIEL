TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(eventSrc, xPlayer)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
		['@UniqueID'] = xPlayer.UniqueID
	}, function(result)
		local data = {}

		if result[1].status ~= nil then
			data = json.decode(result[1].status)
		end

		xPlayer.set('status', data)
		TriggerClientEvent('esx_status:load', eventSrc, data)
	end)
end)

AddEventHandler('esx:playerDropped', function(eventSrc, xPlayer)
	local status = xPlayer.get('status')

	MySQL.Async.execute('UPDATE users SET status = @status WHERE UniqueID = @UniqueID', {
		['@status'] = json.encode(status),
		['@UniqueID'] = xPlayer.UniqueID
	})
end)

RegisterServerEvent('esx_status:update')
AddEventHandler('esx_status:update', function(status)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		xPlayer.set('status', status)
	end
end)

function SaveData()
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer then
			local status = xPlayer.get('status')

			MySQL.Async.execute('UPDATE users SET status = @status WHERE UniqueID = @UniqueID', {
				['@status'] = json.encode(status),
				['@UniqueID'] = xPlayer.UniqueID
			})
		end
	end

	SetTimeout(10 * 60 * 1000, SaveData)
end

SaveData()