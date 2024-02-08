RegisterNetEvent('zmain:society:setSocietyState', function(society, newVal)
    Society.List[society].state = newVal
    SocietyStatus[society].state = newVal
end)

function SocietyStatus2:getSocietyState(society)
    return SocietyStatus[society].state
end

exports('getSocietyState', function(society)
    return SocietyStatus[society].state
end)

-- function SocietyStatus2:openMenu()
--     local main = RageUI.CreateMenu('', 'Statut des entreprises')

--     RageUI.Visible(main, not RageUI.Visible(main))
--     FreezeEntityPosition(PlayerPedId(), true)
--     while main do Wait(1)
--         RageUI.IsVisible(main, function()
--             for k,v in pairs(Society.List) do
--                 RageUI.Button(v.label, 'Appuyez sur ENTRER si vous souhaitez voir la localisation de l\'entreprise sur votre GPS', {RightLabel = v.state == false and '~r~Fermé~s~' or '~g~Ouvert~s~'}, true, {
--                     onSelected = function()
                        
--                     end
--                 })
--             end
--         end)

--         if not RageUI.Visible(main) then
--             main = RMenu:DeleteType('main')
--             FreezeEntityPosition(PlayerPedId(), false)
--         end
--     end
-- end

CreateThread(function()
    -- AddZones('society_status', {
    --     Position = vector3(-266.8301, -960.0845, 31.22313),
    --     Dist = 10,
    --     Public = true,
    --     Job = nil,
    --     Job2 = nil,
    --     GradesJob = {},
    --     InVehicleDisable = true,
    --     marker = false,
    --     Blip = {
    --         Active = true,
    --         Position = vector3(2745.4719238281, 3477.0629882813, 55.671112060547),
    --         BlipId = 605,
    --         Color = 46,
    --         Scale = 0.6,
    --         Text = '[SERVICE] Supermarché'
    --     },
    --     ActionText = 'Appuyez sur [ ~g~E~w~ ] pour intéragir',
    --     Action = function()
    --         SocietyStatus2:openMenu()
    --     end
    -- })

    -- _PEDS.addPed('society_status', {
    --     model = 'csb_talcc',
    --     position = vector3(-266.8301, -960.0845, 31.22313),
    --     heading = 203.06483459473,
    --     scenario = {
    --         active = false,
    --         name = 'WORLD_HUMAN_CLIPBOARD',
    --         count = 0,
    --     },
    --     weapon = {
    --         active = false,
    --         weaponName = 'weapon_musket',
    --     },
    --     floatingText = {
    --         active = true,
    --         text = 'Kadir',
    --         color = 34,
    --     },
    -- })

    -- ESX.addBlips({
    --     name = ("society_%s"):format("status"),
    --     label = "[SERVICE] Statut Entreprise",
    --     category = nil,
    --     position = vector3(-266.8301, -960.0845, 31.22313),
    --     sprite = 590,
    --     display = 4,
    --     scale = 0.6,
    --     color = 2,
    -- })
end)

CreateThread(function()
    while not ESXLoaded do Wait(1) end

    ESX.TriggerServerCallback('zmain:society:getSocietyState', function(cb)
        SocietyStatus = cb
    end)
end)