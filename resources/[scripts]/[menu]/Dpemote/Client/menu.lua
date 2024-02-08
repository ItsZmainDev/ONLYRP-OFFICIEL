Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- MENU ---


local open = false 
local menuemote = RageUI.CreateMenu('Menu Animations', " ") 
local smanim = RageUI.CreateSubMenu(menuemote, 'Animations', " ")
local smdance = RageUI.CreateSubMenu(smanim, 'Animations de Dance', " ")
local smobjet = RageUI.CreateSubMenu(smanim, 'Animations de Geste', " ")
local newemotes = RageUI.CreateSubMenu(smanim, 'Nouvelles Emotes', " ")
local smgeste = RageUI.CreateSubMenu(smanim, 'Animations avec Objet', " ")
local smautre = RageUI.CreateSubMenu(smanim, ' Autre Animations', " ")
local smactivite = RageUI.CreateSubMenu(smanim, "Animations d'Activités", " ")
local smpos = RageUI.CreateSubMenu(smanim, "Animations de Position", " ")
local smsport = RageUI.CreateSubMenu(smanim, "Animations de Sport", " ")
local smsante = RageUI.CreateSubMenu(smanim, "Animations de Santé", " ")
local smmarche = RageUI.CreateSubMenu(menuemote, "Style de Marche", " ")


menuemote.Display.Header = true 
menuemote.Closed = function()
  open = false
end

--- FUNCTION OPENMENU ---

local endance = false

function menuemoteyams() 
    if open then 
		open = false
		RageUI.Visible(menuemote, false)
		return
	else
		open = true 
    endance = true
		RageUI.Visible(menuemote, true)
		CreateThread(function()
		while open do 
        RageUI.IsVisible(menuemote, function()

          RageUI.Separator("~r~↓ Menu Animations ↓")
          

    RageUI.Button("Animations", nil, {RightLabel = "→"}, true , {
        onSelected = function()
          end
    }, smanim)
    
    RageUI.Button("Styles de Marche", nil, {RightLabel = "→"}, true , {
      onSelected = function()
        end
  }, smmarche)



    end)

    RageUI.IsVisible(smanim, function()

      RageUI.Button("Annuler Animation" , "Ou Appuyez sur ~r~X", { Color = { BackgroundColor = { 183, 28, 28, 160 } }, RightLabel = "→→"}, true, {   
        onSelected = function()
          ExecuteCommand("e c")
        end
      }) 

      RageUI.Separator("~r~↓ Liste de Toute les Animations ↓")

      RageUI.Button("Animations de Dance", nil, {RightLabel = "🕺"}, true , {
        onSelected = function()
        end
      }, smdance)

	  RageUI.Button("Animations avec Objet", nil, {RightLabel = "🎺"}, true , {
        onSelected = function()
        end
      }, smobjet) 

      RageUI.Button("Nouvelles Emotes", nil, {RightLabel = "🥵"}, true , {
        onSelected = function()
        end
      }, newemotes) 

      RageUI.Button("Animations de Geste", nil, {RightLabel = "✌"}, true , {
        onSelected = function()
        end
      }, smgeste) 

      RageUI.Button("Autres Animations", nil, {RightLabel = "❓"}, true , {
        onSelected = function()
        end
      }, smautre) 

      RageUI.Button("Animations Activité", nil, {RightLabel = "🏆"}, true , {
        onSelected = function()
        end
      }, smactivite) 

      RageUI.Button("Animations de Positions", nil, {RightLabel = "🙆‍♂️"}, true , {
        onSelected = function()
        end
      }, smpos)
        

      RageUI.Button("Animations de Sport", nil, {RightLabel = "⚽"}, true , {
        onSelected = function()
        end
      }, smsport)

      RageUI.Button("Animations de Santé", nil, {RightLabel = "👨‍⚕️"}, true , {
        onSelected = function()
        end
      }, smsante)

    end)

    RageUI.IsVisible(smdance, function()

    RageUI.Separator("~r~↓ Liste des Animations de Dance ↓")

    for k,v in pairs(danceanim) do
      RageUI.Button(v.nom, "Dans le Chat : ~r~/e ".. v.dance, {RightLabel = "→"}, true , {
        onSelected = function()
          local playerPed = PlayerPedId()
          ClearPedTasks(playerPed)
          Citizen.Wait(10)
          ExecuteCommand("e ".. v.dance)
        end
      }) 
    end


    end) 
    
    RageUI.IsVisible(smobjet, function()

      RageUI.Separator("~r~↓ Liste des Animations d'Objet ↓")
  
      for k,v in pairs(objetanim) do
        RageUI.Button(v.nom, "Dans le Chat : ~r~/e ".. v.dance, {RightLabel = "→"}, true , {
          onSelected = function()
            local playerPed = PlayerPedId()
            ClearPedTasks(playerPed)
            Citizen.Wait(10)
            ExecuteCommand("e ".. v.dance)
          end
        }) 
      end
  
  
      end)  

      RageUI.IsVisible(newemotes, function()

        RageUI.Separator("~r~↓ Liste des Nouvlles Emotes ↓")
    
        for k,v in pairs(emoemotes) do
          RageUI.Button(v.nom, "Dans le Chat : ~r~/e ".. v.dance, {RightLabel = "→"}, true , {
            onSelected = function()
              local playerPed = PlayerPedId()
              ClearPedTasks(playerPed)
              Citizen.Wait(10)
              ExecuteCommand("e ".. v.dance)
            end
          }) 
        end
    
    
        end)  
      
      RageUI.IsVisible(smgeste, function()

        RageUI.Separator("~r~↓ Liste des Animations de Geste ↓")
    
        for k,v in pairs(gesteanim) do
          RageUI.Button(v.nom, "Dans le Chat : ~r~/e ".. v.dance, {RightLabel = "→"}, true , {
            onSelected = function()
              local playerPed = PlayerPedId()
              ClearPedTasks(playerPed)
              Citizen.Wait(10)
              ExecuteCommand("e ".. v.dance)
            end
          }) 
        end
    
    
        end) 


        RageUI.IsVisible(smautre, function()

          RageUI.Separator("~r~↓ Liste des Autre Animations ↓")
      
          for k,v in pairs(autreanim) do
            RageUI.Button(v.nom, "Dans le Chat : ~r~/e ".. v.dance, {RightLabel = "→"}, true , {
              onSelected = function()
                local playerPed = PlayerPedId()
                ClearPedTasks(playerPed)
                Citizen.Wait(10)
                ExecuteCommand("e ".. v.dance)
              end
            }) 
          end
      
      
          end)


          RageUI.IsVisible(smactivite, function()

            RageUI.Separator("~r~↓ Liste des Animations d'Activités ↓")
        
            for k,v in pairs(activiteanim) do
              RageUI.Button(v.nom, "Dans le Chat : ~r~/e ".. v.dance, {RightLabel = "→"}, true , {
                onSelected = function()
                  local playerPed = PlayerPedId()
                  ClearPedTasks(playerPed)
                  Citizen.Wait(10)
                  ExecuteCommand("e ".. v.dance)
                end
              }) 
            end
        
        
            end) 

            RageUI.IsVisible(smpos, function()

              RageUI.Separator("~r~↓ Liste des Animations de Positions ↓")
          
              for k,v in pairs(posanim) do
                RageUI.Button(v.nom, "Dans le Chat : ~r~/e ".. v.dance, {RightLabel = "→"}, true , {
                  onSelected = function()
                    local playerPed = PlayerPedId()
                    ClearPedTasks(playerPed)
                    Citizen.Wait(10)
                    ExecuteCommand("e ".. v.dance)
                  end
                }) 
              end
          
          
              end) 


              RageUI.IsVisible(smsport, function()

                RageUI.Separator("~r~↓ Liste des Animations de Sport ↓")
            
                for k,v in pairs(sportanim) do
                  RageUI.Button(v.nom, "Dans le Chat : ~r~/e ".. v.dance, {RightLabel = "→"}, true , {
                    onSelected = function()
                      local playerPed = PlayerPedId()
                      ClearPedTasks(playerPed)
                      Citizen.Wait(10)
                      ExecuteCommand("e ".. v.dance)
                    end
                  }) 
                end
            
            
                end)


                RageUI.IsVisible(smsante, function()

                  RageUI.Separator("~r~↓ Liste des Animations de Santé ↓")
              
                  for k,v in pairs(santeanim) do
                    RageUI.Button(v.nom, "Dans le Chat : ~r~/e ".. v.dance, {RightLabel = "→"}, true , {
                      onSelected = function()
                        local playerPed = PlayerPedId()
                        ClearPedTasks(playerPed)
                        Citizen.Wait(10)
                        ExecuteCommand("e ".. v.dance)
                      end
                    }) 
                  end
              
              
                  end) 

                  RageUI.IsVisible(smmarche, function()

                    RageUI.Button("Annuler la Marche" , nil, { Color = { BackgroundColor = { 183, 28, 28, 160 } }, RightLabel = "→→"}, true, {   
                      onSelected = function()
                        ResetPedMovementClipset(PlayerPedId())
                      end
                    })


                    RageUI.Separator("~r~↓ Liste des Styles de Marches ↓")


                    for k,v in pairs(marcheeanim) do
                      RageUI.Button(v.nom, nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                          startdemarche(v.lamarche1, v.lamarche2)
                        end
                      }) 
                    end
                
                
                    end) 

   
         
			
		Wait(0)
	   end
	end)
 end
end



Keys.Register('F4', 'F4', 'Menu Animations', function()
  menuemoteyams()
end)

function startdemarche(lib, anim)
	ESX.Streaming.RequestAnimSet(lib, function()
		SetPedMovementClipset(PlayerPedId(), anim, true)
	end)
end

yamsstopanim = function()
  local playerPed = PlayerPedId()
  ClearPedTasks(playerPed)
  DestroyAllProps(playerPed)
end  


Keys.Register('X', 'X', 'Stop Animations', function()
  yamsstopanim()
end)


danceanim = {
  {nom = "Drill ", dance = "jdrill"},
  {nom = "Drill 2", dance = "jdrill2"},
  {nom = "Drill 3", dance = "jdrill3"},
  {nom = "Drill 4", dance = "jdrill4"},
  {nom = "Drill 5", dance = "jdrill5"},
  {nom = "Drill 6", dance = "jdrill6"},
  {nom = "Drill 7", dance = "jdrill7"},
  {nom = "Drill 8", dance = "jdrill8"},
  {nom = "Drill 9", dance = "jdrill9"},
  {nom = "Drill 10", dance = "jdrill10"},
  {nom = "Fortnite 1 ", dance = "crossbounce"},
  {nom = "Fortnite 2", dance = "dontstart"},
  {nom = "Fortnite 3", dance = "floss"},
  {nom = "Fortnite 4", dance = "orangejustice"},
  {nom = "Fortnite 5", dance = "renegade"},
  {nom = "Fortnite 6", dance = "rickroll"},
  {nom = "Fortnite 7", dance = "savage"},
  {nom = "Fortnite 8", dance = "sayso"},
  {nom = "Fortnite 9", dance = "takel"},
  {nom = "Fortnite 10", dance = "tslide"},
  {nom = "Fortnite 11 ", dance = "clock"},
  {nom = "Fortnite 12", dance = "dancemoves"},
  {nom = "Fortnite 13", dance = "discodance"},
  {nom = "Fortnite 14", dance = "electroshuffle"},
  {nom = "Fortnite 15", dance = "electroshuffle2"},
  {nom = "Fortnite 16", dance = "fresh"},
  {nom = "Fortnite 17", dance = "gylphic"},
  {nom = "Fortnite 18", dance = "hitit"},
  {nom = "Fortnite 19", dance = "inparty"},
  {nom = "Fortnite 20", dance = "robotdance"},
  {nom = "Fortnite 21", dance = "frightfunk"},
  {nom = "Fortnite 22", dance = "gloss"},
  {nom = "Fortnite 23", dance = "lastforever"},
  {nom = "Fortnite 24", dance = "smoothmoves"},
  {nom = "Fortnite 25", dance = "introducing"},
  {nom = "Dance", dance = "dance"},
  {nom = "Dance 2", dance = "dance2"},
  {nom = "Dance 3", dance = "dance3"},
  {nom = "Dance 4", dance = "dance4"},
  {nom = "Dance 5", dance = "dance5"},
  {nom = "Dance 6", dance = "dance6"},
  {nom = "Dance 7", dance = "dance7"},
  {nom = "Dance 8", dance = "dance8"},
  {nom = "Dance 9", dance = "dance9"},
  {nom = "Dance Femme", dance = "dancef"},
  {nom = "Dance Femme 2", dance = "dancef2"},
  {nom = "Dance Femme 3", dance = "dancef3"},
  {nom = "Dance Femme 4", dance = "dancef4"},
  {nom = "Dance Femme 5", dance = "dancef5"},
  {nom = "Dance Femme 6", dance = "dancef6"},
  {nom = "Dance bâtons lumineux", dance = "danceglowstick"},
  {nom = "Dance bâtons lumineux 2", dance = "danceglowstick2"},
  {nom = "Dance bâtons lumineux 3", dance = "danceglowstick3"},
  {nom = "Dance de Cheval", dance = "dancehorse"},
  {nom = "Dance de Cheval 2", dance = "dancehorse2"},
  {nom = "Dance de Cheval 3", dance = "dancehorse3"},
  {nom = "Dance Timide", dance = "danceshy"},
  {nom = "Dance Timide 2", dance = "danceshy2"},
  {nom = "Dance Idiote", dance = "dancesilly"},
  {nom = "Dance Idiote 2", dance = "dancesilly2"},
  {nom = "Dance Idiote 3", dance = "dancesilly3"},
  {nom = "Dance Idiote 4", dance = "dancesilly4"},
  {nom = "Dance Idiote 5", dance = "dancesilly5"},
  {nom = "Dance Lente", dance = "danceslow"},
  {nom = "Dance Lente 2", dance = "danceslow2"},
  {nom = "Dance Lente 3", dance = "danceslow3"},
  {nom = "Uncle Josh", dance = "unclej"},
  {nom = "Dance Singe 1", dance = "jmonkeyd"},
  {nom = "Dance Singe 2", dance = "jmonkeyd2"},
  {nom = "Dance Singe 3", dance = "jmonkeyd3"},
  {nom = "Boxing Dance Solo", dance = "jrightdown"},
  {nom = "Hip Hop Dance", dance = "jhiphop"},
  {nom = "Hip Hop Dance 2", dance = "jhiphop2"},
  {nom = "Hip Hop Dance 3", dance = "jhiphop3"},
}

objetanim = {
  {nom = "Avoir un Sac à dos", dance = "backpack"},
  {nom = "Boire de la Bière", dance = "beer"},
  {nom = "Pancarte SDF", dance = "beg"},
  {nom = "Fumer une Chicha", dance = "bong"},
  {nom = "Lire un Livre", dance = "book"},
  {nom = "Tenir un Bouquet de fleur", dance = "bouquet"},
  {nom = "Tenir une Boite", dance = "box"},
  {nom = "Tenir une Mallette", dance = "brief3"},
  {nom = "Tenir un Burger", dance = "buger"},
  {nom = "Prendre un Appareil Photo", dance = "camera"},
  {nom = "Tenir un Verre de Champagne", dance = "champagne"},
  {nom = "Arroser du Champagne", dance = "champagnespray"},
  {nom = "Fumer une Cigarette", dance = "cig"},
  {nom = "Fumer un Cigar", dance = "cigar"},
  {nom = "Nettoyer une Table", dance = "clean"},
  {nom = "Nettoyer une Vitre", dance = "clean2"},
  {nom = "Consulter un Bloc Notes", dance = "clipboard"},
  {nom = "Tenir un Café", dance = "coffee"},
  {nom = "Tenir une Tasse", dance = "cup"},
  {nom = "Manger un Donut", dance = "donut"},
  {nom = "Manger une Barre de Chocolat", dance = "egobar"},
  {nom = "Tenir un Verre de Champagne Vide", dance = "flute"},
  {nom = "Jouer une Guitare", dance = "guitar"},
  {nom = "Jouer de la Guitare en mouvement", dance = "guitar2"},  
  {nom = "Jouer de la Guitare éléctrique", dance = "guitarelectric"},
  {nom = "Jouer de la Guitare éléctrique 2", dance = "guitarelectric2"},
  {nom = "Fumer un Joint", dance = "joint"},
  {nom = "Faire une Pluie de Billet", dance = "makeitrain"},
  {nom = "Consulter une Carte GPS", dance = "map"},
  {nom = "Plaque de Photo d'Identité", dance = "mugshot"},
  {nom = "Ecrire sur un Bloc Note", dance = "notepad"},
  {nom = "Regarder son Téléphone", dance = "phone"},
  {nom = "Appeler Quelqu'un", dance = "phonecall"},
  {nom = "Tenir une Rose", dance = "rose"},
  {nom = "Manger un Sandwich", dance = "sandwich"},
  {nom = "Tenir une Canette de Soda", dance = "soda"},
  {nom = "Tenir une Valise", dance = "suitcase"},
  {nom = "Tenir une Mallette", dance = "suitcase2"},
  {nom = "Consulter une Tablette", dance = "tablet"},
  {nom = "Consulter une Tablette 2", dance = "tablet2"},
  {nom = "Tenir une Peluche", dance = "teddy"},
  {nom = "Tenir un Parapluie", dance = "umbrella"}, 
}

emoemotes = {
  { nom = "Porter une caisse", dance = "jpbox"},
  { nom = "Fouiller", dance = "jch"},
  { nom = "Dans ton cul", dance = "jgangsign5"},
  { nom = "Regarder l'heure", dance = "jcheckwatch"},
  { nom = "Cueillette", dance = "jpicking"},
  { nom = "Pointer", dance = "jgangaim"},
  { nom = "Montrer ses seins", dance = "jshowboobs"},
  { nom = "Montrer ses seins 2", dance = "jshowboobs2"},
  { nom = "Nettoyer son cul", dance = "jcleanleg"},
  { nom = "Selfie 3", dance = "jselfie5"},
  { nom = "Selfie Côte ouest", dance = "jselfiewc"},
  { nom = "Selfie doigt", dance = "jselfie3"},
  { nom = "Selfie tchek", dance = "jselfie4"},
  { nom = "Mais NTMMMM", dance = "jkhaby"},
  { nom = "Dépressif", dance = "jdepressed"},
  { nom = "Signe Gang Voiture", dance = "jcarsign"},
  { nom = "Signe Gang Voiture2", dance = "jcarsign2"},
  { nom = "Conduire en Lowrider", dance = "jcarlowrider"},
  { nom = "Conduire en Lowrider Mexicain", dance = "jcarlowrider2"},
  { nom = "Tout à fait", dance = "jreactiona"},
  { nom = "Alléluia", dance = "jreactanger"},
  { nom = "Pourquoi", dance = "jreactwhy"},
  { nom = "Fucky you Rapide", dance = "jreactscrew"},
  { nom = "Choquer", dance = "jreactshock"},
  { nom = "Bon choix", dance = "jreactgoodc"},
  { nom = "Vérifier vêtements", dance = "jtrynewc"},
  { nom = "Vérifier vêtements 2", dance = "jtrynewc2"},
  { nom = "facile maintenant", dance = "jreacteasy"},
  { nom = "J'y vais", dance = "jreactıwill"},
  { nom = "pas du tout", dance = "jreactnoway"},
  { nom = "Aurevoir méchant", dance = "jreactbye"},
  { nom = "Hello", dance = "jreacthello"},
  { nom = "Regarder un joueur", dance = "jlookatplayer"},
  { nom = "Bien", dance = "jreactgreat"},
  { nom = "Faux coup de poing", dance = "jfakepunch"},
  { nom = "Damm", dance = "jreactdamn"},
  { nom = "Je te dis", dance = "jimtellingyou"},
  { nom = "No", dance = "jreactno"},
  { nom = "Ne me tue pas", dance = "jdontkillme"},
  { nom = "Bang Bang", dance = "jbangbang"},
  { nom = "Ouais et alors", dance = "jtryshirtn"},
  { nom = "Bas quoi", dance = "jtryshirtp"},
  { nom = "Regarder ses chaussures", dance = "jtryshoes"},
  { nom = "Regarder ses chaussures 2", dance = "jtryshoes2"},
  { nom = "Hey je suis la", dance = "joverhere"},
  { nom = "Ce nettoyer le visage", dance = "jwashingface"},
  { nom = "Dernier jour", dance = "jlastday"},
  { nom = "Essayer les lunettes", dance = "jtryg"},
  { nom = "Ramasser", dance = "jpickup"},
  { nom = "S'éttirer", dance = "jstretchl"},
  { nom = "Bas ouais ", dance = "jhos"},
  { nom = "Je crois pas", dance = "jhos2"},
  { nom = "Position de défence", dance = "jguardaim"},
  { nom = "Je suis prêt", dance = "jgready"},
  { nom = "Regarder sa tenue", dance = "jlao"},
  { nom = "Faire caca", dance = "jtoilet"},
  { nom = "Faire caca 2", dance = "jtoilet2"},
  { nom = "Effrayer", dance = "jcovermale2"},
  { nom = "Ce réchauffer les mains", dance = "jvalet"},
  { nom = "Position Gare", dance = "jvalet2"},
  { nom = "S'allonger sur la plage", dance = "jsunbathem"},
  { nom = "S'allonger sur la plage 2", dance = "jsunbathem2"},
  { nom = "Attendra la voiture", dance = "jleancar"},
  { nom = "Accroupi", dance = "jcheckout"},
  { nom = "Bras croisés", dance = "jcheckout2"},
  { nom = "Lire un sms", dance = "jreadmessages"},
  { nom = "Lire un sms 2 · Female ", dance = "jreadmessages2"},
  { nom = "Ecouter de la musique", dance = "jlistenmusic"},
  { nom = "Faire du jogging", dance = "jogger"},
  { nom = "Faire du jogging 2", dance = "jogger2"},
  { nom = "WHAT THE FUCK", dance = "jwtf"},
  { nom = "Tu peux le faire", dance = "jucdt"},
  { nom = "S'échauffer ", dance = "jwarmup"},
  { nom = "S'échauffer 2 ", dance = "jwarmup2"},
  { nom = "S'échauffer 3 ", dance = "jwarmup3"},
  { nom = "S'échauffer 4 ", dance = "jwarmup4"},
  { nom = "Allonger au sol ", dance = "jpassout"},
  { nom = "chouffer ", dance = "jddealer"},
  { nom = "S'ambiancer", dance = "jswatch"},
  { nom = "Vérifier température de l'eau", dance = "jcheckw"},
  { nom = "Attendre le taxi", dance = "jwaitt"},
  { nom = "Pourquoi pas", dance = "jnoway"},
  { nom = "Dit moi un truc ", dance = "jtsomething"},
  { nom = "Chercher de l'aide ", dance = "jlfh"},
  { nom = "Montrer ses mucles", dance = "jmstretch"},
  { nom = "DJ", dance = "jdj"},
  { nom = "DJ 2", dance = "jdj2"},
  { nom = "DJ 3", dance = "jdj3"},
  { nom = "DJ 4", dance = "jdj4"},
  { nom = "Ecouter de la musique en voiture", dance = "jlmic"},
  { nom = "Descend de la voiture !", dance = "jgotc"},
  { nom = "Triste", dance = "jvsad"},
  { nom = "Passer le rateau", dance = "jdgrave"},
  { nom = "Attendre accroupi", dance = "jbow3"},
  { nom = "Prier", dance = "jweeding"},
  { nom = "Regarder le plan", dance = "jlookplan"},
  { nom = "Boire comme un gang", dance = "jgangdrink"},
  { nom = "Attendre contre un mur", dance = "jmleaning"},
  { nom = "Merci", dance = "jthanks"},
  { nom = "Ecrire un SMS", dance = "jtextingmale"},
  { nom = "Baiser", dance = "jffb"},
}

gesteanim = {
  {nom = "Ajustez sa Chemise", dance = "adjust"},
  {nom = "Se Disputer", dance = "argue"},
  {nom = "Faire des Geste de la Main", dance = "boi"},
  {nom = "Applaudir Joyeusement", dance = "clap"},
  {nom = "Applaudir comme un Débile", dance = "clapangry"},
  {nom = "C'est mon Frère saaaa", dance = "comeatmebro"},
  {nom = "Tousser", dance = "cough"},
  {nom = "Toi la ! t'es un Homme Mort", dance = "cutthroat"},
  {nom = "Je vais te trancher la Gorge", dance = "cutthroat2"},
  {nom = "Ah Merde...", dance = "damn"},
  {nom = "Manger", dance = "eat"},
  {nom = "Oh lala ...", dance = "facepalm"},
  {nom = "Hein ? Pas possible ...", dance = "facepalm2"},
  {nom = "Quelle Malheur", dance = "facepalm3"},
  {nom = "Quel Idiot ...", dance = "facepalm4"},
  {nom = "Fuck", dance = "finger"},
  {nom = "Double Fuck", dance = "finger2"},
  {nom = "Montrer ses Muscles", dance = "flex"},
  {nom = "Signe Gang de Marabunta", dance = "gangsign"},
  {nom = "Signe de Gang", dance = "gangsign2"},
  {nom = "Tcheck", dance = "handshake"},
  {nom = "Tcheck 2", dance = "handshake2"},
  {nom = "Lever les Mains en l'Air", dance = "handsup"},
  {nom = "Coup de Tete", dance = "headbutt"},
  {nom = "Calin", dance = "hug"},
  {nom = "Calin 2", dance = "hug2"},
  {nom = "Clown", dance = "jazzhands"},
  {nom = "Utiliser une Clée", dance = "keyfob"},
  {nom = "Toquer à une Porte", dance = "knock"},
  {nom = "Toquer Fort à une Porte", dance = "knock2"},
  {nom = "Se craquer les Doigts", dance = "knucklecrunch"},
  {nom = "S'aggripper à quelqu'un", dance = "leanside5"},
  {nom = "Faire du Stop", dance = "lift"},
  {nom = "Non pas du Tout !", dance = "no"},
  {nom = "Non de la tete", dance = "no2 "},
  {nom = "Absolument pas", dance = "noway"},
  {nom = "Okk", dance = "ok"},
  {nom = "Peace and Love", dance = "peace"},
  {nom = "Ramasser Quelque chose", dance = "pickup"},
  {nom = "Main sur me Holster", dance = "reaching"},
  {nom = "Salut de l'Armée", dance = "salute"},
  {nom = "Salut de l'Armée 2", dance = "salute2"},
  {nom = "Enelever la Poussière au sol", dance = "shakeoff"},
  {nom = "Hein ?", dance = "shrug"},
  {nom = "Giffler Quelqu'un", dance = "slap"},
  {nom = "Applaudir Doucement", dance = "slowclap"},
  {nom = "Sa Pue ...", dance = "stink"},
  {nom = "Penser Profonde", dance = "think2"},
  {nom = "Double Pouce en l'Air", dance = "thumbsup"},
  {nom = "Coucouu !", dance = "wave"},
  {nom = "Salut de Reine", dance = "wave2"},
  {nom = "Sifflé", dance = "whistle"},
  {nom = "Sifflé 2", dance = "whistle2"},
  {nom = "Yeahh", dance = "yeah"},
}




autreanim = {
  {nom = "Se Ré-habillez Correment", dance = "adjusttie"},
  {nom = "Faire l'avion", dance = "airplane"},
  {nom = "Faire le Chien", dance = "bark"},
  {nom = "Faire l'Oiseau", dance = "bird"},
  {nom = "Plein de Bisous", dance = "blowkiss"},
  {nom = "Célébration", dance = "celebrate"},
  {nom = "Faire la Poule", dance = "chiken"},
  {nom = "Faire le Clown", dance = "clown"},
  {nom = "Faire le DJ", dance = "dj"},
  {nom = "Faire un Tweerk", dance = "twerk"},
  {nom = "Faire un Tweerk 2", dance = "lapdance2"},
  {nom = "Faire un Tweerk 3", dance = "lapdance3"},
  {nom = "Faire le Superman", dance = "ledge"},
  {nom = "Pousser sur le Coté", dance = "peek"},
  {nom = "Pousser", dance = "push"},
  {nom = "Pousser 2", dance = "push2"},
  {nom = "Radio", dance = "radio"},
  {nom = "S'asseoir", dance = "sit"},
  {nom = "S'asseoir 2", dance = "sit2"},
  {nom = "S'asseoir 3", dance = "sit3"},
  {nom = "S'asseoir 4", dance = "sit4"},
  {nom = "S'asseoir 5", dance = "sit5"},
  {nom = "S'asseoir 6", dance = "sit6"},
  {nom = "S'asseoir 7", dance = "sit7"},
  {nom = "S'asseoir 8", dance = "sit8"},
  {nom = "S'asseoir 9", dance = "sit9"},
  {nom = "S'asseoir sur une Chaise", dance = "sitchair"},
  {nom = "S'asseoir sur une Chaise 2", dance = "sitchair2"},
  {nom = "S'asseoir sur une Chaise 3", dance = "sitchair3"},
  {nom = "S'asseoir sur une Chaise 4", dance = "sitchair4"},
  {nom = "S'asseoir sur une Chaise 5", dance = "sitchair5"},
  {nom = "S'asseoir sur une Chaise 6", dance = "sitchair6"},
  {nom = "S'asseoir Tristement", dance = "sitsad"},
  {nom = "S'asseoir Effrayer", dance = "sitscared"},
  {nom = "Pointer avec son arme", dance = "stickup"},
  {nom = "Faire le Super-Héro", dance = "superhero"},
  {nom = "Faire le Super-Héro 2", dance = "superhero2"},
  {nom = "Pointer avec son arme 2", dance = "threaten"},
}


activiteanim = {
  {nom = "Faire de la Guitare dans le Vent", dance = "airguitar"},
  {nom = "Faire du Piano dans le Vent", dance = ""},
  {nom = "ATM", dance = "atm"},
  {nom = "BBQ", dance = "bbq"},
  {nom = "Fin de Spectale", dance = "bow"},
  {nom = "Félécitation", dance = "cheer"},
  {nom = "Boire", dance = "drink"},
  {nom = "Ivre à en Tomber", dance = "fallover"},
  {nom = "Se Prendre une Balle dans la Tete", dance = "fallover4"},
  {nom = "Se Prendre une Droite", dance = "fallover5"},
  {nom = "Taper au Marteau", dance = "hammer"},
  {nom = "Tenir son Sac", dance = "hiking"},
  {nom = "Tenir un Balai", dance = "janitor"},
  {nom = "Souffler les Feuilles", dance = "leafblower"},
  {nom = "Essuyer une vitre", dance = "maid"},
  {nom = "Réparer un moteur", dance = "mechanic"},
  {nom = "Réparer l'Avant d'un Véhicule", dance = "mechanic3"},
  {nom = "Sortir son Notepad", dance = "notepad2"},
  {nom = "Boire une Bière en dansant", dance = "party"},
  {nom = "Fumer une Cigarette", dance = "smoke"},
  {nom = "Fumer de la Weed", dance = "smokeweed"},
  {nom = "Envoyer un Message", dance = "texting"},
  {nom = "Taper sur un Clavier", dance = "type"},
  {nom = "Crocheter une Porte", dance = "weld"},
}



posanim = {
  {nom = "Grosse Sieste", dance = "bumsleep"},
  {nom = "Allongé Relax", dance = "chill"},
  {nom = "Allongé Dos au Sol", dance = "cloudgaze"},
  {nom = "Allongé Dos au Sol 2", dance = "cloudgaze"},
  {nom = "Les Mains sur la Ceinture", dance = "cop"},
  {nom = "LSPD Bras Croisé", dance = "cop2"},
  {nom = "LSPD Appel Radio", dance = "cop3"},
  {nom = "Croiser les Bras", dance = "crossarms"},
  {nom = "Croiser les Bras 2", dance = "crossarms2"},
  {nom = "Croiser les Bras 3", dance = "crossarms3"},
  {nom = "Croiser les Bras 4", dance = "crossarms4"},
  {nom = "Croiser les Bras 5", dance = "crossarms5"},
  {nom = "Croiser les Bras 6", dance = "crossarms6"},
  {nom = "Dormir Debout", dance = "fallassleep"},
  {nom = "Pose de Videur", dance = "guard"},
  {nom = "Attendre un Client", dance = "hangout"},
  {nom = "Tcheck Gang", dance = "hug3"},
  {nom = "Attendre Poser contre un Mur", dance = "lean"},
  {nom = "Poser contre un Mur à Fumer", dance = "lean2"},
  {nom = "Poser contre un Mur Détendu", dance = "lean3"},
  {nom = "Poser contre un Mur les Mains Croisés", dance = ""},
  {nom = "S'allonger à Plat Ventre", dance = "prone"},
  {nom = "Dormir", dance = "sleep"},
  {nom = "Faire la Statue", dance = "statue"},
  {nom = "Faire la Statue 2", dance = "statue2"},
  {nom = "Faire la Statue 3", dance = "statue3"},
  {nom = "Se Rendre", dance = "surrender"},
  {nom = "Faire le T", dance = "t"},
  {nom = "Faire le T 2", dance = "t2"},
  {nom = "Attendre", dance = "wait"},
  {nom = "Attendre 2", dance = "wait2"},
  {nom = "Attendre 3", dance = "wait3"},
  {nom = "Attendre 4", dance = "wait4"},
  {nom = "Attendre 5", dance = "wait5"},
  {nom = "Attendre 6", dance = "wait6"},
  {nom = "Attendre 7", dance = "wait7"},
  {nom = "Attendre 8", dance = "wait8"},
  {nom = "Attendre 9", dance = "wait9"},
  {nom = "Attendre 10", dance = "wait10"},
  {nom = "Attendre 11", dance = "wait11"},
  {nom = "Attendre 12", dance = "wait12"},
  {nom = "Attendre 13", dance = "wait13"},
}


sportanim = {
  {nom = "Entrainement de Boxe", dance = "boxing"},
  {nom = "Entrainement de Boxe 2", dance = "boxing2"},
  {nom = "Faire des Tractions", dance = "chinup"},
  {nom = "Faire un Salto", dance = "flip"},
  {nom = "Faire un Salto 2", dance = "flip2"},
  {nom = "S'échauffer pour un Jogging", dance = "jog"},
  {nom = "Faire son Jogging", dance = "jog2"},
  {nom = "Faire son Jogging 2", dance = "jog3"},
  {nom = "Faire son Jogging 3", dance = "jog4"},
  {nom = "Faire son Jogging 4", dance = "jog5"},
  {nom = "Faire des JumpingJacks", dance = "jumpingjacks"},
  {nom = "Faire du Karate", dance = "karate"},
  {nom = "Faire du Karate 2", dance = "karate2"},
  {nom = "Faire des Pompe", dance = "pushup"},
  {nom = "Faire des Abdos", dance = "situp"},
  {nom = "Célébration sur les Genoux", dance = "slide"},
  {nom = "Célébration sur les Genoux 2", dance = "slide2"},
  {nom = "Célébration sur les Genoux 3", dance = "slide3"},
  {nom = "Tir à la Bate", dance = "slugger"},
  {nom = "Faire du Yoga", dance = "yoga"},
}



santeanim = {
  {nom = "Massage Cardique au Sol", dance = "cpr"},
  {nom = "Massage Cardique sur une Table", dance = "cpr2"},
  {nom = "Ramper au Sol Blessé", dance = "crawl"},
  {nom = "Medecin Inspectant une Personne", dance = "medic"},
  {nom = "Perde Connaisance", dance = "passout"},
  {nom = "Perde Connaisance 2", dance = "passout2"},
  {nom = "Perde Connaisance 3", dance = "passout3"},
  {nom = "Perde Connaisance 4", dance = "passout4"},
  {nom = "Perde Connaisance 5", dance = "passout5"},
  {nom = "Blesser par Balle au Sol", dance = "shot"},
}

-- Liste des Styles de Marhes

marcheeanim = {
	{nom = "Depressif homme", lamarche1 = "move_m@depressed@a", lamarche2 ="move_m@depressed@a"},
	{nom = "Depressif femme", lamarche1 = "move_f@depressed@a", lamarche2 ="move_f@depressed@a"},
	{nom = "Business", lamarche1 = "move_m@business@a", lamarche2 ="move_m@business@a"},
	{nom = "Determiné", lamarche1 = "move_m@brave@a", lamarche2 ="move_m@brave@a"},
	{nom = "Casual", lamarche1 = "move_m@casual@a", lamarche2 ="move_m@casual@a"},
	{nom = "Trop mangé", lamarche1 = "move_m@fat@a", lamarche2 ="move_m@fat@a"},
	{nom = "Hipster", lamarche1 = "move_m@hipster@a", lamarche2 ="move_m@hipster@a"},
	{nom = "Blessé", lamarche1 = "move_m@injured", lamarche2 ="move_m@injured"},
	{nom = "Intimidé", lamarche1 = "move_m@hurry@a", lamarche2 ="move_m@hurry@a"},
	{nom = "Hobo", lamarche1 = "move_m@hobo@a", lamarche2 ="move_m@hobo@a"},
	{nom = "Malheureux", lamarche1 = "move_m@sad@a", lamarche2 ="move_m@sad@a"},
	{nom = "Muscle", lamarche1 = "move_m@muscle@a", lamarche2 ="move_m@muscle@a"},
	{nom = "Choc", lamarche1 = "move_m@shocked@a", lamarche2 ="move_m@shocked@a"},
	{nom = "Sombre", lamarche1 = "move_m@shadyped@a", lamarche2 ="move_m@shadyped@a"},
	{nom = "Fatigue", lamarche1 = "move_m@buzzed", lamarche2 ="move_m@buzzed"},
	{nom = "Fier", lamarche1 = "move_m@money", lamarche2 ="move_m@money"},
	{nom = "Petite course", lamarche1 = "move_m@quick", lamarche2 ="move_m@quick"},
	{nom = "Mangeuse d'homme", lamarche1 = "move_f@maneater", lamarche2 ="move_f@maneater"},
}
