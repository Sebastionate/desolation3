
ITEM.name = "Bag of chips"
ITEM.model = Model("models/bioshockinfinite/bag_of_hhips.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A small bag of UU-Branded potato chips."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 20
ITEM.thirstAmt = -10

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

        client:EmitSound("eating_and_drinking/crunchy.wav", 75, 115, 0.45)

		return true
	end,
}
