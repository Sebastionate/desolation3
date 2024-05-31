
ITEM.name = "Sparkling UU Water"
ITEM.model = Model("models/props_lunk/popcan01a.mdl")
ITEM.skin = 2
ITEM.description = "A yellow aluminium can of carbonated water."
ITEM.category = "Consumables"
ITEM.hungerAmt = 5
ITEM.thirstAmt = 25

ITEM.functions.Drink = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:RestoreStamina(50)
		client:SetHealth(math.Clamp(client:Health() + 8, 0, client:GetMaxHealth()))
		client:EmitSound("eating_and_drinking/can.wav", 75, 100, 0.50)
		
		client:GetCharacter():GetInventory():Add("can", 1)
	end,
}
