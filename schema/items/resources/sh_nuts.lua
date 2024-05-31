ITEM.name = "Nuts"
ITEM.description = "A hand full of nuts. Useful in manufacturing."
ITEM.model = "models/illusion/eftcontainers/nuts.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-45.83, -34.06, 731.85),
	ang = Angle(94.46, 216.6, 0),
	fov = 0.38
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