RECIPE.name = "Makeshift Plate Vest"
RECIPE.description = "Create a makeshift plate vest from kevlar and a lot of metal."
RECIPE.model = "models/weapons/darky_m/rust/w_revolver.mdl"
RECIPE.category = "Rebel Tech"
RECIPE.flag = "B"
RECIPE.requirements = {
	["steels"] = 4,
	["kevlar"] = 2,
	["cloth"] = 1,
}
RECIPE.results = {
	["msv"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Workbench."
end)