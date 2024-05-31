ITEM.name = "Rappel Hook"
ITEM.model = "models/props_junk/meathook001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(439.75021362305, 368.88714599609, 254.90196228027),
	ang = Angle(25, 220, 0),
	fov = 1.7647058823529,
}
ITEM.description = "A rappel hook and harness. Comes with thirty metres of rope."
ITEM.category = "Tools"
ITEM.price = 20
function ITEM:PaintOver(item, w, h)
	if item:GetData("equipped") then
		surface.SetDrawColor(110, 255, 110, 100)
        surface.DrawRect(w - 14, h - 14, 8, 8)
    end
end

ITEM.functions.Equip = {
    OnRun = function(itemTable)
        itemTable:SetData("equipped", true)
        itemTable.player.HasRappel = true

        return false
    end,

    OnCanRun = function(item)
		local client = item.player

		return !IsValid(item.entity) and IsValid(client) and item:GetData("equipped") != true and
			hook.Run("CanPlayerEquipItem", client, item) != false and item.invID == client:GetCharacter():GetInventory():GetID()
	end
}

ITEM.functions.EquipUn = {
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/cross.png",
	OnRun = function(itemTable)
        itemTable:SetData("equipped", false)
        itemTable.player.HasRappel = false
		return false
	end,
	OnCanRun = function(item)
		local client = item.player

		return !IsValid(item.entity) and IsValid(client) and item:GetData("equipped") == true and
			hook.Run("CanPlayerUnequipItem", client, item) != false and item.invID == client:GetCharacter():GetInventory():GetID()
	end
    
}