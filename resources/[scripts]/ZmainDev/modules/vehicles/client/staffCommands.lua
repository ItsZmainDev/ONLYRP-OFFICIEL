---Garages:permissions
---@public
---@param Garages.CreateGaragePermissions table
function Garages:getpermissions(table)
    if json.encode(table) == '[]' then goto continue end

    Garages.StaffCommand = table

    if Garages.StaffCommand[ESX.GetPlayerData()['group']] then return true end

    ::continue::
    return false
end

---Garages:StaffCommand
---@public
---@param CommandName string
---@param table table
---@param func function
function Garages:StaffCommand(CommandName, table, func)
    RegisterCommand(CommandName, function(source, ...)
        if not Garages:getpermissions(table) then return end

        func(...)
    end)
end

Garages:StaffCommand('garages', {['_dev'] = true, ['fondateur'] = true, ['responsable'] = true}, function()
    Garages:createMenu()
end)

Garages:StaffCommand('garages:del',{['_dev'] = true, ['fondateur'] = true, ['responsable'] = true}, function(args)
    if tonumber(args[1]) == nil and tonumber(args[1])  == '' then return end
    if Garages.garage_data.garages[tonumber(args[1]) ] == nil then return end

    TriggerServerEvent('zmain:garage:delete', tonumber(args[1]))
    Garages.garage_data.garages[tonumber(args[1])] = nil
end)