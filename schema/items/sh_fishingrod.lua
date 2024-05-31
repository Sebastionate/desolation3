ITEM.name = "Fishing Rod"
ITEM.model = Model("models/oldprops/fishing_rod.mdl")
ITEM.width = 1
ITEM.height = 4
ITEM.description = "A long, flexible rod used by fishermen to catch fish."
ITEM.iconCam = {
	pos = Vector(612.46868896484, 512.35681152344, 395.72152709961),
	ang = Angle(25, 220, 0),
	fov = 1,
}
ITEM.price = 20

ix.config.Add("fishingDuration", 10, "The number of seconds a player has to fish for.", nil, {
    data = {min = 1, max = 60},
    category = "fishing"
})

ix.config.Add("fishingPercent", 0.05, "The percent taken away from a fishing rod's durability everytime.", nil, {
    data = {min = 0.01, max = 1, decimals = 2},
    category = "fishing"
})

ix.config.Add("fishingChance", 25, "The chance you successfully catch a fish.", nil, {
    data = {min = 1, max = 100},
    category = "fishing"
})

function ITEM:PaintOver(item, w, h)
    local durability = item:GetData("durability", 1)

    if durability then
        surface.SetDrawColor(HSVToColor((.25 * 360) * durability, 1, 1))
        surface.DrawRect(2, h - 4, (w - 4) * durability, 2)
    end
end

function ITEM:PopulateTooltip(tooltip)
    local amount = self:GetData("durability", 1)

    local durability = tooltip:AddRow("durability")
    durability:SetText("Durability")
    durability:SetImportant()
    durability:SizeToContents()

    local left = tooltip:AddRowAfter("durability", "durabilityLeft")
    left:SetText("Durability left: " .. amount * 100 .. "%")
    left:SetBackgroundColor(HSVToColor((.25 * 360) * amount, 1, 1))
    left:SizeToContents()

    local cost = tooltip:AddRowAfter("durabilityLeft", "durabilityCost")
    cost:SetText("Durability lost after use: " .. ix.config.Get("fishingPercent") * 100 .. "%")
    cost:SizeToContents()
end

ITEM.functions.Fish = {
    icon = "icon16/anchor.png",
    OnRun = function(item)
        local client = item.player

        math.randomseed(os.time())
        client:EmitSound("fishing_reel0" .. math.random(1, 2) .. ".wav", 75, 115, 0.45)

        item.beingUsed = true

        client:SetAction("Fishing...", ix.config.Get("fishingDuration"), function()
            item.beingUsed = false

            local chance = math.random(1, 100)

            if chance > ix.config.Get("fishingChance") then
                client:Notify("You were not able to catch a fish.")
            else
                client:GetCharacter():GetInventory():Add("fishraw", 1)
                client:Notify("You caught a fish!")
            end
        end)

        local useAmount = item:GetData("durability", 1) - ix.config.Get("fishingPercent")

        item:SetData("durability", useAmount)

        if useAmount <= 0 then
            client:Notify("Your fishing rod has broken!")
            return true
        end

        return false
    end,
    OnCanRun = function(item)
        local client = item.player

        return not item.beingUsed and client:WaterLevel() > 0
    end
}