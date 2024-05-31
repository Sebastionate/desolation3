ITEM.name = "Plastic Chunk"
ITEM.description = "A chunk of plastic melted into a blob."
ITEM.model = "models/props_combine/breenbust_chunk03.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.iconCam = {
	pos = Vector(57.42, 19.54, -710.16),
	ang = Angle(-85.31, 199.6, 0),
	fov = 0.76
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