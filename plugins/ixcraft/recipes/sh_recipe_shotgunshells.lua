RECIPE.name = "Box of Shotgun Shells"
RECIPE.description = "Reload some shotgun shells."
RECIPE.model = "models/Items/BoxBuckshot.mdl"
RECIPE.flag = "b"
RECIPE.category = "Rebel Tech"
RECIPE.requirements = {
	["shell"] = 2,
	["gunpowder"] = 4,
	["steelp"] = 4
}
RECIPE.results = {
	["shotgunammo"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Workbench."
end)