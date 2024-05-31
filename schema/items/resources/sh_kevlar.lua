ITEM.name = "Kevlar Sheet"
ITEM.description = "A sheet of kevlar fabric. Most often used in armour production."
ITEM.model = "models/equipmentpack/usgearbedroll.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(221.26, -697.44, 59.23),
	ang = Angle(4.63, 107.55, 0),
	fov = 1.14
}


ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 4x Cloth")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end