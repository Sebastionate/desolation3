ITEM.name = "Bag of popcorn"
ITEM.model = Model("models/bioshockinfinite/topcorn_bag.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.description = "A fresh bag of popcorn."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 25
ITEM.thirstAmt = -15

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
        client:EmitSound("npc/footsteps/hardboot_generic8.wav", 75, 75, 1)
		return true
	end,
}
