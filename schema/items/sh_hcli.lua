ITEM.name = "HCLI Business Card: Koko"
ITEM.model = Model("models/spec45as/stalker/quest/access_card.mdl")
ITEM.description = "A Business Card from H&C Logistic Incorporated, and more specifically, Koko."

ITEM.category = "Black Market"

function ITEM:PopulateTooltip(tooltip)
    local warning = tooltip:AddRow("warning")
	warning:SetBackgroundColor(ix.config.Get("color"))
	warning:SetText("HCLI: Modern Arms for the Modern Age!".."\nKoko Hekmatyar".."\nSat Phone: 8707-0123-4567".."\nHekmaChum Tag: Albino")
	warning:SetFont("DermaDefault")
	warning:SetExpensiveShadow(0.5)
	warning:SizeToContents()
end