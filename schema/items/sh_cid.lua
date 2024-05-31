
ITEM.name = "Citizen ID"
ITEM.model = Model("models/dorado/tarjeta2.mdl")
ITEM.description = "A citizen identification card with ID #%s, assigned to %s."
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
	return string.format(
		self:GetData("id") ~= "00000" and 
			self.description
		or
			"A blank citizen ID.", 
		self:GetData("id", "00000"), RemoveNickname(self:GetData("name", "nobody")))
end

if CLIENT then
	net.Receive("ixEditLoyalty", function()
		local points = net.ReadInt(32)
		local itemID = net.ReadInt(32)
		Derma_StringRequest("Edit Loyalty", "", tostring(points), function(text)
			net.Start("ixEditLoyalty")
			net.WriteInt(tonumber(text), 32)
			net.WriteInt(itemID, 32)
			net.SendToServer()
		end)
	end)
end

if SERVER then
	util.AddNetworkString("ixEditLoyalty")

	net.Receive("ixEditLoyalty", function(len, ply)
		if not ply:IsAdmin() then return end
		
		local points = net.ReadInt(32)
		local itemID = net.ReadInt(32)

		local item = ix.item.New('cid', itemID)

		if not item then return end
		
		local loyalty = item:GetData("loyalty", {points = 0})
		loyalty.points = points
		item:SetData("loyalty", loyalty)
	end)
end

ITEM.functions.EditLoyalty = {
	name = "Edit loyalty points",
	OnRun = function(item)
		if not item.player then return false end

		local loyalty = item:GetData("loyalty", {points = 0})

		net.Start("ixEditLoyalty")
		net.WriteInt(loyalty.points, 32)
		net.WriteInt(item:GetID(), 32)
		net.Send(item.player)

		return false
	end,
	OnCanRun = function(item)
		if input and input.IsShiftDown and (not input.IsShiftDown(IN_SHIFT)) then
			return false
		end

		if not item.player:IsAdmin() then
			return false
		end

		return true
	end
}

ITEM.functions.AssignToMe = {
	name = "Reassign to self",
	OnRun = function(item)
		item:SetData("id", item.player:GetCharacter():GetData("cid"))
		item:SetData("name", item.player:GetCharacter():GetName())
		item:SetData("loyalty", {
			points = 0
		})

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

		item:SetData("id", target:GetCharacter():GetData("cid"))
		item:SetData("name", target:GetCharacter():GetName())
		item:SetData("loyalty", {
			points = 0
		})

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