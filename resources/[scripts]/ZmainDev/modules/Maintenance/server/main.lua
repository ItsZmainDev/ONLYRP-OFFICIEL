Maintenance = {
    Staff = {
        ['talicense'] = true
    },

    Active = false
}

function Maintenance:start(value)
    Maintenance.Active = value
end

RegisterCommand('maintenance', function(source)
    if source == 0 then
        Maintenance.Active = not Maintenance.Active

        Maintenance:start(Maintenance.Active)

        if Maintenance.Active then
            ESX.toConsole('La maintenance est desormé active')
        else
            ESX.toConsole('La maintenance est desormé inactive')
        end
    end
end)