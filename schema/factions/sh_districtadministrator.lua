
FACTION.name = "City Administration"
FACTION.description = "Human Administrators advised by the Universal Union."
FACTION.color = Color(255, 200, 70, 255)
FACTION.pay = 40
FACTION.payTime = 2800
FACTION.models = {
	"models/npc/male_16.mdl",
	"models/npc/male_15.mdl",
	"models/humans/combine/female_02.mdl"
}
FACTION.isDefault = false
FACTION.isGloballyRecognized = true

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	--local transferId = Schema:ZeroNumber(math.random(1, 999999999), 9)
	
	local inventory = character:GetInventory()

	--character:SetData("cid", id)

	inventory:Add("cid", 1)
	character:SetData("cid", id)
end

FACTION_DISTRICTADMINISTRATOR = FACTION.index