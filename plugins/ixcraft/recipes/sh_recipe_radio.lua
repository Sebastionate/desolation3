RECIPE.name = "Handheld Radio"
RECIPE.description = "Build an improvised radio."
RECIPE.model = "models/radio/w_radio.mdl"
RECIPE.category = "Eletronic"
RECIPE.requirements = {
	["aa"] = 2,
	["wires"] = 2,
	["civcb"] = 1,
	["plasticp"] = 4
}
RECIPE.results = {
	["handheld_radio"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_electrofunky")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near some electronic gizmos."
end)