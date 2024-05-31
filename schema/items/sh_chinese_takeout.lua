
ITEM.name = "Chinese Takeout"
ITEM.model = Model("models/props_junk/garbage_takeoutcarton001a.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A takeout carton, fiilled with soy sauce Noodles, With Cabbage, Peas and Carrots."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 40
ITEM.thirstAmt = 25

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 20, 100))
		client:EmitSound("npc/antlion_grub/squashed.wav", 75, 150, 0.25)
		return true
	end,
}
