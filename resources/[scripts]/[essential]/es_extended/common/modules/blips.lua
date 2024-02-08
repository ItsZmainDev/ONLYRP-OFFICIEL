ESX.Blips = {
    basicBlip = {},
    jobsBlip = {},
    myJobBlip = {},
}

function ESX.addBlips(blipsData)
    if ESX.Blips.basicBlip[blipsData.name] then
        RemoveBlip(ESX.Blips.basicBlip[blipsData.name])
    end

    AddTextEntry('ESXMYBLIP', blipsData.label)

    if blipsData.entity then
        ESX.Blips.basicBlip[blipsData.name] = AddBlipForEntity(blipsData.entity)
    else
        ESX.Blips.basicBlip[blipsData.name] = AddBlipForCoord(blipsData.position)
    end

    local blip = ESX.Blips.basicBlip[blipsData.name]

    SetBlipSprite(blip, blipsData.sprite)
    SetBlipScale(blip, blipsData.scale)
    SetBlipColour(blip, blipsData.color)
    SetBlipDisplay(blip, blipsData.display)
    if blipsData.disableShortRange == nil then
        SetBlipAsShortRange(blip, true)
    end

    BeginTextCommandSetBlipName('ESXMYBLIP')
    EndTextCommandSetBlipName(blip)

    if blipsData.category then
        SetBlipCategory(blip, blipsData.category)
    end
end

function ESX.addJobBlip(blipData)
    while not ESX do Wait(1) end

    while not ESX.PlayerData or not ESX.PlayerData.job or not ESX.PlayerData.job2.name do
        Wait(1)
    end

    if not ESX.Blips.jobsBlip[blipData.jobName] then
        ESX.Blips.jobsBlip[blipData.jobName] = {}
    end

    ESX.Blips.jobsBlip[blipData.jobName][blipData.name] = blipData

    if ESX.PlayerData.job.name == blipData.jobName then
        if ESX.Blips.myJobBlip[blipData.name] then
            RemoveBlip(ESX.Blips.myJobBlip[blipData.name])
        end
        ESX.Blips.myJobBlip[blipData.name] = AddBlipForCoord(blipData.position)

        SetBlipSprite(ESX.Blips.myJobBlip[blipData.name], blipData.sprite)
        SetBlipDisplay(ESX.Blips.myJobBlip[blipData.name], blipData.display)
        SetBlipScale(ESX.Blips.myJobBlip[blipData.name], blipData.scale)
        SetBlipColour(ESX.Blips.myJobBlip[blipData.name], blipData.color)
        if blipData.category then
            SetBlipCategory(ESX.Blips.myJobBlip[blipData.name], blipData.category)
        end
        SetBlipAsShortRange(ESX.Blips.myJobBlip[blipData.name], true)

        BeginTextCommandSetBlipName("BLIPINFO")
        AddTextComponentString(('[METIER] %s'):format(blipData.label))
        EndTextCommandSetBlipName(ESX.Blips.myJobBlip[blipData.name])
    end
end

function ESX.removeBlip(blipName)
    RemoveBlip(ESX.Blips.basicBlip[blipName])
end

function ESX.getBlip(blipsName)
    return ESX.Blips.basicBlip[blipsName]
end