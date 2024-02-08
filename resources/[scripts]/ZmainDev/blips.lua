CreateThread(function()
    while not ESXLoaded do Wait(1) end

    BlipsList = {
        List = {
            ['exemple'] = {
    
            }
        },
    
        addBlip = function(blipName, data)
            if not blipName then return end
            if type(data) ~= "table" then return end

            if BlipsList.List[blipName] then return end

            BlipsList.List[blipName] = data
        end,

        LoadBlips = function(list)
            for k,v in pairs(list) do
                
            end

            print('[LOADED] blips')
        end
    }

    BlipsList.LoadBlips(BlipsList.List)
end)