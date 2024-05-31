ITEM.name = "Mixed Box of Casings"
ITEM.description = "A handful of casings from various calibers. Used to craft ammunition."
ITEM.model = "models/props_junk/cardboard_box004a.mdl"
ITEM.width = 1
ITEM.height = 1

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 1x Steel Piece.")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end