RECIPE.name = "Box of 9mm."
RECIPE.description = "Reload a box of 9mm ammunition."
RECIPE.model = "models/Items/BoxSRounds.mdl"
RECIPE.category = "Rebel Tech"
RECIPE.flag = "B"
RECIPE.requirements = {
	["casing"] = 2,
	["gunpowder"] = 2,
	["steelp"] = 4
}
RECIPE.results = {
	["pistolammo"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_weaponbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Weapon Workbench."
end)