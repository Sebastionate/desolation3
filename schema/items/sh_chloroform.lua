ITEM.name = "Chloroform"
ITEM.description = "A strong chemical that incapacitates a person if inhaled for too long."
ITEM.model = "models/foodnhouseholditems/lemoncleaner.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 50

ITEM.functions.Use = {
    OnRun = function(itemTable)
        local client = itemTable.player
        local data = {}
        data.start = client:GetShootPos()
        data.endpos = data.start + client:GetAimVector() * 96
        data.filter = client
        local target = util.TraceLine(data).Entity

        if (IsValid(target) and target:IsPlayer() and target:GetCharacter() and not target.ixUnconcious and not IsValid(target.ixRagdoll)) then
            itemTable.bBeingUsed = true
            client:SetAction("Incapacitating target.", 5)

            if (target:IsCombine()) then
                Schema:AddCombineDisplayMessage("@cLosingContact", Color(255, 255, 255, 255))
                Schema:AddCombineDisplayMessage("@cLostContact", Color(255, 0, 0, 255))
            end

            client:DoStaredAction(target, function()
                target:SetRagdolled(true, 120)
                target.ixUnconcious = true
                target:Notify("You are incapacitated.")
                itemTable:Remove()
            end, 5, function()
                client:SetAction()
                target:SetAction()
                itemTable.bBeingUsed = false
            end)

            target:SetAction("You are inhaling a strong chemical.", 5)
        else
            itemTable.player:NotifyLocalized("plyNotValid")
        end

        return false
    end,
    OnCanRun = function(itemTable) return not IsValid(itemTable.entity) or itemTable.bBeingUsed end
}