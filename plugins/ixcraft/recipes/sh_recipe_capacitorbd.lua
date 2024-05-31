RECIPE.name = "Capacitors"
RECIPE.description = "Breakdown your capacitors into a lump of plastic."
RECIPE.model = "models/illusion/eftcontainers/capacitors.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["capacitors"] = 1,
}
RECIPE.results = {
	["plasticp"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_eletrofunky")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near some eletric gizmos."
end)