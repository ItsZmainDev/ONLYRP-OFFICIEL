RegisterCommand('coords', function(source, args, rawCommand)
	SendNUIMessage({
		type = 'copy',
		coords = ("{pos = %s, heading = %s}"):format(GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()))
	})
end)

RegisterCommand("coordsJson", function(source,args)
	local playerPosition = GetEntityCoords(PlayerPedId())
	SendNUIMessage({
		type = 'copy',
		coords = ('{"x" : %s, "y" : %s, "z" : %s}'):format(playerPosition.x, playerPosition.y, playerPosition.z)
	})
end)

RegisterCommand('copyData', function(source,args)
	SendNUIMessage({
		type = 'copy',
		coords = table.concat(args, " ")
	})
end)

RegisterCommand("openUrl", function(source,args)
	SendNUIMessage({
		type = "openUrl",
		link = tostring(args[1])
	})
end)