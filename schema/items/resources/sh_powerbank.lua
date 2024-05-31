ITEM.name = "Power Pack"
ITEM.description = "A rechargable power pack. Commonly used in computation."
ITEM.model = "models/illusion/eftcontainers/powerbank.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(440.9, 586.85, 5.36),
	ang = Angle(0.33, 233.08, 0),
	fov = 0.72
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down 2x Plastic Chunks")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end