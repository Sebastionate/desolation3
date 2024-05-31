ITEM.name = "Cloth Sheet"
ITEM.description = "A sheet of cloth."
ITEM.model = "models/rust/misc_cloth.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-142.91, 3.59, 720.02),
	ang = Angle(101.23, 178.55, 0),
	fov = 1.34
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 3x Cloth Strips")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end