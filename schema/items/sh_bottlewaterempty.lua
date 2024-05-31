ITEM.name = "Empty Water Bottle"
ITEM.model = Model("models/hlvr/props/bottles/plastic_bottle_2.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An empty, crumpled up bottle of water."

ITEM.functions.Refill = {
    icon = "icon16/arrow_undo.png",
    OnRun = function(item)
        local client = item.player

        client:SetAction("Refilling...", 5, function()
            client:GetCharacter():GetInventory():Add("dirty_bottlewater", 1)
        end)

        return true
    end,
    OnCanRun = function(item)
        local client = item.player

        return client:WaterLevel() > 0
    end
}