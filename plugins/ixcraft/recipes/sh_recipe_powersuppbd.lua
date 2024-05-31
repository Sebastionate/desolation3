RECIPE.name = "Power Supply"
RECIPE.description = "Breakdown your power supply into its bitz and bobz. Has a chance to yeild a Circuit Board."
RECIPE.model = "models/illusion/eftcontainers/powersupplyunit.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["powersupp"] = 1,
}
RECIPE.results = {
	["wires"] = 1,
	["steelp"] = 2,
	["civcb"] = {["min"] = 0, ["max"] = 1}
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_eletrofunky")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near some eletric gizmos."
end)