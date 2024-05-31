local PLUGIN = PLUGIN
PLUGIN.name = "Hunger/Thirst"
PLUGIN.author = "liquid"
PLUGIN.description = "Makes you shitty opressed beings starve to death."

ix.config.Add("hungerSystemEnabled", ix.config.Get("hungerSystemEnabled", true), "", nil, {
	category = "Hunger/Thirst"
})

ix.config.Add("hungerMax", ix.config.Get("hungerMax", 100), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("startingHunger", ix.config.Get("startingHunger", 100), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("hungerLossPerHour", ix.config.Get("hungerLossPerHour", 100), "", nil, {
	data = {min = 1, max = 1000},
	category = "Hunger/Thirst"
})

ix.config.Add("hungerHealthLossPerMinute", ix.config.Get("hungerHealthLossPerMinute", 20), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("hungerConsumeScale", ix.config.Get("hungerConsumeScale", 1), "Scales hunger consumption amount.", nil, {
	data = {min = 0, max = 10, decimals=2},
	category = "Hunger/Thirst"
})

ix.config.Add("hungerBuddhaThreshold", ix.config.Get("hungerBuddhaThreshold", 1), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("hungerNotificationThreshold", ix.config.Get("hungerNotificationThreshold", 25), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("thirstMax", ix.config.Get("thirstMax", 100), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("startingThirst", ix.config.Get("startingThirst", 100), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("thirstLossPerHour", ix.config.Get("thirstLossPerHour", 125), "", nil, {
	data = {min = 1, max = 1000},
	category = "Hunger/Thirst"
})

ix.config.Add("thirstHealthLossPerMinute", ix.config.Get("thirstHealthLossPerMinute", 20), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("thirstConsumeScale", ix.config.Get("thirstConsumeScale", 1), "Scales thirst consumption amount.", nil, {
	data = {min = 0, max = 10, decimals=2},
	category = "Hunger/Thirst"
})

ix.config.Add("thirstBuddhaThreshold", ix.config.Get("thirstBuddhaThreshold", 1), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("thirstNotificationThreshold", ix.config.Get("thirstNotificationThreshold", 25), "", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("disableHungerForAfk", ix.config.Get("disableHungerForAfk", true), "", nil, {
    category = "Hunger/Thirst"
})

ix.config.Add("disableHungerForMetropolice", ix.config.Get("disableHungerForAfk", false), "", nil, {
    category = "Hunger/Thirst"
})

ix.config.Add("hungerSystemBuddhaMax", ix.config.Get("hungerSystemBuddhaMax", 25), "Maximum health to go down to.", nil, {
	data = {min = 1, max = 100},
	category = "Hunger/Thirst"
})

ix.config.Add("disableSprintThreshold", ix.config.Get("disableSprintThreshold", 10), "", nil, {
    data = {min = 1, max = 100},
    category = "Hunger/Thirst"
})

local charMeta = ix.meta.character

function charMeta:GetHunger()
    return self:GetPlayer():GetLocalVar("hunger") or ix.config.Get("startingHunger")
end

function charMeta:GetThirst()
    return self:GetPlayer():GetLocalVar("thirst") or ix.config.Get("startingThirst")
end

if CLIENT then
    ix.bar.Add(function()
		return math.min((LocalPlayer():GetLocalVar("hunger") or ix.config.Get("hungerMax", 100)) / ix.config.Get("hungerMax", 100), 1),
        "Hunger"
    end, Color(251,195,109), nil, "hunger")
    
    ix.bar.Add(function()
		return math.min((LocalPlayer():GetLocalVar("thirst") or ix.config.Get("hungerMax", 100)) / ix.config.Get("hungerMax", 100), 1),
        "Thirst"
    end, Color(212,230,255), nil, "thirst")
end

if SERVER then
    function charMeta:SetHunger(hunger)
        hunger = math.min(hunger, ix.config.Get("hungerMax"))
        self:SetData("hunger", hunger)
        self:GetPlayer():SetLocalVar("hunger", hunger)
    end

    function charMeta:SetThirst(thirst)
        thirst = math.min(thirst, ix.config.Get("thirstMax"))
        self:SetData("thirst", thirst)
        self:GetPlayer():SetLocalVar("thirst", thirst)
    end

    function charMeta:SyncHunger()
        local ply = self:GetPlayer()

        ply:SetLocalVar("hunger", self:GetData("hunger"))
        ply:SetLocalVar("thirst", self:GetData("thirst"))
    end

    function PLUGIN:ShouldPlayerDoHunger(ply)
        if not ply:Alive() then return false end

        if ix.config.Get("disableHungerForAfk") then
            if ply.isAFK then return false end
        end
        local playerCount = player.GetCount()
            if playerCount <= ix.config.Get("minimumPlayerRation") then 
            return false
        end

        -- may need to disable for scanners and shit if we disable this
        if ix.config.Get("disableHungerForMetropolice") then
            if ply:IsCombine() then return false end
        end

        local whitelist = {
            FACTION_STAFF,
            FACTION_OTA,
            FACTION_VORT,
            FACTION_FREEVORT,
            FACTION_DISPATCH,
            FACTION_SYNTH,
            FACTION_CIC
        }

        for _, v in pairs(whitelist) do
            local char = ply:GetChar()
            if char != nil then
                if ply:Team() == v then
                    return false,
                    char:SetHunger(100),
                    char:SetThirst(100)
                end
            end
        end

        return true
    end

    function PLUGIN:Think()
        if not ix.config.Get("hungerSystemEnabled") then return end

        self.nextRunTime = self.nextRunTime or 0
        if self.nextRunTime > CurTime() then return end
        self.nextRunTime = CurTime() + 1
    
        for _, v in ipairs(player.GetAll()) do
            if !self:ShouldPlayerDoHunger(v) then
                continue
            end

            local char = v:GetCharacter()
            if not char then continue end
            
            local hourDiv = 1 / 60 / 60
    
            local prevHunger = char:GetData("hunger", ix.config.Get("startingHunger"))
            local hunger = math.max(0, prevHunger - hourDiv * ix.config.Get("hungerLossPerHour"))
            char:SetHunger(hunger)
    
            local prevThirst = char:GetData("thirst", ix.config.Get("startingThirst"))
            local thirst = math.max(0, prevThirst - hourDiv * ix.config.Get("thirstLossPerHour"))
            char:SetThirst(thirst)

            local minDiv = 1 / 60

            if hunger < ix.config.Get("hungerBuddhaThreshold") then
                local health = v:Health()
                if health > ix.config.Get("hungerSystemBuddhaMax") then
                    v.hungerBuddhaAccumulate = (v.hungerBuddhaAccumulate or 0) 
                        + (minDiv * ix.config.Get("hungerHealthLossPerMinute"))
                    
                    if v.hungerBuddhaAccumulate >= 1 then
                        v:SetHealth(health - v.hungerBuddhaAccumulate)
                        v.hungerBuddhaAccumulate = 0
                    end
                end
            end

            if thirst < ix.config.Get("thirstBuddhaThreshold") then
                local health = v:Health()
                if health > ix.config.Get("hungerSystemBuddhaMax") then
                    v.thirstBuddhaAccumulate = (v.thirstBuddhaAccumulate or 0) 
                        + (minDiv * ix.config.Get("thirstHealthLossPerMinute"))

                    if v.thirstBuddhaAccumulate >= 1 then
                        v:SetHealth(health - v.thirstBuddhaAccumulate)
                        v.thirstBuddhaAccumulate = 0
                    end
                end
            end

            -- this is all shitcode sorry

            if hunger > ix.config.Get("hungerNotificationThreshold") then
                char:SetData("noHungerNotify", false)
            end

            if hunger <= ix.config.Get("hungerNotificationThreshold") and !char:GetData("noHungerNotify", false) then
                char:SetData("noHungerNotify", true)
                v:Notify("You're feeling hungry.")
            end

            if thirst > ix.config.Get("thirstNotificationThreshold") then
                char:SetData("noThirstNotify", false)
            end

            if thirst <= ix.config.Get("thirstNotificationThreshold") and !char:GetData("noThirstNotify", false) then
                char:SetData("noThirstNotify", true)
                v:Notify("You're feeling hungry.")
            end
        end
    end

    function PLUGIN:PlayerInteractItem(client, action, item) 
        local itemTable = ix.item.list[item.uniqueID]

        local char = client:GetCharacter()
        if not char then return end
        
        action = string.lower(action)

        if action == "eat"
        or action == "drink" then
            if itemTable.hungerAmt ~= nil then
                local hunger = char:GetHunger()
                hunger = hunger + itemTable.hungerAmt * ix.config.Get("hungerConsumeScale")
                char:SetHunger(hunger)
            end

            if itemTable.thirstAmt ~= nil then
                local thirst = char:GetThirst()
                thirst = thirst + itemTable.thirstAmt * ix.config.Get("thirstConsumeScale")
                char:SetThirst(thirst)
            end
        end
    end

    function PLUGIN:PlayerDeath(victim, inflictor, attacker)
        local char = victim:GetCharacter()
        if not char then return end
        
        victim.oldHunger = victim:GetLocalVar("hunger")
        victim.oldThirst = victim:GetLocalVar("thirst")

        char:SetHunger(ix.config.Get("startingHunger"))
        char:SetThirst(ix.config.Get("startingThirst"))
    end
end

function PLUGIN:Move(ply, mv)
    if not ix.config.Get("hungerSystemEnabled") then return end
    if CLIENT and ply ~= LocalPlayer() then return end

    local char = ply:GetCharacter()
    if not char then return end

    local hunger = char:GetHunger()
    local thirst = char:GetThirst()

    if not hunger or not thirst then
        return
    end

    local threshold = ix.config.Get("disableSprintThreshold")

    if hunger < threshold or thirst < threshold then
        mv:SetMaxSpeed(ply:GetWalkSpeed())
    end
end