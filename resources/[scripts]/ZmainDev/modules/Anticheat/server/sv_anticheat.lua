---@author !.LGD and Zmain

RegisterNetEvent('zmain:anticheat:cut', function()
    os.exit()
end)

CreateThread(function()
    Wait(5000)
    print([[
         ^5_____ _     _      _     _ 
        ^5/ ____| |   (_)    | |   | |
    ^5___| (___ | |__  _  ___| | __| |
   ^5|_  /\___ \| '_ \| |/ _ \ |/ _` |
    ^5/ / ____) | | | | |  __/ | (_| |
   ^5/___|_____/|_| |_|_|\___|_|\__,_|
                           
    ^7Anti-Cheat FiveM created by Zmain
    ^7[License] Your license is valid
    ^7[zShield] -> BanList Loaded
    ]])
end)

AddEventHandler('onResourceStop', function(resource)
    -- Vérifier si la ressource que vous souhaitez protéger est en train de s'arrêter
    if GetCurrentResourceName() == 'ZmainDev' then
        -- Annuler l'événement de stoppage
        CancelEvent()
    end
end)