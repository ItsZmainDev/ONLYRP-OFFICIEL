Config = {}
Translation = {}

Config.Shopkeeper = 416176080 -- hash of the shopkeeper ped
Config.Locale = 'en' -- 'en', 'sv' or 'custom'

Config.Shops = {
	    {coords = vector3(372.569, 326.416, 103.566-0.98), heading = 255.055, money = {3500, 7000}, cops = 2, blip = true, name = '7/11', cooldown = {hour = 0, minute = 0, second = 7200}, robbed = false},
        {coords = vector3(-1221.894, -908.247, 12.326-0.98), heading = 19.9710, money = {3500, 7000}, cops = 2, blip = true, name = '7/11', cooldown = {hour = 0, minute = 0, second = 7200}, robbed = false},
        {coords = vector3(1164.861, -323.701, 69.205-0.98), heading = 89.2940, money = {3500, 7000}, cops = 2, blip = true, name = '7/11', cooldown = {hour = 0, minute = 0, second = 7200}, robbed = false},
        {coords = vector3(-47.287, -1758.673, 29.421-0.98), heading = 44.347, money = {3500, 7000}, cops = 2, blip = true, name = '7/11', cooldown = {hour = 0, minute = 0, second = 7200}, robbed = false},
        {coords = vector3(24.03, -1345.63, 29.5-0.98), heading = 266.0, money = {3500, 7000}, cops = 2, blip = true, name = '7/11', cooldown = {hour = 0, minute = 0, second = 7200}, robbed = false},
        {coords = vector3(-705.73, -914.91, 19.22-0.98), heading = 91.0, money = {3500, 7000}, cops = 2, blip = true, name = '7/11', cooldown = {hour = 0, minute = 0, second = 7200}, robbed = false}

}

Translation = {
    ['en'] = {
        ['shopkeeper'] = 'Boutique',
        ['robbed'] = "Je viens de me faire voler ~r~mon argent!",
        ['cashrecieved'] = 'Tu as reçu :',
        ['currency'] = '$',
        ['scared'] = 'Peur:',
        ['no_cops'] = 'Pas assez de Policier',
        ['cop_msg'] = 'Alarme automatique CCTV activée!',
        ['set_waypoint'] = 'Le point d entrée du magazine a été ajusté',
        ['hide_box'] = 'Ferme la boite',
        ['robbery'] = 'Le vol continue',
        ['walked_too_far'] = 'Éloignez-vous du froid!'
    },
    ['sv'] = {
        ['shopkeeper'] = 'butiksbiträde',
        ['robbed'] = 'Jag blev precis rånad och har inga pengar kvar!',
        ['cashrecieved'] = 'Du fick:',
        ['currency'] = 'SEK',
        ['scared'] = 'Rädd:',
        ['no_cops'] = 'Det är inte tillräckligt med poliser online!',
        ['cop_msg'] = 'Vi har skickat en bild på rånaren från övervakningskamerorna!',
        ['set_waypoint'] = 'Sätt GPS punkt på butiken',
        ['hide_box'] = 'Stäng denna rutan',
        ['robbery'] = 'Pågående butiksrån',
        ['walked_too_far'] = 'Du gick för långt bort!'
    },
    ['custom'] = { -- edit this to your language
        ['shopkeeper'] = '',
        ['robbed'] = '',
        ['cashrecieved'] = '',
        ['currency'] = '',
        ['scared'] = '',
        ['no_cops'] = '',
        ['cop_msg'] = '',
        ['set_waypoint'] = '',
        ['hide_box'] = '',
        ['robbery'] = '',
        ['walked_too_far'] = ''
    }
}

