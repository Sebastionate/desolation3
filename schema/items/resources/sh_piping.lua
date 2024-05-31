ITEM.name = "Metal Pipe"
ITEM.description = "A section of pipe. Looks like it could be used for smashing in skulls, or some home improvment."
ITEM.model = Model("models/props_canal/mattpipe.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.category = "Materials"
ITEM.iconCam = {
	pos = Vector(-3.78, 199.96, 1.31),
	ang = Angle(1.23, 271.31, 0),
	fov = 4.99
}


function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("This item can be broken down into 2x Steel Pieces.")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end