FACTION.name = "Universal Union"
FACTION.description = "High ranking personnel of the Universal Union"
FACTION.color = Color(105,105,105)
FACTION.pay = 25
FACTION.payTime = 2700
FACTION.models = {"models/player/soldier_stripped.mdl"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()
	inventory:Add("longrange", 1)
	character:SetIsCrippled(false)
	character:SetIsHealed(true)
	character:GiveMoney(45)
end

function FACTION:OnTransfered(client)
	local character = client:GetCharacter()
	character:SetIsCrippled(false)
	character:SetIsHealed(true)
	character:SetModel(self.models[1])
end

FACTION_UNI = FACTION.index

hook.Add("IsCharacterRecognized", "UU Recognition", function(character, id)
	local faction = character:GetFaction() 
	if character:GetPlayer():Team() == FACTION_STAFF then
		return true
	end

	if character:GetPlayer():Team() == FACTION_UNI and faction ~= FACTION_UNI then
		return true
	end
end)

hook.Add("ShouldShowPlayerOnScoreboard", "hideUU", function(client)
	if client:Team() == FACTION_UNI and LocalPlayer():Team() != FACTION_UNI and not LocalPlayer():IsAdmin() then
		return false
	end
end)