ITEM.name = "Combine Medikit"
ITEM.model = "models/items/healthkit.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.description = "A Combine produced medikit designed and packaged to preform basic first-aid."
ITEM.category = "Medical"

ITEM.functions.Open = {
	name = "Open",
	OnRun = function(item)
		local char = item.player:GetCharacter()
		local inv = char:GetInventory()
		inv:Add("bandaid", 2)
		inv:Add("biogel", 1)
		inv:Add("stimulant", 1)
		item.player:EmitSound("physics/plastic/plastic_box_impact_bullet5.wav")
	end
}