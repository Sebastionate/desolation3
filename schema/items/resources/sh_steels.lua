ITEM.name = "Steel Sheet"
ITEM.description = "A large sheet made from hammered steel."
ITEM.model = "models/props_debris/metal_panel02a.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(93.09, 184.67, 141.83),
	ang = Angle(34.36, 243.23, 0),
	fov = 5
}


ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 3x Steel Pieces")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end