local PlayersList = {}

function GetPlayerById(source)
    return PlayersList[source]
end

Players = {}
userData = {}

local __instance = {__index  = Players}

setmetatable(Players, {
    __call = function(_, source, userData)
        local self = setmetatable({}, __instance)
        self.source = source
        self.identifier = userData.identifier
        self.uniqueid = userData.uniqueid
        self.coins = userData.coins
        self.usedCoins = userData.usedCoins
        self.boutiqueHistory = ''
        self.reward = userData.boutiquereward

        function self.getIdentifier()
            return self.identifier
        end

        function self.getCoins()
            return self.coins
        end

        function self.getUsedCoins()
            return self.usedCoins
        end

        function self.setCoins(value)
            if self.source == nil or value == nil then return end

            self.coins = self.coins + value
        end

        function self.setUsedCoins(value)
            if self.source == nil or value == nil then return end

            self.usedCoins = self.usedCoins + value
        end

        function self.getUniqueId()
            return self.uniqueid
        end

        function self.boutiqueHistory()
            return self.boutiqueHistory
        end

        function self.getRecompense()
            return self.reward
        end

        PlayersList[self.source] = self return self
    end
})

AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = xPlayer.UniqueID
    }, function(result)
        if result[1] == nil then return end
        userData.identifier = result[1].identifier
        userData.coins = result[1].onlycoins
        userData.usedCoins = result[1].totalCoins
        userData.uniqueid = result[1].UniqueID
        userData.boutiquereward = result[1].boutiquereward
        Players(source, userData)
        local player = GetPlayerById(source)
        TriggerClientEvent('boutique:update', source, player.getCoins(), player.getUsedCoins(), userData.boutiquereward )
    end)
end)

RegisterNetEvent('boutique:load', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = xPlayer.UniqueID
    }, function(result)
        if result[1] == nil then return end
        userData.identifier = result[1].identifier
        userData.coins = result[1].onlycoins
        userData.usedCoins = result[1].totalCoins
        userData.uniqueid = result[1].UniqueID
        userData.boutiquereward = result[1].boutiquereward
        Players(source, userData)
        local player = GetPlayerById(source)
        TriggerClientEvent('boutique:update', source, player.getCoins(), player.getUsedCoins(), player.getRecompense())
    end)
end)

local isServer = false

RegisterCommand('sendCoins', function(source, args)
    isServer = true
    local source = source
    if args[1] == nil then return print('^1ERROR^0') end
    if tonumber(args[2]) == nil then return print('^1ERROR^0') end
    local player = ReturnPlayerId(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.getGroup() ~= 'fondateur' then DropPlayer(source, 'Tu joue à quoi PELO ??????????') end
    end

    if player then
        local targetPlayer = GetPlayerById(tonumber(player.id))
        MySQL.Async.execute('UPDATE users SET onlycoins = @onlycoins WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = targetPlayer.getUniqueId(),
            ['@onlycoins'] = targetPlayer.getCoins() + tonumber(args[2])
        }, function(rowChanger)
            targetPlayer.setCoins(tonumber(args[2]))
            TriggerClientEvent('boutique:update', player.id, targetPlayer.getCoins(), targetPlayer.getUsedCoins(), targetPlayer.getRecompense())

            sendLog(('Achat coins boutique (%s - %s) (%s) '):format('CONSOLE (GIVE)', args[1], args[2]), {
                author = 'xPlayer.name',
                fields = {
                    {title = 'Joueur', subtitle = 'CONSOLE (GIVE)'},
                    {title = 'ID Unique', subtitle = args[1]},
                    {title = 'Identifier', subtitle = 'CONSOLE (GIVE)'},
                    {title = 'Coins', subtitle = args[2]}
                },
                channel = 'coins_buy_boutique'
            })
        end)
    else
        if type(args[1]) ~= 'number' then
            MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
                ['@identifier'] = args[1]
            }, function(rs)
                if rs[1] == nil then return end
                MySQL.Async.execute('UPDATE users SET onlycoins = @onlycoins WHERE identifier = @identifier', {
                    ['@identifier'] = rs[1].identifier,
                    ['@onlycoins'] = rs[1].onlycoins + tonumber(args[2])
                })

                sendLog(('Achat coins boutique (%s - %s) (%s) '):format('CONSOLE (GIVE)', args[1], args[2]), {
                    author = 'xPlayer.name',
                    fields = {
                        {title = 'Joueur', subtitle = 'CONSOLE (GIVE)'},
                        {title = 'ID Unique', subtitle = args[1]},
                        {title = 'Identifier', subtitle = 'CONSOLE (GIVE)'},
                        {title = 'Coins', subtitle = args[2]}
                    },
                    channel = 'coins_buy_boutique'
                })
            end)
        else
            MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
                ['@UniqueID'] = args[1]
            }, function(rs)
                if rs[1] == nil then return end
                MySQL.Async.execute('UPDATE users SET onlycoins = @onlycoins WHERE identifier = @UniqueID', {
                    ['@identifier'] = rs[1].identifier,
                    ['@onlycoins'] = rs[1].onlycoins + tonumber(args[2])
                })
                sendLog(('Achat coins boutique (%s - %s) (%s) '):format('CONSOLE (GIVE)', args[1], args[2]), {
                author = 'xPlayer.name',
                    fields = {
                        {title = 'Joueur', subtitle = 'CONSOLE (GIVE)'},
                        {title = 'ID Unique', subtitle = args[1]},
                        {title = 'Identifier', subtitle = 'CONSOLE (GIVE)'},
                        {title = 'Coins', subtitle = args[2]}
                    },
                    channel = 'coins_buy_boutique'
                })
            end)
        end
    end

    if type(args[1]) == 'number' then
        MySQL.Async.fetchAll('SELECT * FROM users WHERE UniqueID = @UniqueID', {
            ['@UniqueID'] = args[1]
        }, function(rs)
            if rs[1] == nil then return end
            MySQL.Async.execute('UPDATE users SET onlycoins = @onlycoins WHERE identifier = @identifier', {
                ['@identifier'] = rs[1].identifier,
                ['@onlycoins'] = rs[1].onlycoins + tonumber(args[2])
            })

            sendLog(('Achat coins boutique (%s - %s) (%s) '):format('CONSOLE (GIVE)', args[1], args[2]), {
                author = xPlayer.name,
                fields = {
                    {title = 'Joueur', subtitle = 'CONSOLE (GIVE)'},
                    {title = 'ID Unique', subtitle = args[1]},
                    {title = 'Identifier', subtitle = 'CONSOLE (GIVE)'},
                    {title = 'Coins', subtitle = args[2]}
                },
                channel = 'coins_buy_boutique'
            })
        end)
    else
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
            ['@identifier'] = args[1]
        }, function(rs)
            if rs[1] == nil then return end
            MySQL.Async.execute('UPDATE users SET onlycoins = @onlycoins WHERE identifier = @identifier', {
                ['@identifier'] = rs[1].identifier,
                ['@onlycoins'] = rs[1].onlycoins + tonumber(args[2])
            })

            sendLog(('Achat coins boutique (%s - %s) (%s) '):format('CONSOLE (GIVE)', args[1], args[2]), {
                author = xPlayer.name,
                fields = {
                    {title = 'Joueur', subtitle = 'CONSOLE (GIVE)'},
                    {title = 'ID Unique', subtitle = args[1]},
                    {title = 'Identifier', subtitle = 'CONSOLE (GIVE)'},
                    {title = 'Coins', subtitle = args[2]}
                },
                channel = 'coins_buy_boutique'
            })
        end)
    end
end)

RegisterNetEvent('zmain:boutique:sendReward', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local player = GetPlayerById(source)

    MySQL.Async.execute('UPDATE users SET boutiquereward = @boutiquereward, onlycoins = @onlycoins WHERE UniqueID = @UniqueID', {
        ['@UniqueID'] = xPlayer.UniqueID,
        ['@boutiquereward'] = true,
        ['@onlycoins'] = 500
    }, function()
        player.reward = true

        player.setCoins(500)

        TriggerClientEvent('boutique:update', xPlayer.source, player.getCoins(), player.getUsedCoins(), player.getRecompense())

        ESX.Notifi(source, 'Vous venez de récupéré votre cadeau de la boutique ~b~(500 coins)~s~')
    end)
end)