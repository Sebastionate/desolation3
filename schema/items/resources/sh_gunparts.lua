ITEM.name = "Gun Scrap"
ITEM.description = "A hodgepodge assortment of firearms parts. Could be useful in rebuilding weapons."
ITEM.model = "models/illusion/eftcontainers/weaponparts.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(10.21, 11.89, 733.9),
	ang = Angle(88.74, 225.96, 0),
	fov = 1.05
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 1x Steel Piece.")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end