local profile = {};
local sets = {
    ['Idle'] = {
        Head = 'Drachen Armet',
        Neck = 'Spike Necklace',
        Ear1 = 'Coral Earring',
        Ear2 = 'Coral Earring',
        Body = 'Drachen Mail',
        Hands = 'Drachen Fng. Gnt.',
        Ring1 = 'Ametrine Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Jaguar Mantle',
        Waist = 'Life Belt',
        Legs = 'Drachen Brais',
        Feet = 'Drachen Greaves',
    },
    ['Engaged'] = {
        Head = 'Walkure Mask',
        Neck = 'Spike Necklace',
        Ear1 = 'Coral Earring',
        Ear2 = 'Coral Earring',
        Body = 'Assault Jerkin',
        Hands = 'Drachen Fng. Gnt.',
        Ring1 = 'Ametrine Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Jaguar Mantle',
        Waist = 'Life Belt',
        Legs = 'Drachen Brais',
        Feet = 'Drachen Greaves',
    },
    ['HighDefense'] = {
    },
    ['Resting'] = {},
    ['FastCast'] = {},
    ['JAAncientCircle'] = {
        Legs = 'Drachen Brais',
    },
    ['JACallWyvern'] = {},
    ['JAJump'] = {
        Head = 'Drachen Armet',
        Neck = 'Spike Necklace',
        Ear1 = 'Coral Earring',
        Ear2 = 'Coral Earring',
        Body = 'Drachen Mail',
        Hands = 'Drachen Fng. Gnt.',
        Ring1 = 'Ametrine Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Jaguar Mantle',
        Waist = 'Life Belt',
        Legs = 'Drachen Brais',
        Feet = 'Drachen Greaves',
    },
    ['WSBase'] = {
        Head = 'Drachen Armet',
        Neck = 'Spike Necklace',
        Ear1 = 'Coral Earring',
        Ear2 = 'Coral Earring',
        Body = 'Drachen Mail',
        Hands = 'Drachen Fng. Gnt.',
        Ring1 = 'Ametrine Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Jaguar Mantle',
        Waist = 'Life Belt',
        Legs = 'Drachen Brais',
        Feet = 'Drachen Greaves',
    },
    ['WSPhysical'] = {},
    ['WSMagical'] = {},
    ['WSBreath'] = {},
    ['MagBreathTrigger'] = {
        Head = 'Drachen Armet',
    },
    ['PetHealingBreathBonus'] = {
        Head = 'Drachen Armet',
        Body = 'Wyvern Mail',
        Legs = 'Drachen Brais',
    },
};
profile.Sets = sets;

-----------------------------------------------------------------------------------
-- Abilities table(s)
-----------------------------------------------------------------------------------
local Abilities = {};

-- Jumps
Abilities.Jumps = {
    ['High Jump'] = true,
    ['Jump'] = true,
}

-----------------------------------------------------------------------------------
-- Jobs Table(s)
-----------------------------------------------------------------------------------
local Jobs = {};

-- Defensive jobs skills
Jobs.Defensive = {
    ['BLM'] = true,
    ['BLU'] = true,
    ['GEO'] = true,
    ['RDM'] = true,
    ['SCH'] = true,
    ['SMN'] = true,
    ['WHM'] = true,
};

-- Hybrid jobs skills
Jobs.Hybrid = {
    ['BRD'] = true,
    ['DRK'] = true,
    ['NIN'] = true,
    ['PLD'] = true,
    ['RUN'] = true,
};

-----------------------------------------------------------------------------------
-- Pet abilities table(s)
-----------------------------------------------------------------------------------
local PetAbilities = {};

PetAbilities.HealingBreath = {
    ['Healing Breath I'] = true,
    ['Healing Breath II'] = true,
    ['Healing Breath III'] = true,
}

-----------------------------------------------------------------------------------
-- Spells table(s)
-----------------------------------------------------------------------------------
local Spells = {};

-- Healing breath triggers
Spells.HealingBreathTriggers = {
    ['Dia'] = true,
}

-----------------------------------------------------------------------------------
-- Weapon skill Table(s)
-----------------------------------------------------------------------------------
local WeaponSkills = {};

-- Physical weapon skills
WeaponSkills.Physical = {
    ['Double Thrust'] = true,
    ['Leg Sweep'] = true,
    ['Penta Thrust'] = true,
    ['Vorpal Thrust'] = true,
    ['Skewer'] = true,
    ['Wheeling Thrust'] = true,
    ['Impulse Drive'] = true,
    ['Sonic Thrust'] = true,
    ['Stardiver'] = true,
    ['Geirskogul'] = true,
    ['Camlann\'s Torment'] = true,
    ['Drakesbane'] = true,
};

-- Magical weapon skills
WeaponSkills.Magical = {
    ['Thunder Thrust'] = true,
    ['Raiden Thrust'] = true,
};

-----------------------------------------------------------------------------------
-- Global settings
-----------------------------------------------------------------------------------
local Settings = {
    CurrentLevel  = 0,
};

-- Start of the profile functions
profile.Packer = {
};

-----------------------------------------------------------------------------------
-- Handle pet actions
-----------------------------------------------------------------------------------
local function HandlePetAction(action)

    if (PetAbilities.HealingBreath[action.Name]) then
        gFunc.EquipSet(sets.PetHealingBreathBonus);
    end

end

-----------------------------------------------------------------------------------
-- Handle turtle mode
-----------------------------------------------------------------------------------
local function HandleTurtleMode(player)

    if (player.HPP <= 25) then
        gFunc.EquipSet(sets.HighDefense);
    end

end

-----------------------------------------------------------------------------------
-- Profile loads
-----------------------------------------------------------------------------------
profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

-----------------------------------------------------------------------------------
-- Profile unloads
-----------------------------------------------------------------------------------
profile.OnUnload = function()
end

-----------------------------------------------------------------------------------
-- When a manual command is sent to Ashitacast
-----------------------------------------------------------------------------------
profile.HandleCommand = function(args)
end

-----------------------------------------------------------------------------------
-- When an action is complete and the character resets to a default state
-----------------------------------------------------------------------------------
profile.HandleDefault = function()
    
    -- Get the required data table(s)
    local player = gData.GetPlayer();
    local petAction = gData.GetPetAction();

    -- Evaluate pet actions before anything else
    if (petAction ~= nil) then
        HandlePetAction(petAction);
        return;
    end

    -- Evaluate for level sync
    local curLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (curLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, curLevel);
        Settings.CurrentLevel = curLevel;
    end
    
    -- When engaged
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Engaged);

    -- When resting
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);

    -- All other statuses
    else
        gFunc.EquipSet(sets.Idle);

    end

    -- Turtle mode override
    HandleTurtleMode(player);

end

-----------------------------------------------------------------------------------
-- When job abilities are triggered
-----------------------------------------------------------------------------------
profile.HandleAbility = function()

    -- Get the required data table(s)
    local action = gData.GetAction();
    local player = gData.GetPlayer();

    -- Ancient Circle
    if (action.Name == 'Ancient Circle') then
        gFunc.EquipSet(sets.JAAncientCircle);

    -- Call Wyvern
    elseif (action.Name == 'Call Wyvern') then
        gFunc.EquipSet(sets.JACallWyvern);

    -- Jumps
    elseif (Abilities.Jumps[action.Name]) then
        gFunc.EquipSet(sets.JAJump);

    end

    -- Turtle mode override
    HandleTurtleMode(player);

end

-----------------------------------------------------------------------------------
-- When items are used
-----------------------------------------------------------------------------------
profile.HandleItem = function()
end

-----------------------------------------------------------------------------------
-- Before casting begins
-----------------------------------------------------------------------------------
profile.HandlePrecast = function()

    -- Equip fast cast set
    gFunc.EquipSet(sets.FastCast);

    -- Turtle mode override
    local player = gData.GetPlayer();
    HandleTurtleMode(player);

end

-----------------------------------------------------------------------------------
-- When a spell is cast
-----------------------------------------------------------------------------------
profile.HandleMidcast = function()

    -- Get the required data table(s)
    local action = gData.GetAction();
    local player = gData.GetPlayer();

    -- Check if the spell is a breath trigger
    if (Spells.HealingBreathTriggers[action.Name]) then

        -- If the subjob is defensive
        if (Jobs.Defensive[player.SubJob]) then
            if (player.HPP <= 50) then
                gFunc.EquipSet(sets.MagBreathTrigger);
            end

        -- If the subjob is hybrid
        elseif (Jobs.Defensive[player.SubJob]) then
            if (player.HPP <= 33) then
                gFunc.EquipSet(sets.MagBreathTrigger);
            end

        end

    end

end

-----------------------------------------------------------------------------------
-- Before a shot is taken
-----------------------------------------------------------------------------------
profile.HandlePreshot = function()
end

-----------------------------------------------------------------------------------
-- When a shot is taken
-----------------------------------------------------------------------------------
profile.HandleMidshot = function()
end

-----------------------------------------------------------------------------------
-- When a weapons skill is triggered
-----------------------------------------------------------------------------------
profile.HandleWeaponskill = function()

    -- Get the required data table(s)
    local action = gData.GetAction();
    local player = gData.GetPlayer();

    -- Physical weapon skill
    if (WeaponSkills.Physical[action.Name]) then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.WSBase,
                sets.WSPhysical
            )
        );

    -- Magical weapon skill
    elseif (WeaponSkills.Magical[action.Name]) then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.WSBase,
                sets.WSMagical
            )
        );

    end

    -- Turtle mode override
    HandleTurtleMode(player);

end

return profile;