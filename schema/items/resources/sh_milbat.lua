ITEM.name = "Military Battery"
ITEM.description = "A battery ripped from a T-90. What the hell do you need this for?"
ITEM.model = "models/illusion/eftcontainers/militarybattery.mdl"
ITEM.width = 3
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(720.43, 138.38, 26.02),
	ang = Angle(1.57, 190.86, 0),
	fov = 3.34
}


ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 3x Wood Scrap, and 1x Steel Piece.")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end