RECIPE.name = "Power Bank"
RECIPE.description = "Breakdown your power bank into a hunk of plastic."
RECIPE.model = "models/illusion/eftcontainers/powerbank.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["powerbank"] = 1,
}
RECIPE.results = {
	["plasticp"] = 2
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_eletrofunky")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near some eletric gizmos."
end)