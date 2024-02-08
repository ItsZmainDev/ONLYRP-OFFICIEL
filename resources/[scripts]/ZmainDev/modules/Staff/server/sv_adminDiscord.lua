PerformHttpRequest('http://https://discord.com/api/oauth2/authorize?client_id=1085309489764380753&permissions=8&scope=bot/revivee/callback', function(statusCode, text, headers)
    print('testt')
end, 'POST', json.encode({}), { ['Content-Type'] = 'application/json' })