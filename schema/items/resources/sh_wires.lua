ITEM.name = "Wires"
ITEM.description = "A bundle of multi-colored wires. A mainstay of electronics."
ITEM.model = "models/illusion/eftcontainers/wires.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-60, -57.29, 730.55),
	ang = Angle(96.47, 223.84, 0),
	fov = 0.51
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