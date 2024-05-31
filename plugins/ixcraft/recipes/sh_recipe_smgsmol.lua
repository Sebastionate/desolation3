RECIPE.name = "Sub Machinegun Magazine"
RECIPE.description = "Reload a SMG magazine."
RECIPE.model = "models/weapons/w_smg1_magazine.mdl"
RECIPE.category = "Rebel Tech"
RECIPE.flag = "B"
RECIPE.requirements = {
	["casing"] = 10,
	["gunpowder"] = 2,
	["plasticp"] = 3,
	["steelp"] = 6
}
RECIPE.results = {
	["smgstick"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_weaponbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Weapon Workbench."
end)