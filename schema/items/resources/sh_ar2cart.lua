ITEM.name = "Empty AR2 Cartridge Box"
ITEM.description = "An empty AR2 cartridge box. Offers valuable insight into the technology used by the occupiers."
ITEM.model = "models/items/combine_rifle_cartridge01_spent.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(26.05, 722.67, 126.04),
	ang = Angle(9.96, 267.94, 0),
	fov = 1.07
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 2x Plastic Chunks, and 1x Steel Piece")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end