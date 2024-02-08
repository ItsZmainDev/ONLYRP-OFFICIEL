function ESX.Translate(language, str)
    if str == nil then return 'Invalid translation ['..str..']' end
    fileContent = LoadResourceFile(GetCurrentResourceName(), ("%s.json"):format(language))

    if fileContent == nil then return 'Invalid translation ['..language..']' end

    local locales <const> = json.decode(fileContent)

    if locales[str] == nil then return 'Invalid translation ['..str..']' end

    return locales[str]
end

AddEventHandler('esx:translation', function(language, str, cb)
    cb(ESX.Translate(language, str))
end)