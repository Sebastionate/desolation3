
ITEM.name = "Loyalist-Grade Supplements"
ITEM.model = Model("models/foodnhouseholdaaaaa/combirationc.mdl")
ITEM.description = "A decent sized packet containing a nutrient-rich paste."
ITEM.hungerAmt = 20
ITEM.thirstAmt = 15

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:RestoreStamina(100)
		client:SetHealth(math.Clamp(client:Health() + 20, 0, client:GetMaxHealth()))
		client:EmitSound("npc/antlion_grub/squashed.wav", 75, 150, 0.25)
		
		client:GetCharacter():GetInventory():Add("empty_supplements", 1)
	end,
	OnCanRun = function(itemTable)
		return !itemTable.player:IsCombine()
	end
}
