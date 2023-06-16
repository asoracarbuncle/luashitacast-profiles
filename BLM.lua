local profile = {};
profile.Sets = {
    ['Idle_Priority'] = {
        Main = { 'Mythic Wand', 'Ebony Wand +1', 'Solid Wand', 'Yew Wand +1' },
        Neck = 'Black Neckerchief',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Mage\'s Tunic',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Black Cape',
        Legs = 'Mage\'s Slacks',
        Feet = 'Solea',
    },
    ['Resting'] = {},
    ['Engaged'] = {},
    ['FastCast'] = {},
    ['MagBase'] = {},
    ['MagDivine'] = {},
    ['MagHealing'] = {
        Neck = 'Justice Badge',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        Back = 'Mist Silk Cape',
    },
    ['MagEnhancing'] = {},
    ['MagEnfeeblingBase_Priority'] = {
        Main = { 'Mythic Wand', 'Ebony Wand +1', 'Solid Wand', 'Yew Wand +1' },
        Neck = 'Black Neckerchief',
        Body = 'Mage\'s Tunic',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
        Legs = 'Mage\'s Slacks',        
    },
    ['MagEnfeeblingLight'] = {},
    ['MagEnfeeblingDark'] = {},
    ['MagElemental_Priority'] = {
        Main = { 'Mythic Wand', 'Ebony Wand +1', 'Solid Wand', 'Yew Wand +1' },
        Neck = 'Black Neckerchief',
        Body = 'Mage\'s Tunic',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
        Back = 'Black Cape',
        Legs = 'Mage\'s Slacks',    
    },
    ['MagDark_Priority'] = {
        Main = { 'Mythic Wand', 'Ebony Wand +1', 'Solid Wand', 'Yew Wand +1' },
        Neck = 'Black Neckerchief',
        Body = 'Mage\'s Tunic',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
        Back = 'Black Cape',
        Legs = 'Mage\'s Slacks',    
    },
    ['UtilConserveMP'] = {},
    ['UtilFishing'] = {
        Body = 'Fsh. Tunica',
        Hands = 'Fsh. Gloves',
        Legs = 'Fisherman\'s Hose',
        Feet = 'Fisherman\'s Boots',
    },
};

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
WeaponSkills.Physical = {};

-- Magical weapon skills
WeaponSkills.Magical = {};

-- Breath weapon skills
WeaponSkills.Breath = {};

-- Settings
local Settings = {
    IsFishing = false
};

-- Start of the profile functions
profile.Packer = {
};

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

    -- Get the required data table(s)
    local player = gData.GetPlayer();

    -- Evaluate for level sync
    local curLevel = player.MainJobLevel;
    if (curLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, curLevel);
        Settings.CurrentLevel = curLevel;
    end

    -- When engaged
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(profile.Sets.Engaged);

    -- When resting
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(profile.Sets.Resting);

    -- All other statuses
    else
        if (Settings.IsFishing == true) then
            gFunc.EquipSet(profile.Sets.UtilFishing);
        else
            gFunc.EquipSet(profile.Sets.Idle);
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
    gFunc.EquipSet(profile.Sets.FastCast);
end

-- When a spell is cast
profile.HandleMidcast = function()

    -- Get the action table
    local action = gData.GetAction();

    -- Divine Magic
    if (action.Skill == 'Divine Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.MagBase,
                profile.Sets.MagDivine
            )
        );

    -- Healing Magic
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.MagBase,
                profile.Sets.MagHealing
            )
        );

    -- Enhancing Magic
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.MagBase,
                profile.Sets.MagEnhancing
            )
        );

    -- Enfeebling Magic
    elseif (action.Skill == 'Enfeebling Magic') then

        -- Light Enfeebles
        if (action.Type == "White Magic") then
            gFunc.EquipSet(
                gFunc.Combine(
                    profile.Sets.MagBase,
                    gFunc.Combine(
                        profile.Sets.MagEnfeeblingBase,
                        profile.Sets.MagEnfeeblingLight
                    )
                )
            );

        -- Dark Enfeebles
        else
            gFunc.EquipSet(
                gFunc.Combine(
                    profile.Sets.MagBase,
                    gFunc.Combine(
                        profile.Sets.MagEnfeeblingBase,
                        profile.Sets.MagEnfeeblingDark
                    )
                )
            );
        end
    
    -- Elemental Magic
    elseif (action.Skill == 'Elemental Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.MagBase,
                profile.Sets.MagElemental
            )
        );

    -- Dark Magic
    elseif (action.Skill == 'Dark Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.MagBase,
                profile.Sets.MagDark
            )
        );

    end

    -- Conserve MP overrides
    if (Spells.ConserveMP[action.Name]) then
        gFunc.EquipSet(profile.Sets.UtilConserveMP);
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
end

return profile;