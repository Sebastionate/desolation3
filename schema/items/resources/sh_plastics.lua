ITEM.name = "Plastic Sheet"
ITEM.description = "A sheet of plastic. Sturdy and solid."
ITEM.model = "models/props_c17/oildrumchunk01d.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(647.03, 316.7, -132.27),
	ang = Angle(-10.34, 206.09, 0),
	fov = 1.14
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