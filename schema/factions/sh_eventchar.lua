
FACTION.name = "Event Character"
FACTION.description = "Characters that are only used for organized events."
FACTION.color = Color(241,19,230)
FACTION.payTime = 9999
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
	"models/player/zelpa/male_11_extended.mdl",
	"models/player/zelpa/female_01_extended.mdl",
	"models/player/zelpa/female_02_extended.mdl",
	"models/player/zelpa/female_03_extended.mdl",
	"models/player/zelpa/female_04_extended.mdl",
	"models/player/zelpa/female_06_extended.mdl",
	"models/player/zelpa/female_07_extended.mdl"
}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

FACTION_EVENT = FACTION.index

hook.Add("ShouldShowPlayerOnScoreboard", "hideEM", function(client)
	if client:Team() == FACTION_EVENT and not LocalPlayer():IsAdmin() then
		return false
	end
end)

hook.Add("IsCharacterRecognized", "EM Recognition", function(character, id)
	if character:GetPlayer():Team() == FACTION_STAFF then
		return true
	end
end)