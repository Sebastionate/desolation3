
ITEM.name = "Milk Carton"
ITEM.model = Model("models/props_junk/garbage_milkcarton001a.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A carton filled with milk. It's origins are... questionable."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 25

ITEM.functions.Drink = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))

		return true
	end,
}
