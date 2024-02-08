gtaui = {}
local DuiHandle = {}


function DuiHandle:new(dictionary, textureName, url, widht, height)
    local txd = CreateRuntimeTxd(dictionary)
    local duiObj = CreateDui(url, widht, height)
    local dui = GetDuiHandle(duiObj)
    local tx = CreateRuntimeTextureFromDuiHandle(txd, textureName, dui)
    local data = {txd = txd, dui = dui, duiObj = duiObj,handle = 0, dict = dictionary, txtName = textureName, replaceDict = nil}
	setmetatable(data, self)
	self.__index = self
	return data
end

function DuiHandle:replaceTexture(baseTextureDict,baseTexture)
	self.replaceDict = baseTextureDict
	self.replaceTxt = baseTexture
    AddReplaceTexture(baseTextureDict, baseTexture, self.dict, self.txtName)
end

function DuiHandle:releaseTexture()
	if self.replaceDict ~= nil then
		RemoveReplaceTexture(self.replaceDict,self.replaceTxt)
	end
end

function DuiHandle:destroy()
	DestroyDui(self.duiObj)
end

function DuiHandle:callEvent(event,arg)
	SendDuiMessage(self.duiObj,json.encode({
		uiView = true,
		action = "callEvent",
		params = {
			event = event,
			arg = arg,
		}
	}))
end

function DuiHandle:setHandle(name, model)--for scaleform (maybe unse after replace texture size on screen because tv have 512x256 texture and lost quality when up to 720p or more)
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


local function newDuiHandle(dictionary, textureName, url, widht, height)
    return DuiHandle:new(dictionary, textureName, url, widht, height)
end

gtaui.DuiHandle = newDuiHandle