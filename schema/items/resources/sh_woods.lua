ITEM.name = "Wooden Board"
ITEM.description = "A wooden board. Can be broken down into its constituent parts."
ITEM.model = "models/props_debris/wood_board06a.mdl"
ITEM.width = 1
ITEM.height = 3
ITEM.iconCam = {
	pos = Vector(855.33, 9.83, 276.51),
	ang = Angle(17.91, 180.66, 0),
	fov = 1.45
}

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 4x Wood Scrap")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end