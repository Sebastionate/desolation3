
ITEM.name = "Health Vial"
ITEM.model = Model("models/healthvial.mdl")
ITEM.description = "A small vial with green liquid."
ITEM.category = "Medical"
ITEM.price = 30

ITEM.functions.Apply = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 30, client:GetMaxHealth()))
		client:EmitSound("items/medshot4.wav", 75, 150, 0.25)
	end
}

ITEM.functions.ApplyToPerson = {
	name = "Apply (to person in front of you)",
	OnRun = function(itemTable)
		local client = itemTable.player
		local ent = client:GetEyeTrace().Entity
		
		ent:SetHealth(math.min(ent:Health() + 30, 100))
		client:EmitSound("items/medshot4.wav", 75, 150, 0.25)
	end,
	OnCanRun = function(itemTable)
		local client = itemTable.player
		local ent = client:GetEyeTrace().Entity
		return IsValid(ent) and ent:IsPlayer()
	end
}