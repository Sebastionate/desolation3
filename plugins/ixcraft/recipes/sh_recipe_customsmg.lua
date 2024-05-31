RECIPE.name = "Custom SMG"
RECIPE.description = "Tool a submachine gun out of an old bike pump and some other parts."
RECIPE.model = "models/weapons/darky_m/rust/w_smg.mdl"
RECIPE.category = "Rebel Tech"
RECIPE.flag = "B"
RECIPE.requirements = {
	["woodp"] = 2,
	["steelp"] = 8,
	["piping"] = 3,
	["gunparts"] = 1
}
RECIPE.results = {
	["customsmg"] = 1,
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_weaponbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false, "You need to be near a Weapon Workbench."
end)