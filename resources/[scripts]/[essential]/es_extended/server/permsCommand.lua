permissions = {
	Command_car = {
		['_dev'] = true,
		['responsable'] = true,
	}
}

function getPermissionAccess(minimumGroup)
    if (minimumGroup == "helper") then
        return {['helper'] = true, ['modo'] = true, ['admin'] = true, ['superadmin'] = true, ['responsable'] = true, ['_dev'] = true, ['developper'] = true, ['fondateur'] = true}
    elseif (minimumGroup == 'modo') then
        return {['helper'] = false, ['modo'] = true, ['admin'] = true, ['superadmin'] = true, ['responsable'] = true, ['_dev'] = true, ['developper'] = true, ['fondateur'] = true}
    elseif (minimumGroup == 'admin') then
        return {['helper'] = false, ['modo'] = false, ['admin'] = true, ['superadmin'] = true, ['responsable'] = true, ['_dev'] = true, ['developper'] = true, ['fondateur'] = true}
	elseif (minimumGroup == 'superadmin') then
		return {['helper'] = false, ['modo'] = false, ['admin'] = false, ['superadmin'] = true, ['responsable'] = true, ['_dev'] = true, ['developper'] = true, ['fondateur'] = true}
	elseif (minimumGroup == 'responsable') then
		return {['helper'] = false, ['modo'] = false, ['admin'] = false, ['superadmin'] = false, ['responsable'] = true, ['_dev'] = true, ['developper'] = true, ['fondateur'] = true}
	elseif (minimumGroup == '_dev') then
		return {['helper'] = false, ['modo'] = false, ['admin'] = false, ['superadmin'] = false, ['responsable'] = false, ['_dev'] = true, ['developper'] = true, ['fondateur'] = true}
	end
end

RegisterCommand('getgroup', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if ESX.GroupsRankRelative[xPlayer.getGroup()] >= 5 then
		print(ESX.GroupsRankRelative[xPlayer.getGroup()] >= 5)
	else
		print('NOP')
	end
end)