RECIPE.name = "Lockpick"
RECIPE.description = "Bend some metal into a lockpick, you dirty little thief you!"
RECIPE.model = "models/freeman/lockpick.mdl"
RECIPE.category = "Hand Made"
RECIPE.requirements = {
	["plasticp"] = 1,
	["steelp"] = 3
}
RECIPE.results = {
	["lockpick"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a workbench."
end)