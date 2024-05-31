RECIPE.name = "Fishing Rod"
RECIPE.description = "With a little wood and wire, you got a right good pole I'll tell ya what!"
RECIPE.model = "models/oldprops/fishing_rod.mdl"
RECIPE.category = "Hand Made"
RECIPE.requirements = {
	["woods"] = 1,
	["wires"] = 4
}
RECIPE.results = {
	["fishingrod"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a workbench."
end)