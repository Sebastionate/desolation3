
ITEM.name = "Transfer Card"
ITEM.model = Model("models/dorado/tarjetazero.mdl")
ITEM.description = "New transfer identification, not a valid ID.\nTake this to a CCA officer to receive valid ID.\nTransfer Number: #%s\nTransferee: %s."
ITEM.keepOnDeath = true

local function RemoveNickname(name)
	local _, a = string.find(name, " '")
	local _, b = string.find(name, "' ")	
	if a ~= nil and b ~= nil then
	  name = string.sub(name, 1, a - 1) .. string.sub(name, b + 1, #name)
	end	
	return name
end

function ITEM:GetDescription()
	return string.format(self.description, self:GetData("id", "000000000"), RemoveNickname(self:GetData("name", "nobody")))
end

ITEM.functions.AssignToMe = {
	name = "Reassign to self",
	OnRun = function(item)
		item:SetData("id", Schema:ZeroNumber(math.random(1, 999999999), 9))
		item:SetData("name", item.player:GetCharacter():GetName())
		item:SetData("cid", item.player:GetCharacter():GetData("cid"))

		return false
	end,
	OnCanRun = function(item)
		if input and input.IsShiftDown and (not input.IsShiftDown(IN_SHIFT)) then
			return false
		end

		if not item.player:IsAdmin() then
			return false
		end

		if item.player:GetCharacter():GetData("cid") == item:GetData("id") then
			return false
		end

		return true
	end
}

ITEM.functions.AssignToLookingAt = {
	name = "Reassign to looking at player",
	OnRun = function(item)
		local target = item.player:GetEyeTrace().Entity
		if not target:IsPlayer() then return false end

		item:SetData("id", Schema:ZeroNumber(math.random(1, 999999999), 9))
		item:SetData("name", target:GetCharacter():GetName())
		item:SetData("cid", target:GetCharacter():GetData("cid"))

		return false
	end,
	OnCanRun = function(item)
		if input and input.IsShiftDown and (not input.IsShiftDown(IN_SHIFT)) then
			return false
		end

		if not item.player:IsAdmin() then
			return false
		end

		local target = item.player:GetEyeTrace().Entity
		if not target:IsPlayer() then return false end

		return true
	end
}