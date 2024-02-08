function BoutiqueConfig:CaisserVisualLots(CaisseName)
    for k,v in pairs(BoutiqueConfig['Case'][CaisseName].Reward) do
        if v.rarity == 4 then
            RageUI.Button(('[~p~Only~s~] %s'):format(v.label), nil, {}, true, {
                onActive = function()
                    -- RageUI.RenderCaissePreview('boutique', k)
                end
            })
        end
    end
    for k,v in pairs(BoutiqueConfig['Case'][CaisseName].Reward) do
        if v.rarity == 3 then
            RageUI.Button(('[~y~Légendaire~s~] %s'):format(v.label), nil, {}, true, {
                onActive = function()
                    -- RageUI.RenderCaissePreview('boutique', k)
                end
            })
        end
    end
    for k,v in pairs(BoutiqueConfig['Case'][CaisseName].Reward) do
        if v.rarity == 2 then
            RageUI.Button(('[~b~Rare~s~] %s'):format(v.label), nil, {}, true, {
                onActive = function()
                    -- RageUI.RenderCaissePreview('boutique', k)
                end,
            })
        end
    end
    for k,v in pairs(BoutiqueConfig['Case'][CaisseName].Reward) do
        if v.rarity == 1 then
            RageUI.Button(('[~g~Commun~s~] %s'):format(v.label), nil, {}, true, {
                onActive = function()
                    -- RageUI.RenderCaissePreview('boutique', k)
                end
            })
        end
    end
end

local draw = {};
local mysterybox = RageUI.CreateMenu('', 'Bonne Chance ! ');
local picture;
local CurrentAnimation= false;

function FinishCase(pic, msg, vehicleName, vehicleLabel)
    picture = pic
    CurrentAnimation = false
    mysterybox.Closable = true
    RageUI.PlaySound("HUD_AWARDS", "FLIGHT_SCHOOL_LESSON_PASSED")

    local plate = GeneratePlate()
    ESX.Game.SpawnVehicle(vehicleName, vector3(748.97686767578, -4407.44140625, -0.65416955947876), GetEntityHeading(PlayerPedId()), function (vehicle)                                            table.insert(sortirvoitureacheter, vehicle)
    SetEntityVisible(vehicle, false)

    local vehicleProps = ESX.Game.GetVehicleProperties(sortirvoitureacheter[#sortirvoitureacheter])
    vehicleProps.plate = plate
    SetVehicleNumberPlateText(sortirvoitureacheter[#sortirvoitureacheter], plate)
    ESX.TriggerServerCallback('zmain:admin:uniqueid:boutiquehistory', function(cb)
        if json.encode(cb) ~= '[]' then
            for k,v in pairs(cb) do
                print(tostring(v.data), tostring(msg))
                if tostring(v.data) == tostring(msg) then
                    TriggerServerEvent('zmain:boutique:case:buy', 'vehicle_case', 0, 1)
                    ESX.ShowNotification('Vous possedez déjà ce véhicule, une nouvelle caisse vous a été fournie')
                    return
                end
            end

            ESX.ShowAdvancedNotification('Boutique', 'Informations', msg, 'icon')
            TriggerServerEvent('zmain:boutique:sendVehicleWithCase', {plate = vehicleProps.plate, properties = vehicleProps, label = vehicleLabel, message = msg})
        else
            ESX.ShowAdvancedNotification('Boutique', 'Informations', msg, 'icon')
            TriggerServerEvent('zmain:boutique:sendVehicleWithCase', {plate = vehicleProps.plate, properties = vehicleProps, label = vehicleLabel, message = msg})
        end
    end, ESX.GetPlayerData().UniqueID)

    Wait(10)
    DeleteEntity(vehicle)
end)
end

function getRandomItem(CaseName)
    local p = math.random()
    local cumulativeProbability = 0
    for name, item in pairs(BoutiqueConfig['Case'][CaseName].Reward) do
        cumulativeProbability = cumulativeProbability + item.probability
        if p <= cumulativeProbability then
            return name, item
        end
    end
end

RegisterNetEvent('Zmain:OpenCase', function(data)
    draw = {}
    local winName, winData = getRandomItem(data)

    if winData.type == 'item' then
        table.insert(draw, {item = winData.item , amount = winData.amount, tier = winData.rarity, picture = winName, message = winData.message, nameSpawn = winData.nameSpawn, label = winData.label})
    elseif winData.type == 'weapon' then
        table.insert(draw, {weapon = winName , tier = winData.rarity, picture = winName, message = winData.message, nameSpawn = winData.nameSpawn, label = winData.label})
    elseif winData.type == 'vehicle' then
        table.insert(draw, {vehicle = winName, tier = winData.rarity, picture = winName, message = winData.message, nameSpawn = winData.nameSpawn, label = winData.label})
    elseif winData.type == 'money' then
        table.insert(draw, {money = winData.amount, tier = winData.rarity, picture = winName, message = winData.message, nameSpawn = winData.nameSpawn, label = winData.label})
    end

    RageUI.Visible(mysterybox, not RageUI.Visible(mysterybox))
    Wait(100)

    Citizen.CreateThread(function()
        CurrentAnimation = true
        while true do
            for k, v in pairs(BoutiqueConfig['Case'][data].Reward) do
                if CurrentAnimation then
                    picture = v.label
                    Wait(75)
                    RageUI.PlaySound("HUD_FREEMODE_SOUNDSET", "NAV_UP_DOWN")
                    mysterybox.Closable = false
                else
                    break
                end
            end
            Citizen.Wait(1)
        end
    end)
    Wait(4000)

    FinishCase(draw[1].picture, draw[1].message, draw[1].nameSpawn, draw[1].label)

end)

Citizen.CreateThread(function()
    while (true) do
        if RageUI.Visible(mysterybox) then
            if not CurrentAnimation then
                mysterybox.Closable = true
            end
            Citizen.Wait(1.0)
        else
            Wait(1000)
        end

        RageUI.IsVisible(mysterybox, function()
            RageUI.Separator('~y~En attente de votre récompense...~s~')
            RageUI.Separator()
            RageUI.Separator(picture)
        end, function()
        end)
    end
end)

RegisterCommand('case', function(_)
    TriggerServerEvent('esx:useItem', 'vehicle_case')
end)