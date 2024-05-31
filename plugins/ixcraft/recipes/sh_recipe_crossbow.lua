RECIPE.name = "Resistance Crossbow"
RECIPE.description = "Slap together a crossbow. A deadly medium range powerhouse."
RECIPE.model = "models/weapons/w_crossbow.mdl"
RECIPE.category = "Rebel Tech"
RECIPE.requirements = {
	["gunparts"] = 2,
	["wires"] = 6,
	["milbat"] = 2,
	["woodp"] = 2,
	["steelp"] = 8
}
RECIPE.results = {
	["crossbow"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_weaponbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a weapon workbench."
end)