ITEM.name = "Duct Tape"
ITEM.description = "A full roll of duct tape. Useful for all sorts of things."
ITEM.model = ("models/illusion/eftcontainers/ducttape.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Materials"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 2x Plastic Chunks ")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end