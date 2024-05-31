RECIPE.name = "Biogel Vial"
RECIPE.description = "Mix together some biogel into something useful."
RECIPE.model = "models/healthvial.mdl"
RECIPE.category = "Medical"
RECIPE.requirements = {
	["plasticp"] = 4,
	["greenjunk"] = 2
}
RECIPE.results = {
	["biogel"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_medicalstation")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Chemistry Station"
end)