ITEM.name = "Bolts"
ITEM.description = "A hand full of bolts. Useful for manufacturing."
ITEM.model = "models/illusion/eftcontainers/screwnutbolt.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(44.21, 39.9, 731.65),
	ang = Angle(85.33, 221.89, 0),
	fov = 0.54
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 1x Steel Piece")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end