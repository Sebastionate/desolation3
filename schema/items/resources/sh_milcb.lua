ITEM.name = "Military Circuit Board"
ITEM.description = "A circuit board hardened for use in military settings."
ITEM.model = "models/illusion/eftcontainers/militaryboard.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(0.1, -29.13, 145.83),
	ang = Angle(101.34, 270.14, 0),
	fov = 5.7
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 3x Plastic Chunks")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end