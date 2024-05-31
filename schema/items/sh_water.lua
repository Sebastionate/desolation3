ITEM.name = "UU Water"
ITEM.model = Model("models/props_lunk/popcan01a.mdl")
ITEM.description = "A blue aluminium can of plain water."
ITEM.category = "Consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 30
ITEM.price = 5

ITEM.functions.Drink = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:RestoreStamina(25)
		client:EmitSound("eating_and_drinking/drinking.wav", 75, 100, 0.50)

		client:GetCharacter():GetInventory():Add("can", 1)
	end
}
