CreateThread(function()
    while true do
        TriggerClientEvent("rich:getPlayers", -1, GetNumPlayerIndices());
        Wait(60000);
    end
end);