
FACTION.name = "Dispatch"
FACTION.description = "A lightly armored security camera manufactured by the Combine."
FACTION.color = Color(160,83,89)
FACTION.pay = 0
FACTION.payTime = 999999
FACTION.isDefault = false
FACTION.models = {
	"models/Combine_Scanner.mdl"
}

function FACTION:GetDefaultName(client)
	return "AW:SCN." .. Schema:ZeroNumber(math.random(1, 999), 3), true
end

function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()

	inventory:Add("longrange", 1)
	
	local radio = inventory:HasItem("longrange")
	if radio then
		radio.keepOnDeath = true
	end
end

function FACTION:ShouldShowPlayerOnScoreboard(client)
	if client:Team() == FACTION_DISPATCH then
		return false
	end
end

function EnsureIsScanner(ply)
	pk_pills.apply(ply, "cityscanner", "lock-life")
	ply.restorePP = true
end

function EnsureIsNotScanner(ply)
	pk_pills.restore(ply, true)
	--[[if ply.scannerPill then
		ply.scannerPill.notDead = true
		ply.scannerPill:Remove()
		ply.scannerPill = nil
	end]]
end

hook.Add("PlayerLoadout", "dispatchSpawn", function(ply)
	local char = ply:GetCharacter()
	if char then
		if char:GetFaction() == FACTION_DISPATCH then
			EnsureIsScanner(ply)
		else
			if IsValid(pk_pills.getMappedEnt(ply)) then EnsureIsNotScanner(ply) end
		end
	end
end)

hook.Add("CanPlayerViewObjectives", "dispatchObjectives", function(client)
	if client:IsDispatch() then return true end
end)

FACTION_DISPATCH = FACTION.index
