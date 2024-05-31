
FACTION.name = "Enslaved Vortigaunt"
FACTION.description = "--."
FACTION.color = Color(223,123,89, 255)
FACTION.models = {"models/vortigaunt_slave.mdl"}
FACTION.weapons = {"swep_vortigaunt_sweep"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

function FACTION:GetDefaultName(client)
	return "UU-BIOTIC." .. Schema:ZeroNumber(math.random(1, 999), 3), true
end


function FACTION:OnTransfered(client)
	local character = client:GetCharacter()

	character:SetModel(self.models[1])
end


FACTION_VORT = FACTION.index
