FACTION.name = "Combine Infestation Control"
FACTION.description = "Labor organization fostered by the Universal Union for the purpose of infestation control and quarantine. Consists of mostly volunteer CCA functionaries."
FACTION.color = Color(0,102,0, 255)
FACTION.pay = 5
FACTION.payTime = 2700
FACTION.isDefault = false
FACTION.models = {"models/cultist/hl_a/worker/hazmat_2/npc/hazmat_2.mdl"}

function FACTION:OnCharacterCreated(client, character)
	character:SetIsCrippled(false)
	character:SetIsHealed(true)
	character:GiveMoney(30)

end

function FACTION:GetDefaultName(client)
	return "CIC-PRESSURE.SaN." .. Schema:ZeroNumber(math.random(1, 999), 3), true
end

function FACTION:OnTransfered(client)
	local character = client:GetCharacter()
	character:SetIsCrippled(false)
	character:SetIsHealed(true)

	character:SetName(self:GetDefaultName())
	character:SetModel(self.models[1])
end

FACTION_CIC = FACTION.index