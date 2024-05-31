ITEM.name = "Steel Piece"
ITEM.description = "A steel billet. The most commonly used item in manufacturing."
ITEM.model = "models/gibs/metal_gib2.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(93.09, 184.67, 141.83),
	ang = Angle(34.36, 243.23, 0),
	fov = 3.13
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