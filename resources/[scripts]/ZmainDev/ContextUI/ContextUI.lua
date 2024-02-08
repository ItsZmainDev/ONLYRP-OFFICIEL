---
--- @author Dylan MALANDAIN, Kalyptus
--- @version 1.0.0
--- File created at [26/05/2021 10:22]
---

local Settings = {
    Button = {
        Width = 220,
        Height = 32,
        Background = {
            { 0, 0, 0, 100 },
            { 18, 23, 55, 240 }
        }
    },
    Text = {
        Colors = {
            { 255, 255, 255, 255 },
            { 255, 255, 255, 255 }
        },
        X = 8.0,
        Y = 4.5,
        Scale = 0.26,
        Font = 0,
        Center = 0,
        Outline = false,
        DropShadow = false,
    },
    Title = {
        Background = { 18, 23, 55, 240 },
        Text = { 255, 255, 255, 255 }
    },
    Subtitle = {
        Background = { 0, 0, 0, 255 },
        Text = { 255, 255, 255, 255 }
    },
}

BadgeStyle = {
    -- DEFAULT BADGE
    None = function()
        return {
            BadgeTexture = "",
            BadgeDictionary = "commonmenu"
        }
    end,
    Coins = function()
        return {
            BadgeTexture = "shop_chips_b",
            BadgeDictionary = "commonmenu",
            BadgeColour = Selected and { R = 54, G = 159, B = 211, A = 255 } or { R = 54, G = 159, B = 211, A = 255 }
        }
    end,
    Snowflake = function()
        return {
            BadgeTexture = "Snowflake",
            BadgeDictionary = "commonmenu",
            BadgeColour = Selected and { R = 255, G = 255, B = 255, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    PainDepice = function()
        return {
            BadgeTexture = "paindepice",
            BadgeDictionary = "commonmenu",
            BadgeColour = Selected and { R = 255, G = 255, B = 255, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Sucredorge = function()
        return {
            BadgeTexture = "sucredorge",
            BadgeDictionary = "commonmenu",
            BadgeColour = Selected and { R = 255, G = 255, B = 255, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    ChristmasLogo = function()
        return {
            BadgeTexture = "christmas",
            BadgeDictionary = "commonmenu",
            BadgeColour = Selected and { R = 255, G = 255, B = 255, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    CandyRed = function()
        return {
            BadgeTexture = "candy",
            BadgeDictionary = "commonmenu",
            BadgeColour = Selected and { R = 216, G = 0, B = 0, A = 255 } or { R = 216, G = 0, B = 0, A = 255 }
        }
    end,
    CandyGreen = function()
        return {
            BadgeTexture = "candy",
            BadgeDictionary = "commonmenu",
            BadgeColour = Selected and { R = 0, G = 148, B = 0, A = 255 } or { R = 0, G = 148, B = 0, A = 255 }
        }
    end,
    CandyPurple = function()
        return {
            BadgeTexture = "candy",
            BadgeDictionary = "commonmenu",
            BadgeColour = Selected and { R = 18, G = 23, B = 55, A = 255 } or { R = 178, G = 0, B = 255, A = 255 }
        }
    end,
    BronzeMedal = function()
        return {
            BadgeTexture = "mp_medal_bronze",
        }
    end,
    GoldMedal = function()
        return {
            BadgeTexture = "mp_medal_gold",
        }
    end,
    SilverMedal = function()
        return {
            BadgeTexture = "medal_silver",
        }
    end,
    Alert = function()
        return {
            BadgeTexture = "mp_alerttriangle",
        }
    end,
    Crown = function(Selected)
        return {
            BadgeTexture = "mp_hostcrown",
            BadgeColour = Selected and { R = 0, G = 0, B = 0, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Ammo = function(Selected)
        return {
            BadgeTexture = Selected and "shop_ammo_icon_b" or "shop_ammo_icon_a",
        }
    end,
    Armour = function(Selected)
        return {
            BadgeTexture = Selected and "shop_armour_icon_b" or "shop_armour_icon_a",
        }
    end,
    Barber = function(Selected)
        return {
            BadgeTexture = Selected and "shop_barber_icon_b" or "shop_barber_icon_a",
        }
    end,
    Clothes = function(Selected)
        return {
            BadgeTexture = Selected and "shop_clothing_icon_b" or "shop_clothing_icon_a",
        }
    end,
    Franklin = function(Selected)
        return {
            BadgeTexture = Selected and "shop_franklin_icon_b" or "shop_franklin_icon_a",
        }
    end,
    Bike = function(Selected)
        return {
            BadgeTexture = Selected and "shop_garage_bike_icon_b" or "shop_garage_bike_icon_a",
        }
    end,
    Car = function(Selected)
        return {
            BadgeTexture = Selected and "shop_garage_icon_b" or "shop_garage_icon_a",
        }
    end,
    Boat = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_boat_black" or "mp_specitem_boat",
            BadgeDictionary = "mpinventory"
        }
    end,
    Heli = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_heli_black" or "mp_specitem_heli",
            BadgeDictionary = "mpinventory"
        }
    end,
    Plane = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_plane_black" or "mp_specitem_plane",
            BadgeDictionary = "mpinventory"
        }
    end,
    BoatPickup = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_boatpickup_black" or "mp_specitem_boatpickup",
            BadgeDictionary = "mpinventory"
        }
    end,
    Card = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_keycard_black" or "mp_specitem_keycard",
            BadgeDictionary = "mpinventory"
        }
    end,
    Gun = function(Selected)
        return {
            BadgeTexture = Selected and "shop_gunclub_icon_b" or "shop_gunclub_icon_a",
        }
    end,
    Heart = function(Selected)
        return {
            BadgeTexture = Selected and "shop_health_icon_b" or "shop_health_icon_a",
        }
    end,
    Makeup = function(Selected)
        return {
            BadgeTexture = Selected and "shop_makeup_icon_b" or "shop_makeup_icon_a",
        }
    end,
    Mask = function(Selected)
        return {
            BadgeTexture = Selected and "shop_mask_icon_b" or "shop_mask_icon_a",
        }
    end,
    Michael = function(Selected)
        return {
            BadgeTexture = Selected and "shop_michael_icon_b" or "shop_michael_icon_a",
        }
    end,
    Star = function()
        return {
            BadgeTexture = "shop_new_star",
        }
    end,
    Tattoo = function(Selected)
        return {
            BadgeTexture = Selected and "shop_tattoos_icon_b" or "shop_tattoos_icon_a",
        }
    end,
    Trevor = function(Selected)
        return {
            BadgeTexture = Selected and "shop_trevor_icon_b" or "shop_trevor_icon_a",
        }
    end,
    Lock = function(Selected)
        return {
            BadgeTexture = "shop_lock",
            BadgeColour = Selected and { R = 0, G = 0, B = 0, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Tick = function(Selected)
        return {
            BadgeTexture = "shop_tick_icon",
            BadgeColour = Selected and { R = 0, G = 0, B = 0, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Key = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_cuffkeys_black" or "mp_specitem_cuffkeys",
            BadgeDictionary = "mpinventory"
        }
    end,
    Coke = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_coke_black" or "mp_specitem_coke",
            BadgeDictionary = "mpinventory"
        }
    end,
    Heroin = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_heroin_black" or "mp_specitem_heroin",
            BadgeDictionary = "mpinventory"
        }
    end,
    Meth = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_meth_black" or "mp_specitem_meth",
            BadgeDictionary = "mpinventory"
        }
    end,
    Weed = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_weed_black" or "mp_specitem_weed",
            BadgeDictionary = "mpinventory"
        }
    end,
    Package = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_package_black" or "mp_specitem_package",
            BadgeDictionary = "mpinventory"
        }
    end,
    Cash = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_cash_black" or "mp_specitem_cash",
            BadgeDictionary = "mpinventory"
        }
    end,
    RP = function(Selected)
        return {
            BadgeTexture = "mp_anim_rp",
            BadgeDictionary = "mphud"
        }
    end,
    LSPD = function()
        return {
            BadgeTexture = "mpgroundlogo_cops",
            BadgeDictionary = "3dtextures"
        }
    end,
    Vagos = function()
        return {
            BadgeTexture = "mpgroundlogo_vagos",
            BadgeDictionary = "3dtextures"
        }
    end,
    Bikers = function()
        return {
            BadgeTexture = "mpgroundlogo_bikers",
            BadgeDictionary = "3dtextures"
        }
    end,

    -- CASINO
    Badbeat = function()
        return {
            BadgeTexture = "badbeat",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    CashingOut = function()
        return {
            BadgeTexture = "cashingout",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    FullHouse = function()
        return {
            BadgeTexture = "fullhouse",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    HighRoller = function()
        return {
            BadgeTexture = "highroller",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    HouseKeeping = function()
        return {
            BadgeTexture = "housekeeping",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    LooseCheng = function()
        return {
            BadgeTexture = "loosecheng",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    LuckyLucky = function()
        return {
            BadgeTexture = "luckylucky",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    PlayToWin = function()
        return {
            BadgeTexture = "playtowin",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    StraightFlush = function()
        return {
            BadgeTexture = "straightflush",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    StrongArmTactics = function()
        return {
            BadgeTexture = "strongarmtactics",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    TopPair = function()
        return {
            BadgeTexture = "toppair",
            BadgeDictionary = "mpawardcasino"
        }
    end,
}

ContextUI = {
    Entity = {
        ID = nil,
        Type = nil,
        Model = nil,
        NetID = nil,
        ServerID = nil,
    },
    Menus = {},
    Focus = false,
    Open = false,
    Position = vector2(0.0, 0.0),
    Offset = vector2(0.0, 0.0),
    Options = 0,
    Category = "main",
    CategoryID = 0,
    Description = nil,
}

function ContextUI:OnClosed()
    ResetEntityAlpha(self.Entity.ID)
    self.Entity.ID = nil
    self.Open = false
    self.Focus = false
    self.Category = "main"
    self.Options = 0
end

local function GetSafeZoneBounds()
    local SafeSize = GetSafeZoneSize()
    SafeSize = math.round(SafeSize, 2)
    SafeSize = (SafeSize * 100) - 90
    SafeSize = 10 - SafeSize

    local W, H = 1920, 1080

    return { X = math.round(SafeSize * ((W / H) * 5.4)), Y = math.round(SafeSize * 5.4) }
end

local function SetScaleformParams(scaleform, data)
    data = data or {}
    for k, v in pairs(data) do
        PushScaleformMovieFunction(scaleform, v.name)
        if v.param then
            for _, par in pairs(v.param) do
                if math.type(par) == "integer" then
                    PushScaleformMovieFunctionParameterInt(par)
                elseif type(par) == "boolean" then
                    PushScaleformMovieFunctionParameterBool(par)
                elseif math.type(par) == "float" then
                    PushScaleformMovieFunctionParameterFloat(par)
                elseif type(par) == "string" then
                    PushScaleformMovieFunctionParameterString(par)
                end
            end
        end
        if v.func then
            v.func()
        end
        PopScaleformMovieFunctionVoid()
    end
end

local function RenderSprite(TextureDictionary, TextureName, X, Y, Width, Height, Heading, R, G, B, A)
    ---@type number
    local X, Y, Width, Height = (tonumber(X) or 0) / 1920, (tonumber(Y) or 0) / 1080, (tonumber(Width) or 0) / 1920, (tonumber(Height) or 0) / 1080

    if not HasStreamedTextureDictLoaded(TextureDictionary) then
        RequestStreamedTextureDict(TextureDictionary, true)
    end

    DrawSprite(TextureDictionary, TextureName, X + Width * 0.5, Y + Height * 0.5, Width, Height, Heading or 0, tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
end

local function ShowTitle(Label, Dictionary, Texture)
    local PosX, PosY = ContextUI.Position.x, ContextUI.Position.y
    PosY = PosY + (ContextUI.Options * Settings.Button.Height)

    if (Dictionary ~= nil and Texture ~= nil) then
        RenderSprite(Dictionary, Texture, PosX, PosY - 15, Settings.Button.Width, Settings.Button.Height * 1.5, nil)
    else
        Graphics.Rectangle(PosX, PosY - 15, Settings.Button.Width, Settings.Button.Height * 1.5, Settings.Title.Background[1], Settings.Title.Background[2], Settings.Title.Background[3], Settings.Title.Background[4])
    end

    Graphics.Text(Label, PosX + 110, PosY - 7.5, 1, 0.50, Settings.Title.Text[1], Settings.Title.Text[2], Settings.Title.Text[3], Settings.Title.Text[4], 1, false, false)
    
    ContextUI.Options = ContextUI.Options + 1
    ContextUI.Offset = vector2(PosX, PosY)
end

local function ShowSubTitle(Label)
    local PosX, PosY = ContextUI.Position.x, ContextUI.Position.y
    PosY = PosY + (ContextUI.Options * Settings.Button.Height)

    Graphics.Rectangle(PosX, PosY, Settings.Button.Width, Settings.Button.Height, Settings.Subtitle.Background[1], Settings.Subtitle.Background[2], Settings.Subtitle.Background[3], Settings.Subtitle.Background[4])
    Graphics.Text(Label, PosX + Settings.Text.X, PosY + Settings.Text.Y, 0, Settings.Text.Scale * 0.90, Settings.Subtitle.Text[1], Settings.Subtitle.Text[2], Settings.Subtitle.Text[3], Settings.Subtitle.Text[4], 0, false, false)
    
    ContextUI.Options = ContextUI.Options + 1
    ContextUI.Offset = vector2(PosX, PosY)
end

local function ShowDescription(Description)
    local PosX, PosY = ContextUI.Position.x, ContextUI.Position.y
    PosY = PosY + (ContextUI.Options * Settings.Button.Height)
    local GetLineCount = Graphics.GetLineCount(Description, PosX + 110, PosY, Settings.Text.Font, 0.24, Settings.Title.Text[1], Settings.Title.Text[2], Settings.Title.Text[3], Settings.Title.Text[4], 1, false, false, 215)
    Graphics.Rectangle(PosX, PosY, Settings.Button.Width, 2, Settings.Title.Background[1], Settings.Title.Background[2], Settings.Title.Background[3], Settings.Title.Background[4])
    Graphics.Rectangle(PosX, PosY + 2, Settings.Button.Width, 1 + (GetLineCount * 17.5), 0, 0, 0, 160)
    Graphics.Text(Description, PosX + 110, PosY, Settings.Text.Font, 0.24, Settings.Title.Text[1], Settings.Title.Text[2], Settings.Title.Text[3], Settings.Title.Text[4], 1, false, false, 215)
    ContextUI.Offset = vector2(PosX, PosY + 3 +(GetLineCount * 17.5))
end

local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 5, Scale = 0.33 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 220, Y = -2, Width = 30, Height = 30 },
    RightText = { X = 185, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "commonmenu", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}

function ContextUI:Button(Label, Description, Style, Actions, Submenu)
    local PosX, PosY = self.Position.x, self.Position.y
    PosY = PosY + (self.Options * Settings.Button.Height)
    local onHovered = Graphics.IsMouseInBounds(PosX, PosY, Settings.Button.Width, Settings.Button.Height)

    if (onHovered) then
        local Selected = false;
        SetMouseCursorSprite(5)
        if IsControlJustPressed(0, 24) then
            Selected = true
            if (Submenu) then
                self.Category = Submenu.Category
            end
            local audioName = Label == "← Retour" and "BACK" or "SELECT"
            Audio.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", audioName, false)
        end
        if (Actions) then
            Actions(Selected)
        end
        self.Description = Description
    end

    local Index = (not onHovered) and 1 or 2
    Graphics.Rectangle(PosX, PosY, Settings.Button.Width, Settings.Button.Height, Settings.Button.Background[Index][1], Settings.Button.Background[Index][2], Settings.Button.Background[Index][3], Settings.Button.Background[Index][4])
    if onHovered then
        Graphics.Rectangle(PosX, PosY + 29, Settings.Button.Width, Settings.Button.Height * 0.10, 18, 23, 55, 255)
    end
    Graphics.Text(Label, PosX + Settings.Text.X, PosY + Settings.Text.Y, Settings.Text.Font, Settings.Text.Scale * 0.90, Settings.Text.Colors[Index][1], Settings.Text.Colors[Index][2], Settings.Text.Colors[Index][3], Settings.Text.Colors[Index][4], Settings.Text.Center, Settings.Text.Outline, Settings.Text.DropShadow)
    
    if type(Style) == "table" then
        local RightBadgeOffset = ((Style.RightBadge == nil) and 0 or 22)

        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
            -- Graphics.Text(Style.RightLabel, PosX + SettingsButton.RightText.X - RightBadgeOffset, PosY + SettingsButton.RightText.Y, Settings.Text.Font, Settings.Text.Scale * 0.90, Settings.Text.Colors[Index][1], Settings.Text.Colors[Index][2], Settings.Text.Colors[Index][3], Settings.Text.Colors[Index][4], Settings.Text.Center, Settings.Text.Outline, Settings.Text.DropShadow)
            Graphics.Text(Style.RightLabel, PosX + SettingsButton.RightText.X - RightBadgeOffset, PosY + SettingsButton.RightText.Y, Settings.Text.Font, Settings.Text.Scale * 0.90, Settings.Text.Colors[Index][1], Settings.Text.Colors[Index][2], Settings.Text.Colors[Index][3], Settings.Text.Colors[Index][4], Settings.Text.Center, Settings.Text.Outline, Settings.Text.DropShadow)
        end

        if Style.RightBadge ~= nil then
            if Style.RightBadge ~= BadgeStyle.None and Style.RightBadge ~= nil then
                local RightBadge = Style.RightBadge(Selected)

                if (onHovered) then
                    RenderSprite(RightBadge.BadgeDictionary or "commonmenu", RightBadge.BadgeTexture or "", PosX + SettingsButton.RightBadge.X - 32, PosY + SettingsButton.RightBadge.Y, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, 0, 0, 0, RightBadge.BadgeColour and RightBadge.BadgeColour.A or 255)
                else
                    RenderSprite(RightBadge.BadgeDictionary or "commonmenu", RightBadge.BadgeTexture or "", PosX + SettingsButton.RightBadge.X - 32, PosY + SettingsButton.RightBadge.Y, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, RightBadge.BadgeColour and RightBadge.BadgeColour.R or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.G or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.B or 255, RightBadge.BadgeColour and RightBadge.BadgeColour.A or 255)
                end
            end
        end
    end

    self.Options = self.Options + 1
    self.Offset = vector2(PosX, PosY)
end

function ContextUI:Separator(Label)
    local PosX, PosY = self.Position.x, self.Position.y
    PosY = PosY + (self.Options * Settings.Button.Height)

    Graphics.Rectangle(PosX, PosY, Settings.Button.Width, Settings.Button.Height, Settings.Button.Background[1][1], Settings.Button.Background[1][2], Settings.Button.Background[1][3], Settings.Button.Background[1][4])
    Graphics.Text(Label, PosX + Settings.Text.X, PosY + Settings.Text.Y, Settings.Text.Font, Settings.Text.Scale * 0.90, Settings.Text.Colors[1][1], Settings.Text.Colors[1][2], Settings.Text.Colors[1][3], Settings.Text.Colors[1][4], Settings.Text.Center, Settings.Text.Outline, Settings.Text.DropShadow)

    self.Options = self.Options + 1
    self.Offset = vector2(PosX, PosY)
end

function ContextUI:Visible()
    SetMouseCursorSprite(1)
    self.Menus[self.Entity.Type .. self.Category]()

    local X, Y = 1920, 1080
    local lastX, lastY = self.Offset.x, self.Offset.y

    if (lastY + (not self.Description and Settings.Button.Height or 0)) >= Y then
        self.Position = vector2(self.Position.x, self.Position.y - 10.0)
    end

    if (lastX + Settings.Button.Width) >= X then
        self.Position = vector2(self.Position.x - 10.0, self.Position.y)
    end

    self.Options = 0;
    self.Description = nil;
end

function ContextUI:CreateMenu(EntityType, Title, Subtitle, _TextureDictionary, _TextureName)
    return { EntityType = EntityType, Category = "main", Parent = nil, Title = Title, Subtitle = Subtitle, TextureDictionary = _TextureDictionary, TextureName = _TextureName }
end

function ContextUI:CreateSubMenu(Parent, Title, Subtitle, _TextureDictionary, _TextureName)
    local category = self.CategoryID + 1
    self.CategoryID = category;
    return { EntityType = Parent.EntityType, Category = category, Parent = Parent, Title = Title, Subtitle = Subtitle, TextureDictionary = _TextureDictionary, TextureName = _TextureName }
end

function ContextUI:IsVisible(Menu, Callback)
    self.Menus[Menu.EntityType .. Menu.Category] = function()

        if (Menu.Title) then
            ShowTitle(Menu.Title, Menu.TextureDictionary, Menu.TextureName)
        end

        if (Menu.Subtitle) then
            ShowSubTitle(Menu.Subtitle)
        end

        Callback(self.Entity)

        if Menu.Parent then
            self:Button("← Retour", nil, {}, nil, Menu.Parent)
        end

        if (self.Description) then
            ShowDescription(self.Description)
        end
    end
end

Citizen.CreateThread(function()
    local controls_actions = { 239, 240, 24, 25 }
    while true do
        local Timer = 250;
        if IsControlPressed(0, 19) or IsDisabledControlPressed(0, 19) then
        -- if (ContextUI.TestFocus) then
            DisableAllControlActions(2)
            SetMouseCursorActiveThisFrame()
            for _, control in ipairs(controls_actions) do
                EnableControlAction(0, control, true)
            end
            if (not ContextUI.Open) then
                local isFound, entityCoords, surfaceNormal, entityHit, entityType, cameraDirection, mouse = Graphics.ScreenToWorld(35.0, 31)
                if (entityType ~= 0) then
                    -- if GetPlayerPed(-1) ~= entityHit then
                        SetMouseCursorSprite(5)
                        if ContextUI.Entity.ID ~= entityHit then
                            ResetEntityAlpha(ContextUI.Entity.ID)
                            ContextUI.Entity.ID = entityHit
                            SetEntityAlpha(ContextUI.Entity.ID, 200, false)
                        end
                        if IsControlJustPressed(0, 24) or IsDisabledControlPressed(0, 24) then
                            if (ContextUI.Menus[entityType .. ContextUI.Category] ~= nil) then
                                local posX, posY = Graphics.ConvertToPixel(mouse.x, mouse.y)
                                ContextUI.Position = vector2(posX, posY)
                                ContextUI.Entity = {
                                    ID = entityHit,
                                    Type = entityType,
                                    Model = GetEntityModel(entityHit) or 0,
                                    NetID = NetworkGetNetworkIdFromEntity(entityHit),
                                    ServerID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entityHit)),
                                    Plate = GetVehicleNumberPlateText(entityHit) or 0,
                                }
                                ContextUI.Open = true
                                Audio.PlaySound("HUD_FRONTEND_DEFAULT_SOUNDSET", "SELECT", false)
                            end
                        end
                    -- end
                else
                    if (ContextUI.Entity.ID ~= nil) then
                        ResetEntityAlpha(ContextUI.Entity.ID)
                        ContextUI.Entity.ID = nil
                    end
                    SetMouseCursorSprite(1)
                end
            else
                if IsControlJustPressed(0, 25) then
                    ContextUI.Open = false
                    ContextUI:OnClosed()
                end

                ContextUI:Visible()
            end
            DisablePlayerFiring(PlayerPedId(), true)
            Timer = 1;
        elseif (ContextUI.Entity.ID ~= nil) then
            ContextUI:OnClosed()
        end
        Citizen.Wait(Timer)
    end
end)