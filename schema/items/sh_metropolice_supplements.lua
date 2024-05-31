
ITEM.name = "Metropolice Supplements"
ITEM.model = Model("models/mres/consumables/zag_mre.mdl")
ITEM.description = "A tinned can containing a good portion of your daily nutrients."
ITEM.factions = {FACTION_MPF, FACTION_OTA}
ITEM.hungerAmt = 60
ITEM.thirstAmt = 25

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:RestoreStamina(100)
		client:SetHealth(math.Clamp(client:Health() + 30, 0, client:GetMaxHealth()))
		client:EmitSound("npc/antlion_grub/squashed.wav", 75, 150, 0.25)
		if client:Team() != FACTION_MPF then 
			itemTable.hungerAmt = 35
			itemTable.thirstAmt = 10
		end
	end
}
