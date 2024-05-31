ITEM.name = "HEK-GG PDA"
ITEM.model = Model("models/ug/new/pda.mdl")
ITEM.description = "A datapad used to access the Hek Global Grid. Password locked and will automatically brick when unauthorized access is detected."
ITEM.category = "Black Market"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("Ask an admin to be giving the HEK-GG role in Discord, if you do not already have access.")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end