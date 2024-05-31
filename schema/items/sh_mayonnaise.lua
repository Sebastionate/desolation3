ITEM.name = "Mayonnaise"
ITEM.model = Model("models/fallout/components/jar.md")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A Bit of mayonnaise made from a single egg"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.hungerAmt = 1
ITEM.thirstAmt = -2

ITEM.useSound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 1, client:GetMaxHealth()))
        client:EmitSound("eating_and_drinking/eating_long.wav", 100, 100, 0.45)

		return true
	end,
}
