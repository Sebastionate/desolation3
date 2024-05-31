ITEM.name = "Broken LED Screen"
ITEM.description = "A LED screen whose display has been smashed. Useful only for parts."
ITEM.model = "models/illusion/eftcontainers/lcddirty.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-31.71, -0.39, 193.29),
	ang = Angle(99.34, 179.93, 0),
	fov = 5.32
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 1x Wires, 1x Steel Piece")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end