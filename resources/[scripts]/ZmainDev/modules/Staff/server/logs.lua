CreateThread(function()
    function adminManagement:setLogsType(type, title, dsc, author, webhooks, imgactive, img, func)

        if type == nil or title == nil or dsc == nil or author == nil or webhooks == nil or imgactive == nil then goto continue end

        local setLogs = {
            {
                ["color"] = '7419530',

                ['author'] = {
                    ['name'] = author,
                    ['icon_url'] = 'https://cdn.discordapp.com/attachments/1090352711062528070/1093538821720785057/onlyrplogo.png'
                },
    
                ['title'] = title,
    
                ['description'] = dsc,
    
                ["footer"] = {
    
                    ["text"] = os.date("%x %X %p"),
    
                },
            }
        }

        PerformHttpRequest(webhooks , function(err, text, headers) end, 'POST', json.encode({username = name, embeds = setLogs}), { ['Content-Type'] = 'application/json' })
    
        ::continue::
    end
end)

RegisterNetEvent('zmain:admin:sendLogsScreen', function(uniquesource, licensesource, img, sourceName)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local plyplayer = ESX.GetPlayerFromId(uniquesource)

    local content = {

        {

            ["color"] = '3447003', --rosso

            ["image"] = {
                ["url"] = img.attachments[1].url,
            },

            ['author'] = {
                ['name'] = "AdminMenu",
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/1085637890228371596/1087825151451729960/logo_only_rp_static_1.png'
            },

            ['thumbnail'] = {
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/1085637890228371596/1087825151451729960/logo_only_rp_static_1.png'
            },

            ["title"] = ("Screenshot par (%s)"):format(sourceName),

            ["description"] = ('Screen de l\'écran du joueur: **%s**\nID : **%s**\nUniqueID : **%s**\nLicence : **%s**\nGroup : **%s**'):format(plyplayer.name, uniquesource, plyplayer.UniqueID, plyplayer.identifier, plyplayer.group == 'user' and 'Joueur' or plyplayer.group),

            ["footer"] = {

                ["text"] = "© Only\'RP - LOGS - "..os.date("%x %X %p"),

            },

        }

    }

    PerformHttpRequest('YOUR WEBHOOK' , function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end)