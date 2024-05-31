ITEM.name = "Capacitors"
ITEM.description = "A mix and match of capacitors."
ITEM.model = "models/illusion/eftcontainers/capacitors.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(578.58, 449.76, 42.25),
	ang = Angle(3.21, 217.89, 0),
	fov = 0.52
}


ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 2x Plastic Chunks.")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end