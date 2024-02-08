sendWebhook = function(message, color)
	PerformHttpRequest(Jails.Logs.Webhook, function(err, text, headers) end, 'POST', json.encode
    ({
        username = Jails.Settings.ServerName, 
        embeds = {
            {
                ["color"] = Jails.Logs.WebhookColor,
                ["title"] = Jails.Settings.ServerName,
                ["description"] = message
            }
        }, 
    }), { 
        ['Content-Type'] = 'application/json' 
    })
end