-- _G.Anticheat = Anticheat or {}

-- Anticheat.byPass = false

-- Anticheat.bypassESX = {
--     ['fondateur'] = true,
--     ['superadmin'] = true,
--     ['gerant'] = true,
--     ['responsable'] = true,
--     ['administrateur'] = true,
--     ['moderateur'] = true,
--     ['helpeur'] = true
-- }

-- Anticheat.antiGodMod = {
--     active = true
-- }

-- Anticheat.ANTI_FREECAM = {
--     active = true
-- }

-- Anticheat.BlacklistVehicle = {
--     active = true,
--     list = {
--         'rhino',
--         'blimp',
--         'blimp2',
--         'blimp3',
--     }
-- }

-- Anticheat.antiSpectate = {
--     Active = true
-- }

-- Anticheat.antiTextureStream = {
--     active = false,
--     TextureName = {
--         'tamerelapute',
--         'helicopterhud',
--         'deadline',
--         --'shopui_title_sm_hangar',
--         'rampage_tr_main', -- rampage menu
--         'digitaloverlay',
--         'setMenuProperty',
--         'bobylebg',
--         'mpmissmarkers256',
--         'titleBackgroundSprite.dict',
--         'titleBackgroundSprite',
--         'meow',
--         'meow2', -- Menu js 
--         'hunting',
--         'shopui_title_graphics_franklin',
--         'rk36Zr2W8ONhMfo7UavTQ.dict',
--         'rk36Zr2W8ONhMfo7UavTQ.text',
--         'leaderboard_car_colour_bg',
--         'titleBackgroundSprite.name',
--         'textureDict',
--         'txtRatio',
--         'screenX',
--         'screenY',
--         'heisthud',
--         'main_gradient',
--         'leaderboard_players_icon',
--         'mparrow',
--         'pilotschool',
--         'hudarrow',
--         'JTD.dict',
--         'JTD.text',
--         '0xE7FFAE5EBF23D890',
--         'ISMMENU',
--         'ISMMENUHeader',
--         'ISMMENULogo',
--         'corona_shade',
--         'timerbar_sr',
--         'timer_cross',
--         'timer_tick',
--         'header',
--         'subTitlebackground',
--         'bottomsubTitlebackground',
--         'subTitleText',
--         'self_pedchanger',
--         'veh_nextsprite',
--         'wep_ped',
--         'srange_gen',
--         'hit_cross',
--         '0xE7FFAE5EBF23D890',
--         'Invoke',
--         'cock_moscow',
--         'menu_gif',
--         'hud_lock',
--         'hud_corner',
--         'cockmenuuu',
--         'loadhack',
--         'mpentry',
--         'mp_modenotselected_gradient',
--         'shared',
--         'menuarrow_32',
--         'mp_modeselected_gradient',
--         'REAPER2',
--         'REAPER3',
--         'REAPER8',
--         'REAPER10',
--         'REAPER6',
--         'REAPER7',
--         'REAPER5',
--         'lhs_bg',
--         'REAPER23',
--         'REAPER24',
--         'REAPER16',
--         'REAPER15',
--         'mprankbadge',
--         'globe_bg',
--         'REAPER21',
--         'REAPER22',
--         'REAPER20',
--         'REAPER19',
--         'REAPER18',
--         'REAPER17',
--         'REAPER14',
--         'REAPER13',
--         'REAPER12',
--         'REAPER11',
--         'REAPER9',
--         'REAPER4',
--         'REAPER1',
--         'deadline_trail_01',
--         'currentMenu',
--         'HugeWare_SDGUHSFDIGDFG',
--         'textureDict_SDGHSIUDGSDG',
--         'leaderboard_voteblank_icon',
--         'spectating',
--         'mpweaponsgang1',
--         'HydroMenu',
--         'HydroMenuHeader',
--         'HydroMenuLogo',
--         'shared',
--         'info_icon_32',
--         'TxtDict',
--         'TxtName',
--         'DrawPlayerInfo',
--         'TxtDictionary',
--         'hud_outline',
--         'TiagoMenu',
--         'hits_dot',
--         'MButtonSpriteScale_DSGJHSDIGSDG',
--         'John',
--         'John2',
--         'leaderboard_players_icon',
--         'leaderboard_deaths_icon',
--         'leaderboard_kills_icon',
--         'leaderboard_transport_car_icon',
--         'leaderboard_friends_icon',
--         'leaderboard_globe_icon',
--         'wave',
--         'logo',
--         'ip',
--         'pnj',
--         'custompistolW',
--         'pistolW',
--         'Glife',
--         'Money',
--         'arme',
--         'createvehicule',
--         'OverLateMENU',
--         'OverLateMENUHeader',
--         'MenyooExtras',
--     }
-- }

-- Anticheat.AntiThermalVision = {
--     active = true
-- }

-- Anticheat.AntiNightVision = {
--     active = true
-- }

-- Anticheat.antistopResource = {
--     active = true,
--     resourceList = {
        
--     }
-- }

-- Anticheat.Translation = {
--     GOD_MOD = 'Anti GodMod',
--     ANTI_FREECAM = 'Anti Freecam',
--     BLACKLIST_VEHICLE = 'Spawn blacklisted vehicle (%s)',
--     ANTI_SPECTATE = 'Anti spectator mod',
--     ANTI_TEXTURESTREAM = 'Anti texture stream',
--     ANTI_THERMALVISION = 'Anti thermmal vision',
--     ANTI_NIGHTVISION = 'Anti night vision',
--     ANTI_STOP = 'Tried to stop (%s)'
-- }

-- function Anticheat.Translate(data)
--     return Anticheat.Translation[data] or ('translation %s invalid'):format(data)
-- end

-- CreateThread(function()
--     while not ESXLoaded do Wait(1) end

--     Config_Logs['ANTI_FREECAM'] = 'https://discord.com/api/webhooks/1137435288055070781/q6T7SfOmlY8QIGN_OCtpfNDc_Zxu5zpoUDf7l6MYqg8Pg6Jx0LmCHKF9SCZTZE8a8Hkg'
-- end)