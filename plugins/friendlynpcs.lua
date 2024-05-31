local PLUGIN = PLUGIN
PLUGIN.name = "Smart Combine NPC's"
PLUGIN.description = "Fixes certian npc's getting angy at MPF"
PLUGIN.author = "liquid, Ghost"

if not SERVER then return end

function PLUGIN:Think()
    self.nextRunTime = self.nextRunTime or 0
    if self.nextRunTime > CurTime() then return end
    self.nextRunTime = CurTime() + 0.5

    local friendlyNPCs = {
        "npc_combine_camera",
        "npc_manhack",
        "npc_turret_floor",
        "npc_turret_ceiling"
    }

    for _, className in ipairs(friendlyNPCs) do
        for _, npc in ipairs(ents.FindByClass(className)) do
            for _, ply in ipairs(player.GetAll()) do
                npc:AddEntityRelationship( ply, (ply:IsCombine() or ply:IsDispatch() or ply:Team() == FACTION_STAFF) and D_LI or D_FR, 99)
            end
        end
    end
end
