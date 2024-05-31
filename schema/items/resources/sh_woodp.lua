ITEM.name = "Wood Scrap"
ITEM.description = "A scrap piece of wood. Splinter free."
ITEM.model = "models/gibs/wood_gib01b.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(-52.16, 0.46, 732.22),
	ang = Angle(94.07, 179.46, 0),
	fov = 3.17
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