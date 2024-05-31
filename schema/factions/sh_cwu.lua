
FACTION.name = "Civil Workers' Union"
FACTION.description = "Labor organization fostered by the Universal Union"
FACTION.color = Color(251,230,142, 255)
FACTION.pay = 2
FACTION.payTime = 99999
FACTION.isDefault = false
FACTION.models = {
	"models/player/zelpa/male_01_extended.mdl",
	"models/player/zelpa/male_02_extended.mdl",
	"models/player/zelpa/male_03_extended.mdl",
	"models/player/zelpa/male_04_extended.mdl",
	"models/player/zelpa/male_05_extended.mdl",
	"models/player/zelpa/male_06_extended.mdl",
	"models/player/zelpa/male_07_extended.mdl",
	"models/player/zelpa/male_08_extended.mdl",
	"models/player/zelpa/male_09_extended.mdl",
	"models/player/zelpa/male_10_extended.mdl",
	"models/player/zelpa/male_11_extended.mdl",
	"models/player/zelpa/female_01_extended.mdl",
	"models/player/zelpa/female_02_extended.mdl",
	"models/player/zelpa/female_03_extended.mdl",
	"models/player/zelpa/female_04_extended.mdl",
	"models/player/zelpa/female_06_extended.mdl",
	"models/player/zelpa/female_07_extended.mdl"
}

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local transferId = Schema:ZeroNumber(math.random(1, 999999999), 9)
	
	local inventory = character:GetInventory()

	character:SetData("cid", id)

	inventory:Add("suitcase", 1)
	
	timer.Create("suitcase_" .. id, 0, 0, function()
		local suitcase = inventory:HasItem("suitcase")
		if !suitcase then return end

		local suitcaseInventory = suitcase:GetInventory()
		if !suitcaseInventory then return end

		suitcaseInventory:Add("transfer_card", 1, {
			name = character:GetName(),
			cid = id,
			id = transferId,
			loyalty = {
				points = 0
			}
		})

		suitcaseInventory:Add("paper", 1, {
			PaperData = 
[[Welcome! You have been relocated to City 17!
You have been given a suitcase containing this very paper and a transfer card.
This card is not valid identification, and you must get it replaced for a valid identification by inquiring a local CCA officer.
May you live and prosper in your new home!]],
			readOnly = true
		})

		suitcaseInventory:Add("supplements", 1)
		suitcaseInventory:Add("water", 1)

		timer.Remove("suitcase_" .. id)
	end)
	character:SetFaction(FACTION_CITIZEN)
end

FACTION_CWU = FACTION.index