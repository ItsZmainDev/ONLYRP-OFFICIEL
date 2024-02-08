LSLIFE_UTILS = {}
function LSLIFE_UTILS:openShopUi(typeShop)
    TriggerEvent('zmain:openNuiShop', typeShop)
end

function LSLIFE_UTILS:SetPlayerInvincible(value)
    SetEntityInvincible(PlayerPedId(), value)
end

UTILS = {}

UTILS.ServerColor = {
    r = 213,
    g = 0,
    b = 255,
    o = 198
}

CreateThread(function()
    while not ESXLoaded do Wait(1) end
    Player = {
        playerPed = PlayerPedId(),
        playerId = PlayerId(),
        coords = GetEntityCoords(PlayerPedId()),
        weapon = GetSelectedPedWeapon(PlayerPedId()),
        isInVehicle = IsPedInAnyVehicle(PlayerPedId(), false),
        vehicle = GetVehiclePedIsIn(PlayerPedId(), false),
        closestVehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId())),
        inventory = ESX.GetPlayerData().inventory,
        loadout = ESX.GetPlayerData().loadout
    }
    while true do 
        Wait(1000)
        Player = {
            playerPed = PlayerPedId(),
            playerId = PlayerId(),
            coords = GetEntityCoords(PlayerPedId()),
            weapon = GetSelectedPedWeapon(PlayerPedId()),
            isInVehicle = IsPedInAnyVehicle(PlayerPedId(), false),
            vehicle = GetVehiclePedIsIn(PlayerPedId(), false),
            closestVehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId())),
            inventory = ESX.GetPlayerData().inventory,
            loadout = ESX.GetPlayerData().loadout
        }

        for k,v in pairs(Player.inventory) do
            if v.name == 'kevlar' then
                if v.count > 1 then
                    ESX.ShowNotification('Vous ne pouvez plus marcher avec deux kevlar sur vous')

                    if not ragodoll then
                        ExecuteCommand('ragodoll')
                    end
                end
            end
        end
    end
end)