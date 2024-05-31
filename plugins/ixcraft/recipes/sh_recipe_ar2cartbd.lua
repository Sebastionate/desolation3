RECIPE.name = "Empty AR2 Cartridge Box"
RECIPE.description = "Breakdown your AR2 Cartrige box into it's base materials, more or less with a small chance to remove the eletronics inside."
RECIPE.model = "models/items/combine_rifle_cartridge01_spent.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["ar2cart"] = 1,
}
RECIPE.results = {
	["steelp"] = 1,
	["plasticp"] = 2,
	["milcb"] = {["min"] = 0, ["max"] = 1}
}