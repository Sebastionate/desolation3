RECIPE.name = "Zip Ties"
RECIPE.description = "Melt and reshape some plasic into zipties."
RECIPE.model = "models/freeman/flexcuffs.mdl"
RECIPE.category = "Rebel Tech"
RECIPE.requirements = {
	["plasticp"] = 4
}
RECIPE.results = {
	["zip_tie"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a workbench."
end)