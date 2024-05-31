RECIPE.name = "Circuit Board"
RECIPE.description = "Break down your Circuit Board into its bits and bobs. Has a chance to yeild capacitors."
RECIPE.model = "models/illusion/eftcontainers/circuitboard.mdl"
RECIPE.category = "Breakdown"
RECIPE.requirements = {
	["civcb"] = 1,
}
RECIPE.results = {
	["plasticp"] = 2,
	["capacitor"] = {["min"] = 0, ["max"] = 1}
}