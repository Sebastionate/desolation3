ITEM.name = "Gun Powder"
ITEM.description = "An 'Eagle' brand gunpowder canister. Can be used to reload ammunition."
ITEM.model = "models/illusion/eftcontainers/gpred.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(732.24, 29.49, -6.44),
	ang = Angle(-0.91, 182.3, 0),
	fov = 0.43
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