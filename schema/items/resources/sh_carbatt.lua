ITEM.name = "Car Battery"
ITEM.description = "A wet-cell car battery. Still has some juice."
ITEM.model = "models/illusion/eftcontainers/carbattery.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(7.32, 731.77, 56.71),
	ang = Angle(4.03, 269.42, 0),
	fov = 1.14
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down 2x Steel Pieces, and 2x Plastic Chunks")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end