
ITEM.name = "Splint"
ITEM.model = Model("models/illusion/eftcontainers/splint.mdl")
ITEM.description = "A splint used to stabilize broken limbs."
ITEM.category = "Medical"
ITEM.price = 50

ITEM.functions.Apply = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local character = client:GetCharacter()
		client:EmitSound("physics/body/body_medium_impact_soft6.wav", 75, 100, 0.25)
        client:Notify("Your broken legs have healed.")
		character:SetIsHealed(true)
	end
}

ITEM.functions.ApplyToPerson = {
	name = "Apply (to person in front of you)",
	OnRun = function(itemTable)
		local client = itemTable.player
		local ent = client:GetEyeTrace().Entity
		
		client:EmitSound("physics/body/body_medium_impact_soft6.wav", 75, 100, 0.25)
        ent:Notify("Your broken legs have healed.")
		ent:GetCharacter():SetIsHealed(true)
	end,
	OnCanRun = function(itemTable)
		local client = itemTable.player
		local ent = client:GetEyeTrace().Entity
		return IsValid(ent) and ent:IsPlayer()
	end
}