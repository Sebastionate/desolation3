RECIPE.name = "Hand-Made Revolver"
RECIPE.description = "Create a very crude sidearm."
RECIPE.model = "models/weapons/darky_m/rust/w_revolver.mdl"
RECIPE.category = "Hand Made"
RECIPE.flag = "b"
RECIPE.requirements = {
	["woodp"] = 2,
	["ducttape"] = 1,
	["steelp"] = 3,
	["piping"] = 1,
	["bolts"] = 1,
	["gunparts"] = 1
}
RECIPE.results = {
	["hmrevolver"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Workbench."
end)