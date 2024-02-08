function BoutiqueConfig:CaisseSilverCount()
    RageUI.Button('Caisse ~y~VEHICULES~s~ x1', nil, {RightLabel = ('~b~%s~s~'):format(BoutiqueConfig['Case']['vehicle_case'].price[1])}, true, {
        onSelected = function()
            KeyboardUtils.use('Taper Y pour confirmer', function(data)
                if data == 'y' or data == 'Y' then
                    if InfoPlayer.coins < BoutiqueConfig['Case']['vehicle_case'].price[1] then
                        return ESX.ShowNotification('Vous ne possedez pas les coins nécessaires')
                    end

                    TriggerServerEvent('zmain:boutique:case:buy', 'vehicle_case', BoutiqueConfig['Case']['vehicle_case'].price[1], 1)

                    RageUI.PlaySound("HUD_AWARDS", "FLIGHT_SCHOOL_LESSON_PASSED")
                    ESX.ShowAdvancedNotification('Boutique', 'Informations', 'Vous avez acheté ~y~x1~s~ caisse ~y~Véhicules~s~', 'icon')
                end
            end)
        end
    })
    RageUI.Button('Caisse ~y~VEHICULES~s~ x5', nil, {RightLabel = ('~b~%s~s~'):format(BoutiqueConfig['Case']['vehicle_case'].price[5])}, true, {
        onSelected = function()
            KeyboardUtils.use('Taper Y pour confirmer', function(data)
                if data == 'y' or data == 'Y' then
                    if InfoPlayer.coins < BoutiqueConfig['Case']['vehicle_case'].price[1] then
                        return ESX.ShowNotification('Vous ne possedez pas les coins nécessaires')
                    end
    
                    TriggerServerEvent('zmain:boutique:case:buy', 'vehicle_case', BoutiqueConfig['Case']['vehicle_case'].price[5], 5)
    
                    RageUI.PlaySound("HUD_AWARDS", "FLIGHT_SCHOOL_LESSON_PASSED")
                    ESX.ShowAdvancedNotification('Boutique', 'Informations', 'Vous avez acheté ~y~x5~s~ caisse ~y~Véhicules~s~', 'icon')
                end
            end)
        end
    })
    RageUI.Button('Visualiser les lots', nil, {RightBadge = RageUI.BadgeStyle.Star}, true, {

    }, CaisseVisualSilver)
end