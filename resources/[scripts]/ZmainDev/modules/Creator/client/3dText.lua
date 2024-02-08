CreateThread(function()
    while not ESXLoaded do Wait(1) end

    local function Draw3DText(params)
        local onScreen, _x, _y = World3dToScreen2d(params.xyz.x,params.xyz.y,params.xyz.z)
        local p = GetGameplayCamCoords()
        local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, params.xyz.x,params.xyz.y,params.xyz.z, 1)
        local scale = (1 / distance) * (params.perspectiveScale or default.perspectiveScale)
        local fov = (1 / GetGameplayCamFov()) * 75
        local scale = scale * fov * (params.text.scaleMultiplier or default.text.scaleMultiplier)
        SetTextScale(0.0, scale)
        SetTextFont(params.text.font or default.text.font)
        SetTextProportional(true)
        SetTextColour(params.text.rgb[1], params.text.rgb[2], params.text.rgb[3], 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(params.text.content)
        DrawText(_x,_y)
    end

    local interval = 2000

    while true do
        Wait(interval)

        interval = 2000

        local v3 = vector3(-1037.866, -2737.825, 14.59501)

        if #(GetEntityCoords(PlayerPedId())-v3) < 10 then
            interval = 1

            Draw3DText({
                xyz=v3,
                text={
                    content="~w~Bienvenue sur~s~ ~h~🌴~p~Only'RP~s~ \n~r~Récupère ton cadeau dans la boutique !~s~",
                    rgb={255 , 255, 55},
                    textOutline=true,
                    scaleMultiplier=0.4,
                    font=0,
                },
                perspectiveScale=4,
            }) 

            Draw3DText({
                xyz=v3,
                text={
                    content="\n\n~b~Rejoins le Discord (https://discord.gg/only-rp)~s~",
                    rgb={0, 0, 0},
                    textOutline=true,
                    scaleMultiplier=0.4,
                    font=0,
                },
                perspectiveScale=4,
            }) 
        end
    end
end)