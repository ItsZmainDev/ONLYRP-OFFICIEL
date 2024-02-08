ESX.RegisterServerCallback('zmain:garage:requestPlayerCars', function(source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	local vehplate = plate:match('^%s*(.-)%s*$')
	MySQL.Async.fetchAll(
		'SELECT owned_vehicles.owner FROM owned_vehicles WHERE plate = @plate',
		{
			['@plate'] = vehplate
		},
	function(result)
		if #result >= 1 then
			if tonumber(result[1].owner) == xPlayer.getUniqueID() or result[1].owner == xPlayer.getJob().name or result[1].owner == xPlayer.getJob2().name then
				cb(true)
			else
				cb(false)
			end
		else
			cb(false)
		end
	end)
end)