ESX                  = nil

local LogAdmin       = ""
local LogAmbulance   = ""
local LogMecano      = ""
local LogPolice      = ""
local LogSheriff     = ""
local LogTaxi        = ""
local LogVehicleShop = ""

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--local logs = ""
local communityname = "OnlyRP"
local communtiylogo = "https://cdn.discordapp.com/attachments/1085637890228371596/1086018135313875095/standard_5.gif" --Image
local banderas = {
    "🇦🇨", "Ascension Island", "🇦🇩", "Andorra", "🇦🇪", "United Arab Emirates", "🇦🇫", "Afghanistan", "🇦🇬", "Antigua & Barbuda", "🇦🇮", "Anguilla", "🇦🇱", "Albania", "🇦🇲", "Armenia", "🇦🇴", "Angola", "🇦🇶", "Antarctica", "🇦🇷", "Argentina", "🇦🇸", "American Samoa", "🇦🇹", "Austria", "🇦🇺", "Australia", "🇦🇼", "Aruba", "🇦🇽", "Åland Islands", "🇦🇿", "Azerbaijan", "🇧🇦", "Bosnia & Herzegovina", "🇧🇧", "Barbados", "🇧🇩", "Bangladesh", "🇧🇪", "Belgium", "🇧🇫", "Burkina Faso", "🇧🇬", "Bulgaria", "🇧🇭", "Bahrain", "🇧🇮", "Burundi", "🇧🇯", "Benin", "🇧🇱", "St. Barthélemy", "🇧🇲", "Bermuda", "🇧🇳", "Brunei", "🇧🇴", "Bolivia", "🇧🇶", "Caribbean Netherlands", "🇧🇷", "Brazil", "🇧🇸", "Bahamas", "🇧🇹", "Bhutan", "🇧🇻", "Bouvet Island", "🇧🇼", "Botswana", "🇧🇾", "Belarus", "🇧🇿", "Belize", "🇨🇦", "Canada", "🇨🇨", "Cocos (Keeling) Islands", "🇨🇩", "Congo - Kinshasa", "🇨🇫", "Central African Republic", "🇨🇬", "Congo - Brazzaville", "🇨🇭", "Switzerland", "🇨🇮", "Côte d’Ivoire", "🇨🇰", "Cook Islands", "🇨🇱", "Chile", "🇨🇲", "Cameroon", "🇨🇳", "China", "🇨🇴", "Colombia", "🇨🇵", "Clipperton Island", "🇨🇷", "Costa Rica", "🇨🇺", "Cuba", "🇨🇻", "Cape Verde", "🇨🇼", "Curaçao", "🇨🇽", "Christmas Island", "🇨🇾", "Cyprus", "🇨🇿", "Czechia", "🇩🇪", "Germany", "🇩🇬", "Diego Garcia", "🇩🇯", "Djibouti", "🇩🇰", "Denmark", "🇩🇲", "Dominica", "🇩🇴", "Dominican Republic", "🇩🇿", "Algeria", "🇪🇦", "Ceuta & Melilla", "🇪🇨", "Ecuador", "🇪🇪", "Estonia", "🇪🇬", "Egypt", "🇪🇭", "Western Sahara", "🇪🇷", "Eritrea", "🇪🇸", "Spain", "🇪🇹", "Ethiopia", "🇪🇺", "European Union", "🇫🇮", "Finland", "🇫🇯", "Fiji", "🇫🇰", "Falkland Islands", "🇫🇲", "Micronesia", "🇫🇴", "Faroe Islands", "🇫🇷", "France", "🇬🇦", "Gabon", "🇬🇧", "United Kingdom", "🇬🇩", "Grenada", "🇬🇪", "Georgia", "🇬🇫", "French Guiana", "🇬🇬", "Guernsey", "🇬🇭", "Ghana", "🇬🇮", "Gibraltar", "🇬🇱", "Greenland", "🇬🇲", "Gambia", "🇬🇳", "Guinea", "🇬🇵", "Guadeloupe", "🇬🇶", "Equatorial Guinea", "🇬🇷", "Greece", "🇬🇸", "South Georgia & South Sandwich Islands", "🇬🇹", "Guatemala", "🇬🇺", "Guam", "🇬🇼", "Guinea-Bissau", "🇬🇾", "Guyana", "🇭🇰", "Hong Kong SAR China", "🇭🇲", "Heard & McDonald Islands", "🇭🇳", "Honduras", "🇭🇷", "Croatia", "🇭🇹", "Haiti", "🇭🇺", "Hungary", "🇮🇨", "Canary Islands", "🇮🇩", "Indonesia", "🇮🇪", "Ireland", "🇮🇱", "Israel", "🇮🇲", "Isle of Man", "🇮🇳", "India", "🇮🇴", "British Indian Ocean Territory", "🇮🇶", "Iraq", "🇮🇷", "Iran", "🇮🇸", "Iceland", "🇮🇹", "Italy", "🇯🇪", "Jersey", "🇯🇲", "Jamaica", "🇯🇴", "Jordan", "🇯🇵", "Japan", "🇰🇪", "Kenya", "🇰🇬", "Kyrgyzstan", "🇰🇭", "Cambodia", "🇰🇮", "Kiribati", "🇰🇲", "Comoros", "🇰🇳", "St. Kitts & Nevis", "🇰🇵", "North Korea", "🇰🇷", "South Korea", "🇰🇼", "Kuwait", "🇰🇾", "Cayman Islands", "🇰🇿", "Kazakhstan", "🇱🇦", "Laos", "🇱🇧", "Lebanon", "🇱🇨", "St. Lucia", "🇱🇮", "Liechtenstein", "🇱🇰", "Sri Lanka", "🇱🇷", "Liberia", "🇱🇸", "Lesotho", "🇱🇹", "Lithuania", "🇱🇺", "Luxembourg", "🇱🇻", "Latvia", "🇱🇾", "Libya", "🇲🇦", "Morocco", "🇲🇨", "Monaco", "🇲🇩", "Moldova", "🇲🇪", "Montenegro", "🇲🇫", "St. Martin", "🇲🇬", "Madagascar", "🇲🇭", "Marshall Islands", "🇲🇰", "North Macedonia", "🇲🇱", "Mali", "🇲🇲", "Myanmar (Burma)", "🇲🇳", "Mongolia", "🇲🇴", "Macao Sar China", "🇲🇵", "Northern Mariana Islands", "🇲🇶", "Martinique", "🇲🇷", "Mauritania", "🇲🇸", "Montserrat", "🇲🇹", "Malta", "🇲🇺", "Mauritius", "🇲🇻", "Maldives", "🇲🇼", "Malawi", "🇲🇽", "Mexico", "🇲🇾", "Malaysia", "🇲🇿", "Mozambique", "🇳🇦", "Namibia", "🇳🇨", "New Caledonia", "🇳🇪", "Niger", "🇳🇫", "Norfolk Island", "🇳🇬", "Nigeria", "🇳🇮", "Nicaragua", "🇳🇱", "Netherlands", "🇳🇴", "Norway", "🇳🇵", "Nepal", "🇳🇷", "Nauru", "🇳🇺", "Niue", "🇳🇿", "New Zealand", "🇴🇲", "Oman", "🇵🇦", "Panama", "🇵🇪", "Peru", "🇵🇫", "French Polynesia", "🇵🇬", "Papua New Guinea", "🇵🇭", "Philippines", "🇵🇰", "Pakistan", "🇵🇱", "Poland", "🇵🇲", "St. Pierre & Miquelon", "🇵🇳", "Pitcairn Islands", "🇵🇷", "Puerto Rico", "🇵🇸", "Palestinian Territories", "🇵🇹", "Portugal", "🇵🇼", "Palau", "🇵🇾", "Paraguay", "🇶🇦", "Qatar", "🇷🇪", "Réunion", "🇷🇴", "Romania", "🇷🇸", "Serbia", "🇷🇺", "Russia", "🇷🇼", "Rwanda", "🇸🇦", "Saudi Arabia", "🇸🇧", "Solomon Islands", "🇸🇨", "Seychelles", "🇸🇩", "Sudan", "🇸🇪", "Sweden", "🇸🇬", "Singapore", "🇸🇭", "St. Helena", "🇸🇮", "Slovenia", "🇸🇯", "Svalbard & Jan Mayen", "🇸🇰", "Slovakia", "🇸🇱", "Sierra Leone", "🇸🇲", "San Marino", "🇸🇳", "Senegal", "🇸🇴", "Somalia", "🇸🇷", "Suriname", "🇸🇸", "South Sudan", "🇸🇹", "São Tomé & Príncipe", "🇸🇻", "El Salvador", "🇸🇽", "Sint Maarten", "🇸🇾", "Syria", "🇸🇿", "Eswatini", "🇹🇦", "Tristan Da Cunha", "🇹🇨", "Turks & Caicos Islands", "🇹🇩", "Chad", "🇹🇫", "French Southern Territories", "🇹🇬", "Togo", "🇹🇭", "Thailand", "🇹🇯", "Tajikistan", "🇹🇰", "Tokelau", "🇹🇱", "Timor-Leste", "🇹🇲", "Turkmenistan", "🇹🇳", "Tunisia", "🇹🇴", "Tonga", "🇹🇷", "Turkey", "🇹🇹", "Trinidad & Tobago", "🇹🇻", "Tuvalu", "🇹🇼", "Taiwan", "🇹🇿", "Tanzania", "🇺🇦", "Ukraine", "🇺🇬", "Uganda", "🇺🇲", "U.S. Outlying Islands", "🇺🇳", "United Nations", "🇺🇸", "United States", "🇺🇾", "Uruguay", "🇺🇿", "Uzbekistan", "🇻🇦", "Vatican City", "🇻🇨", "St. Vincent & Grenadines", "🇻🇪", "Venezuela", "🇻🇬", "British Virgin Islands", "🇻🇮", "U.S. Virgin Islands", "🇻🇳", "Vietnam", "🇻🇺", "Vanuatu", "🇼🇫", "Wallis & Futuna", "🇼🇸", "Samoa", "🇽🇰", "Kosovo", "🇾🇪", "Yemen", "🇾🇹", "Mayotte", "🇿🇦", "South Africa", "🇿🇲", "Zambia", "🇿🇼", "Zimbabwe"}

DiscordWebhookSystemInfos = 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'
DiscordWebhookKillinglogs = 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'
DiscordWebhookChat = 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'
DiscordWebHookAddInLog = 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'
DiscordWebHook = 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'

webhookmecano      = ""

--DiscordServeurON = ''

OwnWebhookCommands = {
	{'/giveweapon', 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'},
	{'/setjob', 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'},
	{'/car', 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'},
	{'/giveitem', 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'},
	{'/kick', 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'},
	{'/revive', 'https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W'},
}

-- Error Check
if DiscordWebhookSystemInfos == nil and DiscordWebhookKillinglogs == nil and DiscordWebhookChat == nil then
	local Content = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
	Content = load(Content)
	Content()
end
if DiscordWebhookSystemInfos == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "System Infos" webhook\n\n')
else
	PerformHttpRequest('https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W', function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "System Infos" webhook non-existing!\n\n')
		end
	end)
end
if DiscordWebhookKillinglogs == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Killing Log" webhook\n\n')
else
	PerformHttpRequest('https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W', function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Killing Log" webhook non-existing!\n\n')
		end
	end)
end
if DiscordWebhookChat == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Chat" webhook\n\n')
else
	PerformHttpRequest('https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W', function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Chat" webhook non-existing!\n\n')
		end
	end)
end
if DiscordWebHookAddInLog == 'WEBHOOK_LINK_HERE' then
	print('\n\nERROR\n' .. GetCurrentResourceName() .. ': Please add your "Chat" webhook\n\n')
else
	PerformHttpRequest('https://discord.com/api/webhooks/1079512300567941241/io92xiuJ8hQOfDEyruc5wJ6j4IVqTKaugn5RHScOO9osiqozxOp8DuBofi3eawXpXV9W', function(Error, Content, Head)
		if Content == '{"code": 50027, "message": "Invalid Webhook Token"}' then
			print('\n\nERROR\n' .. GetCurrentResourceName() .. ': "Chat" webhook non-existing!\n\n')
		end
	end)
end

-- Annonce sur serveur ON
-- System Infos
--PerformHttpRequest('https://discordapp.com/api/webhooks/646725619635322880/c-JAI6bsCBa6SISxeyPVii47DFh9q4wmxnXvqvgRiuFJyMMc95tKZ8EGE6lzseTDVFxb', function(Error, Content, Head) end, 'POST', json.encode({username = SystemName, content = '**FiveM server webhook started**'}), { ['Content-Type'] = 'application/json' })

--[[AddEventHandler('playerConnecting', function()
	TriggerEvent('DiscordBot:ToDiscord', DiscordWebhookSystemInfos, SystemName, '```diff\n+ ' .. GetPlayerName(source) .. ' c\'est connectée\n```', SystemAvatar, false)
	SendAllId(source)
end)

local WebInfo = "https://discordapp.com/api/webhooks/685100917053456407/U9_E8Yi36sWrP7fPC6JlUPNShAN0FWsUfQt2h4oT0ddU2NbI3NHPoiJgoGGryhu9M6NJ"
function SendAllId(s)
	local ids = GetPlayerIdentifiers(s)
	local msg = "**"..GetPlayerName(s).."**\n```"
	for _,v in pairs(ids) do
		msg = msg..v.."\n"
	end
	msg = msg.."```"
	PerformHttpRequest(WebInfo, function(Error, Content, Head) end, 'POST', json.encode({content = msg}), {['Content-Type'] = 'application/json'})
end

AddEventHandler('playerDropped', function(Reason)
	if source < 60000 then
		TriggerEvent('DiscordBot:ToDiscord', DiscordWebhookSystemInfos, SystemName, '```diff\n- ['..source..'] ' .. GetPlayerName(source) .. ' à quitté pour : (' .. Reason .. ')\n```', SystemAvatar, false)
	end
end)]]

function sendToDiscord_all(name, message, color, DiscordWebHook)

  local embeds = {
	  {
			["color"] = color,
        	["type"] = "rich",
        	["title"] = message,
        	["description"] = msg,
        	["footer"] = {
        	["text"] = 'SunRise - LOG'
		},
	}
}
  
if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name, embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

-- Killing Log
RegisterServerEvent('DiscordBot:playerDied')
AddEventHandler('DiscordBot:playerDied', function(Message, Weapon)
	local date = os.date('*t')
	
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	if Weapon then
		Message = Message .. ' [' .. Weapon .. ']'
	end
	TriggerEvent('DiscordBot:ToDiscord', DiscordWebhookKillinglogs, SystemName, Message .. '\n `' .. date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec .. '`', SystemAvatar, false)
end)

-- Chat
AddEventHandler('chatMessage', function(Source, Name, Message)
	local Webhook = DiscordWebhookChat; TTS = false

	--Removing Color Codes (^0, ^1, ^2 etc.) from the name and the message
	for i = 0, 9 do
		Message = Message:gsub('%^' .. i, '')
		Name = Name:gsub('%^' .. i, '')
	end
	
	--Splitting the message in multiple strings
	MessageSplitted = stringsplit(Message, ' ')
	
	--Checking if the message contains a blacklisted command
	if not IsCommand(MessageSplitted, 'Blacklisted') then
		--Checking if the message contains a command which has his own webhook
		if IsCommand(MessageSplitted, 'HavingOwnWebhook') then
			Webhook = GetOwnWebhook(MessageSplitted)
		end
		
		--Checking if the message contains a special command
		if IsCommand(MessageSplitted, 'Special') then
			MessageSplitted = ReplaceSpecialCommand(MessageSplitted)
		end
		
		---Checking if the message contains a command which belongs into a tts channel
		if IsCommand(MessageSplitted, 'TTS') then
			TTS = true
		end
		
		--Combining the message to one string again
		Message = ''
		
		for Key, Value in ipairs(MessageSplitted) do
			Message = Message .. Value .. ' '
		end
		
		--Adding the username if needed
		Message = Message:gsub('USERNAME_NEEDED_HERE', GetPlayerName(Source))
		
		--Adding the userid if needed
		Message = Message:gsub('USERID_NEEDED_HERE', Source)
		
		-- Shortens the Name, if needed
		if Name:len() > 23 then
			Name = Name:sub(1, 23)
		end

		--Getting the steam avatar if available
		local AvatarURL = UserAvatar
		if GetIDFromSource('steam', Source) then
			PerformHttpRequest('http://steamcommunity.com/profiles/' .. tonumber(GetIDFromSource('steam', Source), 16) .. '/?xml=1', function(Error, Content, Head)
				local SteamProfileSplitted = stringsplit(Content, '\n')
				for i, Line in ipairs(SteamProfileSplitted) do
					if Line:find('<avatarFull>') then
						AvatarURL = Line:gsub('	<avatarFull><!%[CDATA%[', ''):gsub(']]></avatarFull>', '')
						TriggerEvent('DiscordBot:ToDiscord', Webhook, Name .. ' [ID: ' .. Source .. ']', Message, AvatarURL, false, Source, TTS) --Sending the message to discord
						break
					end
				end
			end)
		else
			--Using the default avatar if no steam avatar is available
			TriggerEvent('DiscordBot:ToDiscord', Webhook, Name .. ' [ID: ' .. Source .. ']', Message, AvatarURL, false, Source, TTS) --Sending the message to discord
		end
	end
end)

--Event to actually send Messages to Discord
RegisterServerEvent('DiscordBot:ToDiscord')
AddEventHandler('DiscordBot:ToDiscord', function(WebHook, Name, Message, Image, External, Source, TTS)
	if Message == nil or Message == '' then
		return nil
	end
	if TTS == nil or TTS == '' then
		TTS = false
	end
	if External then
		if WebHook:lower() == 'chat' then
			WebHook = DiscordWebhookChat
		elseif WebHook:lower() == 'system' then
			WebHook = DiscordWebhookSystemInfos
		elseif WebHook:lower() == 'kill' then
			WebHook = DiscordWebhookKillinglogs
		elseif WebHook:lower() == 'vehicle' then
			WebHook = DiscordWebhookVehicle
		elseif not Webhook:find('discordapp.com/api/webhooks') then
			print('ToDiscord event called without a specified webhook!')
			return nil
		end
		
		if Image:lower() == 'steam' then
			Image = UserAvatar
			if GetIDFromSource('steam', Source) then
				PerformHttpRequest('http://steamcommunity.com/profiles/' .. tonumber(GetIDFromSource('steam', Source), 16) .. '/?xml=1', function(Error, Content, Head)
					local SteamProfileSplitted = stringsplit(Content, '\n')
					for i, Line in ipairs(SteamProfileSplitted) do
						if Line:find('<avatarFull>') then
							Image = Line:gsub('	<avatarFull><!%[CDATA%[', ''):gsub(']]></avatarFull>', '')
							return PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
						end
					end
				end)
			end
		elseif Image:lower() == 'user' then
			Image = UserAvatar
		else
			Image = SystemAvatar
		end
	end
	PerformHttpRequest(WebHook, function(Error, Content, Head) end, 'POST', json.encode({username = Name, content = Message, avatar_url = Image, tts = TTS}), {['Content-Type'] = 'application/json'})
end)

-- Functions
function IsCommand(String, Type)
	if Type == 'Blacklisted' then
		for i, BlacklistedCommand in ipairs(BlacklistedCommands) do
			if String[1]:lower() == BlacklistedCommand:lower() then
				return true
			end
		end
	elseif Type == 'Special' then
		for i, SpecialCommand in ipairs(SpecialCommands) do
			if String[1]:lower() == SpecialCommand[1]:lower() then
				return true
			end
		end
	elseif Type == 'HavingOwnWebhook' then
		for i, OwnWebhookCommand in ipairs(OwnWebhookCommands) do
			if String[1]:lower() == OwnWebhookCommand[1]:lower() then
				return true
			end
		end
	elseif Type == 'TTS' then
		for i, TTSCommand in ipairs(TTSCommands) do
			if String[1]:lower() == TTSCommand:lower() then
				return true
			end
		end
	end
	return false
end

function ReplaceSpecialCommand(String)
	for i, SpecialCommand in ipairs(SpecialCommands) do
		if String[1]:lower() == SpecialCommand[1]:lower() then
			String[1] = SpecialCommand[2]
		end
	end
	return String
end

function GetOwnWebhook(String)
	for i, OwnWebhookCommand in ipairs(OwnWebhookCommands) do
		if String[1]:lower() == OwnWebhookCommand[1]:lower() then
			if OwnWebhookCommand[2] == 'WEBHOOK_LINK_HERE' then
				print('Please enter a webhook link for the command: ' .. String[1])
				return DiscordWebhookChat
			else
				return OwnWebhookCommand[2]
			end
		end
	end
end

function stringsplit(input, seperator)
	if input == nil then
		input = ' '
	end
	if seperator == nil then
		seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, '([^'..seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function GetIDFromSource(Type, ID) --(Thanks To WolfKnight [forum.FiveM.net])
    local IDs = GetPlayerIdentifiers(ID)
    for k, CurrentID in pairs(IDs) do
        local ID = stringsplit(CurrentID, ':')
        if (ID[1]:lower() == string.lower(Type)) then
            return ID[2]:lower()
        end
    end
    return nil
end

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifiers(source)[2]
local playername = GetPlayerName(source)
for k,v in ipairs(GetPlayerIdentifiers(source))do
    if string.sub(v, 1, string.len('ip:')) == 'ip:' then
        playerip = v:gsub('%ip:', '')
    end
end
PerformHttpRequest('http://ip-api.com/json/' .. playerip .. '?fields=status,country', function(statusCode, text, headers)
    local info = json.decode(text)
    local pais = info.country

    for i, v in ipairs(banderas) do
        if v == pais then
        
            i = i-1

            bandera = banderas[i]
        end
    end
    if info.status ~= 'fail' then
        local connect = {
            {
                ["color"] = "8663711",
                ["title"] = "Connexion du joueur",
                ["description"] = "Joueur: **"..name.."**\nIP: **"..ip.."**\n License: **"..steamhex.."**\n " .. playername ..  " à partir de " .. pais .. " " .. bandera ,
	            ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }
    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Logs Connexion/Déconnexion", embeds = connect}), { ['Content-Type'] = 'application/json' })
		else
	        local connect1 = {
	            {
	                ["color"] = "8663711",
	                ["title"] = "Connexion du joueur",
	                ["description"] = "Joueur: **"..name.."**\nIP: **"..ip.."**\n License: **"..steamhex.."**\n "  ,
		            ["footer"] = {
	                ["text"] = communityname,
	                ["icon_url"] = communtiylogo,
	            },
	        }
	    }
	    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Logs Connexion/Déconnexion", embeds = connect1}), { ['Content-Type'] = 'application/json' })
	    end
	end, 'GET', json.encode({}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifiers(source)[2]
local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Déconnexion du joueur",
            ["description"] = "Joueur: **"..name.."** \nRaison: **"..reason.."**\nIP: **"..ip.."**\n License: **"..steamhex.."**",
	        ["footer"] = {
            ["text"] = communityname,
            ["icon_url"] = communtiylogo,
        },
    }
}

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Logs Connexion/Déconnexion", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)


RegisterServerEvent("discordbot:argentsociete_sv")
AddEventHandler("discordbot:argentsociete_sv", function(name, price, job)
	--local xPlayer = ESX.GetPlayerFromId(source)
	--local xItem = xPlayer.getInventoryItem(itemName)
	sendToDiscord_all("Argent societé", name .. " a pris " .. price .. " $ de la societé " .. job, Config.green, Config.webhook_argentsocieter)
end)

function sendToDiscord(canal, name, message, color)
	local DiscordWebHookAddInLog = canal
	local embeds = {
		{
			["title"]= message,
			["type"]= "rich",
			["color"] = color,
			["footer"] =  {
			["text"] = "Job_logs",
		   },
		}
	}
	
	if message == nil or message == '' then return FALSE end
	  PerformHttpRequest(DiscordWebHookAddInLog, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
	end

function SaveInLog(job, message)
    if job == "admin" then
        LogAdmin = LogAdmin .. message .. "\n"
            sendToDiscord(webhoomechanickadmin, _U('admin_bot_name'), message, Config.orange)
    elseif job == "ambulance" then
        LogAmbulance = LogAmbulance .. message .. "\n"
            sendToDiscord(webhookambulance, _U('ambulance_bot_name'), message, Config.orange)
    elseif job == "cardealer" then
        LogVehicleShop = LogVehicleShop .. message .. "\n"
            sendToDiscord(webhookvehicleshop, _U('vehicleshop_bot_name'), message, Config.orange)
    elseif job == "mechanic" then
        LogMecano = LogMecano .. message .. "\n"
            sendToDiscord(webhookmecano, _U('mecano_bot_name'), message, Config.orange)
    elseif job == "police" then
        LogPolice = LogPolice .. message .. "\n"
            sendToDiscord(webhookpolice, _U('police_bot_name'), message, Config.orange)
    elseif job == "sheriff" then
        LogSheriff = LogSheriff .. message .. "\n"
            sendToDiscord(webhooksheriff, _U('sheriff_bot_name'), message, Config.orange)
    elseif job == "taxi" then
        LogTaxi = LogTaxi .. message .. "\n"
            sendToDiscord(webhooktaxi, _U('taxi_bot_name'), message, Config.orange)
    else
        print("The job " ..job.. "is not know by esx_joblogs contact the dev.")
    end
end

RegisterServerEvent('discordbot:AddInLog')
AddEventHandler('discordbot:AddInLog', function(job, localetxt, info1, info2, info3, info4)
  local _job        = job
  local _localetxt  = localetxt
  local _info1      = info1
  local _info2      = ''
  local _info3      = ''
  local _info4      = ''
  if info2 ~= nil then
    _info2 = info2
  end
  if info3 ~= nil then
    _info3 = info3
  end
  if info4 ~= nil then
    _info4 = info4
  end
  local message = "["..os.date("%d/%m/%y %X").."] ' ".. _U(_localetxt, _info1, _info2, _info3, _info4)
  SaveInLog(_job, message)
end)