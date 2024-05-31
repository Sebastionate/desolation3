
ITEM.name = "Special UU Water"
ITEM.model = Model("models/props_lunk/popcan01a.mdl")
ITEM.skin = 1
ITEM.description = "A red aluminium can of water that seems a bit more viscous than usual."
ITEM.category = "Consumables"
ITEM.hungerAmt = 0
ITEM.thirstAmt = 35

ITEM.functions.Drink = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:RestoreStamina(75)
		client:SetHealth(math.Clamp(client:Health() + 10, 0, client:GetMaxHealth()))
		client:EmitSound("npc/barnacle/barnacle_gulp2.wav", 75, 90, 0.35)
		
		client:GetCharacter():GetInventory():Add("can", 1)
	end,
}
