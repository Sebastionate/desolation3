
ITEM.name = "Melon"
ITEM.model = Model("models/props_junk/watermelon01.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A green fruit, it has a hard outer shell."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 30
ITEM.thirstAmt = 25

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 10, client:GetMaxHealth()))
		client:EmitSound("npc/headcrab/headbite.wav", 75, 140, 0.30)

		return true
	end,
}