Jails = {}
Jails.MenuIsOpen = false 

Jails.Settings = {
    ServerName = "OnlyRP Staff",
    RegisterCommand = true, -- Permet d'ouvrir le menu depuis une commande
    RegisterName = "+Jail", -- Nom de la commande à exécuter pour ouvrir le menu (si activé au dessus)
    EnableConsole = true, -- Savoir si depuis la console, on peut exécuter le /jail, /unjail pour faire rentrer/sortir un joueur en jeu
    ViewStaffName = true, -- Voir le nom du staff qui vous a jail !
    ViewOtherPlayer = true, -- Voir les autres joueurs jails autour de vous !
    JailZone = vector3(1725.5272216797,2537.9025878906,43.585388183594), -- Position où le joueur attérit une fois jail
    ExitZone = vector3(1848.62, 2586.46, 45.66) -- Position où le joueur attérit une fois sortie du jail 
}

Jails.Logs = {
    ActiveLogs = true, -- Activer ou non les logs 
    Webhook = "https://discord.com/api/webhooks/1092181471659315310/09C4S5XIQmCUg0dmBPJvrFeXmAN8Ie6C-VVvwjjseGH4p2oCP-czhiD8lJWbbyIrcNSY", -- channel discord 
    WebhookColor = "1752220", -- Default color "1752220"
    JailMessage = "**%s** - [%s] (**%s**)\nà /jail : %s - [%s]\n(**%s**)", -- Message envoyé dans les logs lors d'un /jail
    UnJailMessage = "**%s** - [%s] (**%s**)\nà /unjail : %s - [%s]\n(**%s**)", -- Message envoyé dans les logs lors d'un /unjail
    PlayerUnJailMessage = "**%s** - [%s] (**%s**) a fini son jail !" -- Message envoyé dans les logs lorsqu'un joueur fini son jail 
}


