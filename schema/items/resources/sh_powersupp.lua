ITEM.name = "Power Supply"
ITEM.description = "A power supply that can be plugged right into the wall. Commonly used with computers."
ITEM.model = "models/illusion/eftcontainers/powersupplyunit.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(581.61, 447.08, 26.02),
	ang = Angle(1.86, 217.45, 0),
	fov = 0.98
}


ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 2x Steel Pieces, and 1x Wire Bundle")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end