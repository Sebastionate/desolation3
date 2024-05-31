ITEM.name = "Lock"
ITEM.description = "A metal iron lock with a thick shackel."
ITEM.width = 1
ITEM.height = 1
ITEM.model = "models/props_wasteland/prison_padlock001a.mdl"
ITEM.price = 20

ITEM.functions.Lock = {
    icon = "icon16/lock.png",
    OnRun = function(item)
        local client = item.player
        local container = client:GetEyeTrace().Entity

        client:EmitSound("doors/default_locked.wav")
        client:RequestString("Password", "Please enter a password", function(password)
            if password ~= "" then
                container.Sessions = {}
                container:SetLocked(true)
                container:SetOwnerID(client:GetCharacter():GetID())
                container.password = password
            else return end
        end)
    end,
    OnCanRun = function(item)
        local client = item.player
        local target = client:GetEyeTrace().Entity

        return IsValid(target) and target:GetClass() == "ix_container" and not target:GetLocked()
    end
}