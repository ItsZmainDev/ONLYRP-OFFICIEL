local Scaleform = {}


function Scaleform:new(scaleName, type)
    local id
    if type == "interact" then
        id = RequestScaleformMovieInteractive(scaleName)
    else
        id = RequestScaleformMovie(scaleName)
    end

    local data = {id = id, handle = 0}
	setmetatable(data, self)
	self.__index = self
	return data
end

function Scaleform:load()
    while not HasScaleformMovieLoaded(self.id) do
        Wait(1)
    end
    return true
end

function Scaleform:callFunction(fnName, ...)
    BeginScaleformMovieMethod(self.id,fnName)
    local arg = {...}
    for k,v in pairs(arg) do
        if type(v) == "number" then
            if math.type(v) == "integer" then
                ScaleformMovieMethodAddParamInt(v)
            else
                ScaleformMovieMethodAddParamFloat(v)
            end
        elseif type(v) == "string" then
            ScaleformMovieMethodAddParamTextureNameString(v)
        elseif type(v) == "boolean" then
            ScaleformMovieMethodAddParamBool(v)
        end

    end
    EndScaleformMovieMethod()
end

function Scaleform:callFunctionReturnValue(fnName, cb, ...)
    BeginScaleformMovieMethod(self.id,fnName)
    local arg = {...}
    for k,v in pairs(arg) do
        if type(v) == "number" then
            if math.type(v) == "integer" then
                ScaleformMovieMethodAddParamInt(v)
            else
                ScaleformMovieMethodAddParamFloat(v)
            end
        elseif type(v) == "string" then
            ScaleformMovieMethodAddParamTextureNameString(v)
        elseif type(v) == "boolean" then
            ScaleformMovieMethodAddParamBool(v)
        end

    end
    local responseHandle = EndScaleformMovieMethodReturnValue()
    Citizen.CreateThread(function()
        while not IsScaleformMovieMethodReturnValueReady(responseHandle) do
            Citizen.Wait(1)
        end
        local response = GetScaleformMovieMethodReturnValueInt(responseHandle)
        cb(response)
    end)
end

function Scaleform:setHandle(name, model)
    local handle = 0
	if not IsNamedRendertargetRegistered(name) then
		RegisterNamedRendertarget(name, 0)
	end
	if not IsNamedRendertargetLinked(model) then
		LinkNamedRendertarget(model)
	end
	if IsNamedRendertargetRegistered(name) then
		handle = GetNamedRendertargetRenderId(name)
	end

    self.handle = handle
end


function Scaleform:drawOnModel()
    SetTextRenderId(self.handle) -- set render target
    Set_2dLayer(4)
    Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
    DrawRect(0.5, 0.5, 1.0, 0.5, 255, 0, 0, 255); -- WOAH!
    DrawScaleformMovie(self.id,0.5, 0.63, 0.5, 0.5, 255, 255, 255, 255)
    SetTextRenderId(GetDefaultScriptRendertargetRenderId()) -- reset
    Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
end

function Scaleform:draw2D (color)
    DrawScaleformMovieFullscreen(self.id, color.r, color.g, color.b, color.a, 0)
end

function Scaleform:draw2DNormal (pos, dimension, color)
    DrawScaleformMovie(self.id, pos.x, pos.y, dimension.x, dimension.y, color.r, color.g, color.b, color.a, 0)
end

function Scaleform:draw3D (pos, rot, scale)
    DrawScaleformMovie_3dSolid(self.id, pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2.0, 2.0, 1.0, scale.x, scale.y, scale.z, 2)
end

function Scaleform:draw3DNormal (pos, rot, scale)
    DrawScaleformMovie_3d(self.id, pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2.0, 2.0, 1.0, scale.x, scale.y, scale.z, 2)
end

function Scaleform:release()
    SetScaleformMovieAsNoLongerNeeded(self.id)
end

local function newScaleform(type,scaleName)
    return Scaleform:new(type,scaleName)
end

gtaui.Scaleform = newScaleform
