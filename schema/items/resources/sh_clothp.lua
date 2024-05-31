ITEM.name = "Cloth Strip"
ITEM.description = "A strip of cloth torn from a greater whole."
ITEM.model = "models/props_wasteland/prison_toiletchunk01d.mdl"
ITEM.width = 1
ITEM.height = 1

ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This is a base item. It can not be broken down any further.")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end