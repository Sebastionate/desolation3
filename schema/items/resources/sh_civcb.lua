ITEM.name = "Circuit Board"
ITEM.description = "A civilian style of circuit board. Decent enough for your start-up needs."
ITEM.model = "models/illusion/eftcontainers/circuitboard.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-21.23, -0.24, 165.04),
	ang = Angle(97.33, 180.16, 0),
	fov = 5.82
}



ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into X, Y, Z, LMNOP")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end