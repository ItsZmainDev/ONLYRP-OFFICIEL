ESX, currentJailId, coolDown = nil, nil, false 

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)
	end
end)

JailGestionMenu = RageUI.CreateMenu("Gestion Jail(s)", "Intéractions disponibles")
JailPlayersMenu = RageUI.CreateSubMenu(JailGestionMenu, "Joueur(s) Jail", "Liste des joueurs")
JailInteractMenu = RageUI.CreateSubMenu(JailPlayersMenu, "Gestion Jail(s)", "Intéractions disponibles")
JailGestionMenu.Closed = function()  
    RageUI.CloseAll()
    Jails.MenuIsOpen = false
    currentJailId = nil 
    JailData = {}
end 
JailInteractMenu.Closed = function()
    currentJailId = nil 
end

RegisterNetEvent("cxJail:openMenu")
AddEventHandler("cxJail:openMenu", function(data)
    JailData = data
    if Jails.MenuIsOpen then 
        Jails.MenuIsOpen = false 
        RageUI.Visible(JailGestionMenu,false)
    else
        Jails.MenuIsOpen = true 
        RageUI.Visible(JailGestionMenu, true)
        CreateThread(function()
            while Jails.MenuIsOpen do
                RageUI.IsVisible(JailGestionMenu, function()
                    if #JailData > 0 then 
                        RageUI.Button(("Liste des joueurs - (~b~%s~s~)"):format(#JailData), "Liste des joueurs étant actuellement en jail.", {RightLabel = "→→"}, true, {},JailPlayersMenu)
                    else
                        RageUI.Button(("Liste des joueurs - (~r~%s~s~)"):format("Aucun"), false, {RightLabel = "→→"}, false, {})
                    end
                end)
                RageUI.IsVisible(JailPlayersMenu, function()
                    if #JailData > 0 then 
                        for k,v in pairs(JailData) do 
                            if GetPlayerFromServerId(v.playerId) ~= -1 then 
                                RageUI.Button(("(~b~%s~s~) - %s"):format(v.playerId, GetPlayerName(GetPlayerFromServerId(v.playerId))), ("Jail par : ~b~%s~s~"):format(v.staffName), {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        JailInteractMenu:SetSubtitle(("%s"):format(GetPlayerName(GetPlayerFromServerId(v.playerId))))
                                        currentJailId = v.playerId
                                    end
                                },JailInteractMenu)
                            else
                                RageUI.Button(("(~b~%s~s~) - %s"):format(v.playerId, "Joueur déconnecté"), ("Jail par : ~b~%s~s~"):format(v.staffName), {RightLabel = "→→"}, false, {})
                            end
                        end
                    else
                        RageUI.Separator("~r~Aucun joueur(s) en jail..")
                    end
                end)
                RageUI.IsVisible(JailInteractMenu, function()
                    RageUI.Button(("→ Id du joueur : ~b~%s~s~"):format(currentJailId), false, {}, true, {})
                    RageUI.Button("→ Sortir de jail le joueur", false, {}, true, {
                        onSelected = function()
                            if not coolDown then 
                                coolDown = true 
                                TriggerServerEvent("cxJail:unjailTarget", currentJailId)
                                SetTimeout(450, function()
                                    coolDown = false 
                                    RageUI.GoBack()
                                end)
                            end
                        end
                    })
                    RageUI.Button("→ Envoyer un message au joueur", false, {}, true, {
                        onSelected = function()
                            local Message = Input("SendMessage", ("Quel message souhaitez-vous envoyer à l'id ~b~%s~s~ ?"):format(currentJailId), "", 50)
                            if Message:gsub("%s+", "") == "" then 
                                return ESX.ShowNotification("~r~Message invalide.")
                            end
                            TriggerServerEvent("cxJail:sendMessage", currentJailId, Message)
                        end 
                    })
                end)
                Wait(0)
            end
        end)
    end
end)

if Jails.Settings.RegisterCommand then 
    RegisterCommand(Jails.Settings.RegisterName, function()
        TriggerServerEvent("cxJail:getJails")
    end)
end
