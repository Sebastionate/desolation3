RECIPE.name = "Can"
RECIPE.description = "Breakdown your can into its base materials."
RECIPE.model = "models/props_junk/PopCan01a.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["can"] = 1,
}
RECIPE.results = {
	["steelp"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_heat")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near some heat."
end)