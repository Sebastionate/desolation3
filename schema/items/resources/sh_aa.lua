ITEM.name = "AA Battery"
ITEM.description = "A tiny little AA battery. Still good."
ITEM.model = "models/illusion/eftcontainers/aabattery.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(150.44, 718.26, -23.51),
	ang = Angle(-1.83, 258.16, 0),
	fov = 0.3
}


ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This is a base item. It can not be broken down any further.")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end