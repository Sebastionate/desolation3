ITEM.name = "Union Water"
ITEM.model = Model("models/props_lunk/popcan01a.mdl")
ITEM.description = "A blue aluminium can of regular water. Has an odd taste to it."
ITEM.category = "Consumables"
ITEM.thirstAmt = 20

ITEM.functions.Drink = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:RestoreStamina(50)
		client:SetHealth(math.Clamp(client:Health() + 8, 0, client:GetMaxHealth()))
		client:EmitSound("eating_and_drinking/can.wav", 75, 100, 0.50)
		
		client:GetCharacter():GetInventory():Add("can", 1)
	end,
}