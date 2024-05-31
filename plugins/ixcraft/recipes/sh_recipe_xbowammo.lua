RECIPE.name = "Rebar Bundle"
RECIPE.description = "Shape some steel into crossbow ammunition."
RECIPE.model = "models/Items/CrossbowRounds.mdl"
RECIPE.category = "Rebel Tech"
RECIPE.requirements = {
	["steelp"] = 6
}
RECIPE.results = {
	["crossbowammo"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_weaponbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Weapon Workbench."
end)
