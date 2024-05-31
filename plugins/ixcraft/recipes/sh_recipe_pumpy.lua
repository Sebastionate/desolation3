RECIPE.name = "Pump Action Shotgun"
RECIPE.description = "Build an improvised pump action shotgun."
RECIPE.model = "models/weapons/darky_m/rust/w_sawnoffshotgun.mdl"
RECIPE.category = "Rebel Tech"
RECIPE.flag = "B"
RECIPE.requirements = {
	["ducttape"] = 1,
	["steelp"] = 3,
	["steels"] = 1,
	["piping"] = 1,
	["gunparts"] = 2
}
RECIPE.results = {
	["pumpy"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_weaponbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Weapon Workbench."
end)