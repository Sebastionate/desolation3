ITEM.name = "Bottle of Gin"
ITEM.model = Model("models/bioshockinfinite/jin_bottle.mdl")
ITEM.description = "A bottle of the Universal-Union's finest Gin. It is slightly watered down."
ITEM.width = 1
ITEM.height = 2
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 15

ITEM.functions.Drink = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + -10, client:GetMaxHealth()))
		client:EmitSound("eating_and_drinking/drinking.wav", 75, 80, 0.45)
		client:GetCharacter():GetInventory():Add("bottle")

		return true
	end
}
