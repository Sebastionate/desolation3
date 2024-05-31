RECIPE.name = "Small Box of 9mm."
RECIPE.description = "law of equivalent exchange? Never heard of it!"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.category = "Rebel Tech"
RECIPE.flag = "b"
RECIPE.requirements = {
	["casing"] = 1,
	["gunpowder"] = 1,
	["steelp"] = 2
}
RECIPE.results = {
	["9mmsmol"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Workbench."
end)