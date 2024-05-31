
ITEM.name = "Health Kit"
ITEM.model = Model("models/items/healthkit.mdl")
ITEM.description = "A white packet filled with medication."
ITEM.category = "Medical"
ITEM.price = 100

ITEM.functions.Apply = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 50, 100))
		client:EmitSound("items/medshot4.wav", 75, 150, 0.25)
	end
}

ITEM.functions.ApplyToPerson = {
	name = "Apply (to person in front of you)",
	OnRun = function(itemTable)
		local client = itemTable.player
		local ent = client:GetEyeTrace().Entity
		
		ent:SetHealth(math.min(ent:Health() + 50, 100))
		client:EmitSound("items/medshot4.wav", 75, 150, 0.25)
	end,
	OnCanRun = function(itemTable)
		local client = itemTable.player
		local ent = client:GetEyeTrace().Entity
		return IsValid(ent) and ent:IsPlayer()
	end
}