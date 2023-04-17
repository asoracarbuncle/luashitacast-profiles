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
    ['Resting'] = {},
    ['FastCast'] = {},
    ['JAAncientCircle'] = {
        Legs = 'Drachen Brais',
    },
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
    ['MagHealing'] = {
        Head = 'Drachen Armet',
    },
    ['BreathBonus'] = {
        Head = 'Drachen Armet',
        Body = 'Wyvern Mail',
        Legs = 'Drachen Brais',
    },
};
profile.Sets = sets;

-- Abilities table(s)
local PetAbilities = {};

-- Wyvern breath
PetAbilities.WyvernBreath = {
    ['Flame Breath '] = true,
    ['Frost Breath '] = true,
    ['Sand Breath '] = true,
    ['Hydro Breath '] = true,
    ['Gust Breath '] = true,
    ['Lightning Breath '] = true,
    ['Healing Breath I '] = true,
    ['Healing Breath II '] = true,
    ['Healing Breath III '] = true,
}

-- Weapon Skill Table(s)
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

-- Settings
local Settings = {
    CurrentLevel  = 0,
};

-- Start of the profile functions
profile.Packer = {
};

-- Handle pet actions
local function HandlePetAction(petAction)

    if PetAbilities.WyvernBreath[petAction.Name] then
        gFunc.EquipSet(sets.BreathBonus);
    end

end

-- When the profile loads
profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

-- When the profile unloads
profile.OnUnload = function()
end

-- When a manual command is sent to Ashitacast
profile.HandleCommand = function(args)
end

-- When an action is complete and the character resets to a default state
profile.HandleDefault = function()

    -- Evaluate pet actions before anything else
    local petAction = gData.GetPetAction();
    if (petAction ~= nil) then
        HandlePetAction(petAction);
        return;
    end
    
    -- Get the player table
    local player = gData.GetPlayer();

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

end

-- When job abilities are triggered
profile.HandleAbility = function()

    -- Get the action table
    local action = gData.GetAction();

    -- Equip the appropriate gear
    if (action.Name == 'Ancient Circle') then
        gFunc.EquipSet(sets.JAAncientCircle);
    elseif (action.Name == 'Jump') then
        gFunc.EquipSet(sets.JAJump);
    end
    
end

-- When items are used
profile.HandleItem = function()
end

-- Before casting begins
profile.HandlePrecast = function()
    gFunc.EquipSet(sets.FastCast);
end

-- When a spell is cast
profile.HandleMidcast = function()

    -- Get the action table
    local action = gData.GetAction();

    -- Healing Magic
    if (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.MagHealing);
    end

end

-- Before a shot is taken
profile.HandlePreshot = function()
end

-- When a shot is taken
profile.HandleMidshot = function()
end

-- When a weapons skill is triggered
profile.HandleWeaponskill = function()

    -- Get the action table
    local action = gData.GetAction();

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

    -- Breath weapon skill
    elseif (WeaponSkills.Breath[action.Name]) then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.WSBase,
                sets.WSBreath
            )
        );
    
    end

end

return profile;