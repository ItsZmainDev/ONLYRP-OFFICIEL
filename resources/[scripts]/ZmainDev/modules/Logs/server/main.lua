function sendLog(title, data, cb)
    local dsc = {}

    for k,v in ipairs(data.fields) do
        table.insert(dsc, ('**%s:** %s %s'):format(v.title,v.subtitle,'\n'))
    end

    if data.img then
        setLogs = {
            {
                ["color"] = '7419530',
    
                ['author'] = {
                    ['name'] = data.author,
                    ['icon_url'] = 'https://cdn.discordapp.com/attachments/1090352711062528070/1093538821720785057/onlyrplogo.png'
                },

                ["image"] = {
                    ["url"] = data.img,
                },
    
                ['title'] = title,
    
                ['description'] = table.concat(dsc),
    
                ["footer"] = {
    
                    ["text"] = os.date("%x %X %p"),
    
                },
            }
        }
    else
        setLogs = {
            {
                ["color"] = '7419530',
    
                ['author'] = {
                    ['name'] = data.author,
                    ['icon_url'] = 'https://cdn.discordapp.com/attachments/1090352711062528070/1093538821720785057/onlyrplogo.png'
                },
    
                ['title'] = title,
    
                ['description'] = table.concat(dsc),
    
                ["footer"] = {
    
                    ["text"] = os.date("%x %X %p"),
    
                },
            }
        }
    end

    PerformHttpRequest(Config_Logs[data.channel] , function(err, text, headers) end, 'POST', json.encode({username = name, embeds = setLogs}), { ['Content-Type'] = 'application/json' })

    if cb then
        cb()
    end
end