
FACTION.name = "Staff"
FACTION.description = "OOC Operations by staff team"
FACTION.color = Color(106,24,240)
FACTION.payTime = 9999
FACTION.models = {
	"models/player/tfa_bc_mysteriousstranger.mdl",
	"models/player/airex_male.mdl",
    "models/dpfilms/metropolice/playermodels/pm_badass_police.mdl"
}
FACTION.isDefault = false
FACTION.isGloballyRecognized = true

FACTION_STAFF = FACTION.index

CAMI.RegisterPrivilege({
	Name = "Helix - Logs",
	MinAccess = "admin"
})

hook.Add("PlayerSpawn", "KickNonAdmin", function(client)
	local character = client:GetCharacter()
	if character and character:GetFaction() == FACTION_STAFF then
		if client:IsUserGroup("moderator") then return end
		if not client:IsAdmin() or client:IsUserGroup("event manager") then
			character:GetPlayer():Notify("You must be an admin to use a staff character!")
			timer.Simple(3, function()
				character:Kick()
			end)
		end
	end
end)

hook.Add("ShouldShowPlayerOnScoreboard", "hideStaff", function(client)
	if client:Team() == FACTION_STAFF and not LocalPlayer():IsAdmin() then
		return false
	end
end)