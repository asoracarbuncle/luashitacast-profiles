local profile = {};
local sets = {
    ['Idle_Priority'] = {
        Head = { 'Crow Beret', 'Centurion\'s Visor' },
        Neck = 'Black Neckerchief',
        Ear1 = 'Dodge Earring',
        Ear2 = 'Onyx Earring',
        Body = { 'Crow Jupon', 'Ctr. Scale Mail' },
        Hands = { 'Crow Bracers', 'Ctr. F. Gauntlets' },
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Traveler\'s Mantle',
        Waist = { 'Ryl.Kgt. Belt', 'Warrior\'s Belt' },
        Legs = { 'Crow Hose', 'Ctr. Cuisses' },
        Feet = { 'Warlock\'s Boots', 'Ctr. Greaves' },
    },
    ['Resting'] = {},
    ['Engaged_Priority'] = {
        Main = { 'Crimson Blade', 'Fencing Degen' },
        Head = { 'Crow Beret', 'Centurion\'s Visor' },
        Neck = 'Black Neckerchief',
        Ear1 = 'Dodge Earring',
        Ear2 = 'Onyx Earring',
        Body = { 'Crow Jupon', 'Ctr. Scale Mail' },
        Hands = { 'Crow Bracers', 'Ctr. F. Gauntlets' },
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Traveler\'s Mantle',
        Waist = { 'Ryl.Kgt. Belt', 'Warrior\'s Belt' },
        Legs = { 'Crow Hose', 'Ctr. Cuisses' },
        Feet = { 'Warlock\'s Boots', 'Ctr. Greaves' },
    },
    ['WSBase'] = {},
    ['WSPhysical'] = {
        Ring1 = 'Garnet Ring',
        Ring2 = 'Garnet Ring',
    },
    ['WSMagical'] = {
        Neck = 'Black Neckerchief',
        Body = 'Mage\'s Tunic',
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
        Back = 'Red Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Mage\'s Slacks',
        Feet = 'Warlock\'s Boots',
    },
    ['WSBreath'] = {},
    ['FastCast'] = {},
    ['MagBase'] = {},
    ['MagDivine'] = {},
    ['MagHealing_Priority'] = {
        Main = { 'Ebony Wand +1', 'Solid Wand' },
        Body = 'White Cloak',
        Neck = 'Justice Badge',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        Back = 'Red Cape',
        Waist = 'Ryl.Kgt. Belt',
        Feet = 'Warlock\'s Boots',
    },
    ['MagEnhancing_Priority'] = {
        Main = { 'Ebony Wand +1', 'Solid Wand' },
        Body = 'White Cloak',
        Neck = 'Justice Badge',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        Back = 'Red Cape',
        Waist = 'Ryl.Kgt. Belt',
        Feet = 'Warlock\'s Boots',
    },
    ['MagEnfeeblingBase'] = {},
    ['MagEnfeeblingLight'] = {
        Main = 'Fencing Degen',
        Body = 'White Cloak',
        Neck = 'Justice Badge',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        Back = 'Red Cape',
        Waist = 'Ryl.Kgt. Belt',
        Feet = 'Warlock\'s Boots',
    },
    ['MagEnfeeblingDark_Priority'] = {
        Main = 'Fencing Degen',
        Neck = 'Black Neckerchief',
        Body = 'Mage\'s Tunic',
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
        Back = { 'Red Cape', 'Black Cape' },
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Mage\'s Slacks',
        Feet = 'Warlock\'s Boots',
    },
    ['MagElemental_Priority'] = {
        Main = { 'Ebony Wand +1', 'Solid Wand' },
        Neck = 'Black Neckerchief',
        Body = 'Mage\'s Tunic',
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
        Back = { 'Red Cape', 'Black Cape' },
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Mage\'s Slacks',
        Feet = 'Warlock\'s Boots',
    },
    ['MagDark'] = {},
    ['UtilConserveMP'] = {},
    ['UtilFishing'] = {
        Body = 'Fsh. Tunica',
        Hands = 'Fsh. Gloves',
        Legs = 'Fisherman\'s Hose',
        Feet = 'Fisherman\'s Boots',
    },
};
profile.Sets = sets;

-- Spells table(s)
local Spells = {};

-- Spells whose gear is of no consequence
Spells.ConserveMP = {
    ['Escape'] = true,
    ['Tractor'] = true,
    ['Warp'] = true,
    ['Warp II'] = true,
}

-- Elemental debuffs
Spells.ElementalDebuffs = {
    ['Burn'] = true,
    ['Choke'] = true,
    ['Drown'] = true,
    ['Frost'] = true,
    ['Rasp'] = true,
    ['Shock'] = true,
}

-- Weapon Skill Table(s)
local WeaponSkills = {};

-- Physical weapon skills
WeaponSkills.Physical = {
    ['Fast Blade'] = true,
    ['Flat Blade'] = true,
    ['Circle Blade'] = true,
    ['Vorpal Blade'] = true,
    ['Swift Blade'] = true,
    ['Savage Blade'] = true,
    ['Requiescat'] = true,
    ['Knights of Round'] = true,
    ['Chant du Cygne'] = true,
    ['Death Blossom'] = true,
    ['Expiacion'] = true,
};

-- Magical weapon skills
WeaponSkills.Magical = {
    ['Burning Blade'] = true,
    ['Red Lotus Blade'] = true,
    ['Shining Blade'] = true,
    ['Seraph Blade'] = true,
    ['Sanguine Blade'] = true,
};

-- Breath weapon skills
WeaponSkills.Breath = {
    ['Spirits Within'] = true,
    ['Atonement'] = true,
};

-- Settings
local Settings = {
    CurrentLevel  = 0,
    IsFishing = false,
};

-- Start of the profile functions
profile.Packer = {};

-- When the profile loads
profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

-- When the profile unloads
profile.OnUnload = function()
end

-- When a manual command is sent to Ashitacast
profile.HandleCommand = function(args)

    -- Catch the "fishing" command
    if (args[1] == "fishing") then
        if (Settings.IsFishing == true) then
            Settings.IsFishing = false;
        else
            Settings.IsFishing = true;
        end
    end

end

-- When an action is complete and the character resets to a default state
profile.HandleDefault = function()

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
        if (Settings.IsFishing == true) then
            gFunc.EquipSet(sets.UtilFishing);
        else
            gFunc.EquipSet(sets.Idle);
        end
    end

end

-- When job abilities are triggered
profile.HandleAbility = function()
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

    -- Divine Magic
    if (action.Skill == 'Divine Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                sets.MagDivine
            )
        );

    -- Healing Magic
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                sets.MagHealing
            )
        );

    -- Enhancing Magic
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                sets.MagEnhancing
            )
        );

    -- Enfeebling Magic
    elseif (action.Skill == 'Enfeebling Magic') then

        -- Light Enfeebles
        if (action.Type == "White Magic") then
            gFunc.EquipSet(
                gFunc.Combine(
                    sets.MagBase,
                    gFunc.Combine(
                        sets.MagEnfeeblingBase,
                        sets.MagEnfeeblingLight
                    )
                )
            );

        -- Dark Enfeebles
        else
            gFunc.EquipSet(
                gFunc.Combine(
                    sets.MagBase,
                    gFunc.Combine(
                        sets.MagEnfeeblingBase,
                        sets.MagEnfeeblingDark
                    )
                )
            );
        end
    
    -- Elemental Magic
    elseif (action.Skill == 'Elemental Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                sets.MagElemental
            )
        );

    -- Dark Magic
    elseif (action.Skill == 'Dark Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                sets.MagDark
            )
        );

    end

    -- Conserve MP overrides
    if (Spells.ConserveMP[action.Name]) then
        gFunc.EquipSet(sets.UtilConserveMP);
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