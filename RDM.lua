local profile = {};
local sets = {
    ['Idle_Priority'] = {
        Main = 'Earth Staff',
        Ammo = 'Phtm. Tathlum',
        Head = { 'Warlock\'s Chapeau', 'Crow Beret', 'Centurion\'s Visor' },
        Neck = { 'Evasion Torque', 'Black Neckerchief' },
        Ear1 = 'Dodge Earring',
        Ear2 = 'Geist Earring',
        Body = { 'Warlock\'s Tabard', 'Crow Jupon', 'Ctr. Scale Mail' },
        Hands = { 'Warlock\'s Gloves', 'Crow Bracers', 'Ctr. F. Gauntlets' },
        Ring1 = { 'Jadeite Ring', 'Tourmaline Ring' },
        Ring2 = { 'Jadeite Ring', 'Tourmaline Ring' },
        Back = { 'Nomad\'s Mantle +1', 'Traveler\'s Mantle' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt', 'Warrior\'s Belt' },
        Legs = { 'Warlock\'s Tights', 'Crow Hose', 'Ctr. Cuisses' },
        Feet = { 'Warlock\'s Boots', 'Crow Gaiters', 'Ctr. Greaves' },
    },
    ['Resting'] = {
        Main = 'Dark Staff',
        Neck = 'Checkered Scarf',
        Body = 'Errant Hpl.',
    },
    ['Engaged_Priority'] = {
        Main = { 'Cermet Sword', 'Crimson Blade', 'Fencing Degen' },
        Sub = { 'Msk.Cmd. Shield', 'Ryl.Sqr. Shield' },
        Ammo = 'Phtm. Tathlum',
        Head = { 'Warlock\'s Chapeau', 'Crow Beret', 'Centurion\'s Visor' },
        Neck = { 'Evasion Torque', 'Black Neckerchief' },
        Ear1 = 'Dodge Earring',
        Ear2 = 'Geist Earring',
        Body = { 'Warlock\'s Tabard', 'Crow Jupon', 'Ctr. Scale Mail' },
        Hands = { 'Warlock\'s Gloves', 'Crow Bracers', 'Ctr. F. Gauntlets' },
        Ring1 = { 'Jadeite Ring', 'Tourmaline Ring' },
        Ring2 = { 'Jadeite Ring', 'Tourmaline Ring' },
        Back = { 'Nomad\'s Mantle +1', 'Traveler\'s Mantle' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt', 'Warrior\'s Belt' },
        Legs = { 'Warlock\'s Tights', 'Crow Hose', 'Ctr. Cuisses' },
        Feet = { 'Warlock\'s Boots', 'Crow Gaiters', 'Ctr. Greaves' },
    },
    ['WSBase'] = {},
    ['WSPhysical'] = {
        Ring1 = 'Garnet Ring',
        Ring2 = 'Garnet Ring',
    },
    ['WSMagical_Priority'] = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Black Neckerchief',
        Ear1 = 'Morion Earring',
        Ear2 = 'Morion Earring',
        Ring1 = { 'Zircon Ring', 'Eremite\'s Ring' },
        Ring2 = { 'Zircon Ring', 'Eremite\'s Ring' },
        Back = { 'Red Cape +1', 'Black Cape' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt' },
        Legs = { 'Magic Cuisses', 'Mage\'s Slacks' },
        Feet = 'Warlock\'s Boots',
    },
    ['WSBreath'] = {},
    ['FastCast'] = {
        Head = 'Warlock\'s Chapeau',
    },
    ['MagBase'] = {},
    ['MagDivine'] = {},
    ['MagHealing_Priority'] = {
        Main = { 'Mythic Wand', 'Ebony Wand +1', 'Solid Wand' },
        Body = { 'Errant Hpl.', 'White Cloak' },
        Neck = 'Justice Badge',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Ring1 = { 'Aquamarine Ring', 'Saintly Ring' },
        Ring2 = { 'Aquamarine Ring', 'Saintly Ring' },
        Back = { 'Red Cape +1', 'Mist Silk Cape' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt' },
        Legs = 'Warlock\'s Tights',
        Feet = 'Warlock\'s Boots',
    },
    ['MagEnhancing_Priority'] = {
        Main = { 'Mythic Wand', 'Ebony Wand +1', 'Solid Wand' },
        Body = { 'Errant Hpl.', 'White Cloak' },
        Neck = 'Enhancing Torque',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Ring1 = { 'Aquamarine Ring', 'Saintly Ring' },
        Ring2 = { 'Aquamarine Ring', 'Saintly Ring' },
        Back = { 'Red Cape +1', 'Mist Silk Cape' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt' },
        Legs = 'Warlock\'s Tights',
        Feet = 'Warlock\'s Boots',
    },
    ['MagEnfeeblingBase'] = {},
    ['MagEnfeeblingLight_Priority'] = {
        Main = 'Fencing Degen',
        Body = { 'Warlock\'s Tabard', 'White Cloak' },
        Head = 'Warlock\'s Chapeau',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Ring1 = { 'Aquamarine Ring', 'Saintly Ring' },
        Ring2 = { 'Aquamarine Ring', 'Saintly Ring' },
        Back = { 'Red Cape +1', 'Mist Silk Cape' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt' },
        Feet = 'Warlock\'s Boots',
    },
    ['MagEnfeeblingDark_Priority'] = {
        Main = 'Fencing Degen',
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Morion Earring',
        Ear2 = 'Morion Earring',
        Body = { 'Warlock\'s Tabard', 'Mage\'s Tunic' },
        Ring1 = { 'Zircon Ring', 'Eremite\'s Ring' },
        Ring2 = { 'Zircon Ring', 'Eremite\'s Ring' },
        Back = { 'Red Cape +1', 'Black Cape' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt' },
        Legs = 'Mage\'s Slacks',
        Feet = 'Warlock\'s Boots',
    },
    ['MagElemental_Priority'] = {
        Main = { 'Mythic Wand', 'Ebony Wand +1', 'Solid Wand' },
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = { 'Philomath Stole', 'Black Neckerchief' },
        Ear1 = 'Morion Earring',
        Ear2 = 'Morion Earring',
        Body = 'Errant Hpl.',
        Ring1 = { 'Zircon Ring', 'Eremite\'s Ring' },
        Ring2 = { 'Zircon Ring', 'Eremite\'s Ring' },
        Back = { 'Red Cape +1', 'Black Cape' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt' },
        Legs = { 'Magic Cuisses', 'Mage\'s Slacks' },
        Feet = 'Warlock\'s Boots',
    },
    ['MagDark'] = {
        Main = 'Dark Staff',
    },
    ['UtilConserveMP'] = {
        Body = 'Warlock\'s Tabard',
    },
    ['UtilCurePotency'] = {
        Main = 'Light Staff',
    },
    ['UtilFishing'] = {
        Body = 'Fsh. Tunica',
        Hands = 'Fsh. Gloves',
        Legs = 'Fisherman\'s Hose',
        Feet = 'Fisherman\'s Boots',
    },
    ['UtilHighMP'] = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Warlock\'s Tabard',
        Hands = 'Warlock\'s Gloves',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',
        Feet = 'Warlock\'s Boots',
    },
    ['UtilInvisSneak'] = {
        Back = 'Skulker\'s Cape',
    },
    ['UtilLowMP'] = {
        Neck = 'Uggalepih Pendant',
    },
    ['UtilMelee_Priority'] = {
        Main = { 'Cermet Sword', 'Crimson Blade', 'Fencing Degen' },
        Sub = { 'Msk.Cmd. Shield', 'Ryl.Sqr. Shield' },
    },
    ['UtilMagDark'] = {
        Main = 'Dark Staff',
    },
    ['UtilMagEarth'] = {
        Main = 'Earth Staff',
    },
    ['UtilMagFire'] = {
        Main = 'Fire Staff',
    },
    ['UtilMagIce'] = {
        Main = 'Ice Staff',
    },
    ['UtilMagLight'] = {
        Main = 'Light Staff',
    },
    ['UtilMagThunder'] = {
        Main = 'Thunder Staff',
    },
    ['UtilMagWater'] = {
        Main = 'Water Staff',
    },
    ['UtilMagWind'] = {
        Main = 'Wind Staff',
    },
    ['nuking2'] = {
        Main = 'Earth Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Philomath Stole',
        Ear1 = 'Dodge Earring',
        Ear2 = 'Geist Earring',
        Body = 'Warlock\'s Tabard',
        Hands = 'Warlock\'s Gloves',
        Ring1 = 'Jadeite Ring',
        Ring2 = 'Jadeite Ring',
        Back = 'Nomad\'s Mantle +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',
        Feet = 'Warlock\'s Boots',
    },
};
profile.Sets = sets;
profile.Packer = {};

-----------------------------------------------------------------
-- Cure spells
-----------------------------------------------------------------
local Spells = {};
Spells.Cures = {
    ['Cure'] = true,
    ['Cure II'] = true,
    ['Cure III'] = true,
    ['Cure IV'] = true,
    ['Cure V'] = true,
    ['Cure VI'] = true,
    ['Curaga'] = true,
    ['Curaga II'] = true,
    ['Curaga III'] = true,
    ['Curaga IV'] = true,
    ['Curaga V'] = true,
    ['Cura'] = true,
    ['Cura II'] = true,
    ['Cura III'] = true,
}

-----------------------------------------------------------------
-- Invisible and Sneak spells
-----------------------------------------------------------------
Spells.InvisSneak = {
    ['Invisible'] = true,
    ['Sneak'] = true,
}

-----------------------------------------------------------------
-- Spells whose gear is of no consequence
-----------------------------------------------------------------
Spells.ConserveMP = {
    ['Escape'] = true,
    ['Tractor'] = true,
    ['Warp'] = true,
    ['Warp II'] = true,
}

-----------------------------------------------------------------
-- Physical weapon skills
-----------------------------------------------------------------
local WeaponSkills = {};
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

-----------------------------------------------------------------
-- Magical weapon skills
-----------------------------------------------------------------
WeaponSkills.Magical = {
    ['Burning Blade'] = true,
    ['Red Lotus Blade'] = true,
    ['Shining Blade'] = true,
    ['Seraph Blade'] = true,
    ['Sanguine Blade'] = true,
};

-----------------------------------------------------------------
-- Breath weapon skills
-----------------------------------------------------------------
WeaponSkills.Breath = {
    ['Spirits Within'] = true,
    ['Atonement'] = true,
};

-----------------------------------------------------------------
-- Settings
-----------------------------------------------------------------
local Settings = {
    CurrentLevel  = 0,
    IsMeleeMode = false,
    IsHighMPMode = false,
    IsFishingMode = false,
};

-----------------------------------------------------------------
-- Start of the profile functions
-----------------------------------------------------------------
profile.Packer = {};

-----------------------------------------------------------------
-- When the profile loads
-----------------------------------------------------------------
profile.OnLoad = function()

    -- Allow the addset command
    gSettings.AllowAddSet = true;

    -- Register keybinds
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /lac fwd meleemode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /lac fwd highmpmode');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F11 /lac fwd fishingmode');

end

-----------------------------------------------------------------
-- When the profile unloads
-----------------------------------------------------------------
profile.OnUnload = function()

    -- Unregister keybinds
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F9');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F10');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind F11');

end

-----------------------------------------------------------------
-- When a manual command is sent to Ashitacast
-----------------------------------------------------------------
profile.HandleCommand = function(args)

    -- Catch the "meleemode" command
    if (args[1] == "meleemode") then
        if (Settings.IsMeleeMode == true) then
            Settings.IsMeleeMode = false;
            gFunc.Message('Melee Mode: OFF');    
        else
            Settings.IsMeleeMode = true;
            Settings.IsHighMPMode = false;
            Settings.IsFishingMode = false;
            gFunc.Message('Melee Mode: ON');    
        end

    end

    -- Catch the "highmpmode" command
    if (args[1] == "highmpmode") then
        if (Settings.IsHighMPMode == true) then
            Settings.IsHighMPMode = false;
            gFunc.Message('High MP Mode: OFF');    
        else
            Settings.IsMeleeMode = false;
            Settings.IsHighMPMode = true;
            Settings.IsFishingMode = false;
            gFunc.Message('High MP Mode: ON');    
        end
    end

    -- Catch the "fishingmode" command
    if (args[1] == "fishingmode") then
        if (Settings.IsFishingMode == true) then
            Settings.IsFishingMode = false;
            gFunc.Message('Fishing Mode: OFF');    
        else
            Settings.IsMeleeMode = false;
            Settings.IsHighMPMode = false;
            Settings.IsFishingMode = true;
            gFunc.Message('Fishing Mode: ON');    
        end
    end

end

-----------------------------------------------------------------
-- When an action is complete and the character resets to a
-- default state
-----------------------------------------------------------------
profile.HandleDefault = function()

    -- Get the required data table(s)
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

        -- If Melee mode is enabled
        if (Settings.IsMeleeMode == true) then
            gFunc.EquipSet(sets.Engaged);

        -- If High MP mode is enabled
        elseif (Settings.IsHighMPMode == true) then
            gFunc.EquipSet(sets.UtilHighMP);

        -- If fishing mode is enabled
        elseif (Settings.IsFishingMode == true) then
            gFunc.EquipSet(sets.UtilFishing);

        end

    end

end

-----------------------------------------------------------------
-- When job abilities are triggered
-----------------------------------------------------------------
profile.HandleAbility = function()
end

-----------------------------------------------------------------
-- When items are used
-----------------------------------------------------------------
profile.HandleItem = function()
end

-----------------------------------------------------------------
-- Before casting begins
-----------------------------------------------------------------
profile.HandlePrecast = function()
    gFunc.EquipSet(sets.FastCast);
end

-----------------------------------------------------------------
-- When a spell is cast
-----------------------------------------------------------------
profile.HandleMidcast = function()

    -- Get the required data table(s)
    local action = gData.GetAction();

    -----------------------------------------------------------------
    -- Divine Magic
    -----------------------------------------------------------------
    if (action.Skill == 'Divine Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                sets.MagDivine
            )
        );

    -----------------------------------------------------------------
    -- Healing Magic
    -----------------------------------------------------------------
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                sets.MagHealing
            )
        );

        -- Cure override
        if (Spells.Cures[action.Name]) then
            gFunc.EquipSet(sets.UtilCurePotency);
        end

    -----------------------------------------------------------------
    -- Enhancing Magic
    -----------------------------------------------------------------
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                sets.MagEnhancing
            )
        );

        -- Invis/Sneak override
        if (Spells.InvisSneak[action.Name]) then
            gFunc.EquipSet(sets.UtilInvisSneak);
        end

    -----------------------------------------------------------------
    -- Enfeebling Magic
    -----------------------------------------------------------------
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
    
        -- Element overrides
        if (action.Element == 'Dark') then
            gFunc.EquipSet(sets.UtilMagDark);
        elseif (action.Element == 'Earth') then
            gFunc.EquipSet(sets.UtilMagEarth);
        elseif (action.Element == 'Fire') then
            gFunc.EquipSet(sets.UtilMagFire);
        elseif (action.Element == 'Ice') then
            gFunc.EquipSet(sets.UtilMagIce);
        elseif (action.Element == 'Light') then
            gFunc.EquipSet(sets.UtilMagLight);
        elseif (action.Element == 'Thunder') then
            gFunc.EquipSet(sets.UtilMagThunder);
        elseif (action.Element == 'Water') then
            gFunc.EquipSet(sets.UtilMagWater);
        elseif (action.Element == 'Wind') then
            gFunc.EquipSet(sets.UtilMagWind);
        end

    -----------------------------------------------------------------
    -- Elemental Magic
    -----------------------------------------------------------------
    elseif (action.Skill == 'Elemental Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                sets.MagElemental
            )
        );

        -- Element overrides
        if (action.Element == 'Dark') then
            gFunc.EquipSet(sets.UtilMagDark);
        elseif (action.Element == 'Earth') then
            gFunc.EquipSet(sets.UtilMagEarth);
        elseif (action.Element == 'Fire') then
            gFunc.EquipSet(sets.UtilMagFire);
        elseif (action.Element == 'Ice') then
            gFunc.EquipSet(sets.UtilMagIce);
        elseif (action.Element == 'Light') then
            gFunc.EquipSet(sets.UtilMagLight);
        elseif (action.Element == 'Thunder') then
            gFunc.EquipSet(sets.UtilMagThunder);
        elseif (action.Element == 'Water') then
            gFunc.EquipSet(sets.UtilMagWater);
        elseif (action.Element == 'Wind') then
            gFunc.EquipSet(sets.UtilMagWind);
        end

        -- Low MP Override
        if (action.MppAftercast <= 50) then
            gFunc.EquipSet(sets.UtilLowMP);
        end

    -----------------------------------------------------------------
    -- Dark Magic
    -----------------------------------------------------------------
    elseif (action.Skill == 'Dark Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.MagBase,
                gFunc.Combine(
                    sets.MagElemental,
                    sets.MagDark
                )
            )
        );

        -- Low MP Override
        if (action.MppAftercast <= 50) then
            gFunc.EquipSet(sets.UtilLowMP);
        end

    end

    -- Conserve MP overrides
    if (Spells.ConserveMP[action.Name]) then
        gFunc.EquipSet(sets.UtilConserveMP);
    end
    
    -- If Melee mode is enabled
    if (Settings.IsMeleeMode == true) then
        gFunc.EquipSet(sets.Engaged);

    -- If High MP mode is enabled
    elseif (Settings.IsHighMPMode == true) then
        gFunc.EquipSet(sets.UtilHighMP);
        
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

    -- Get the required data table(s)
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
                gFunc.Combine(
                    sets.MagElemental,
                    sets.WSMagical
                )
            )
        );

        -- Low MP Override
        if (action.MppAftercast <= 50) then
            gFunc.EquipSet(sets.UtilLowMP);
        end

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