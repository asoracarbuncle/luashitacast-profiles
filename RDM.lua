local profile = {};
local sets = {
    ['Idle_Priority'] = {
        Main = 'Earth Staff',
        Ammo = 'Phtm. Tathlum',
        Head = { 'Warlock\'s Chapeau', 'Crow Beret', 'Centurion\'s Visor' },
        Neck = { 'Evasion Torque', 'Black Neckerchief' },
        Ear1 = 'Morion Earring',
        Ear2 = 'Morion Earring',
        Body = { 'Tiger Jerkin', 'Crow Jupon', 'Ctr. Scale Mail' },
        Hands = { 'Warlock\'s Gloves', 'Crow Bracers', 'Ctr. F. Gauntlets' },
        Ring1 = { 'Jadeite Ring', 'Tourmaline Ring' },
        Ring2 = { 'Jadeite Ring', 'Tourmaline Ring' },
        Back = { 'Nomad\'s Mantle +1', 'Traveler\'s Mantle' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt', 'Warrior\'s Belt' },
        Legs = { 'Warlock\'s Tights', 'Tiger Trousers', 'Crow Hose', 'Ctr. Cuisses' },
        Feet = { 'Warlock\'s Boots', 'Ctr. Greaves' },
    },
    ['Resting'] = {
        Main = 'Dark Staff',
    },
    ['Engaged_Priority'] = {
        Main = { 'Cermet Sword', 'Crimson Blade', 'Fencing Degen' },
        Sub = { 'Msk.Cmd. Shield', 'Ryl.Sqr. Shield' },
        Ammo = 'Phtm. Tathlum',
        Head = { 'Warlock\'s Chapeau', 'Crow Beret', 'Centurion\'s Visor' },
        Neck = { 'Evasion Torque', 'Black Neckerchief' },
        Ear1 = 'Morion Earring',
        Ear2 = 'Morion Earring',
        Body = { 'Tiger Jerkin', 'Crow Jupon', 'Ctr. Scale Mail' },
        Hands = { 'Warlock\'s Gloves', 'Crow Bracers', 'Ctr. F. Gauntlets' },
        Ring1 = { 'Jadeite Ring', 'Tourmaline Ring' },
        Ring2 = { 'Jadeite Ring', 'Tourmaline Ring' },
        Back = { 'Nomad\'s Mantle +1', 'Traveler\'s Mantle' },
        Waist = { 'Penitent\'s Rope', 'Ryl.Kgt. Belt', 'Warrior\'s Belt' },
        Legs = { 'Warlock\'s Tights', 'Tiger Trousers', 'Crow Hose', 'Ctr. Cuisses' },
        Feet = { 'Warlock\'s Boots', 'Ctr. Greaves' },
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
        Body = 'White Cloak',
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
        Body = 'White Cloak',
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
        Body = 'White Cloak',
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
        Head = 'Warlock\'s Chapeau',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Morion Earring',
        Ear2 = 'Morion Earring',
        Body = 'Mage\'s Tunic',
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
    ['MagDark'] = {
        Main = 'Dark Staff',
    },
    ['UtilConserveMP'] = {},
    ['UtilCurePotency'] = {
        Main = 'Light Staff',
    },
    ['UtilFishing'] = {
        Body = 'Fsh. Tunica',
        Hands = 'Fsh. Gloves',
        Legs = 'Fisherman\'s Hose',
        Feet = 'Fisherman\'s Boots',
    },
    ['UtilInvisSneak'] = {
        Back = 'Skulker\'s Cape',
    },
    ['UtilLowMP'] = {
        Neck = 'Uggalepih Pendant',
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
    ['healing'] = {
        Main = 'Earth Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Evasion Torque',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Tiger Jerkin',
        Hands = 'Warlock\'s Gloves',
        Ring1 = 'Jadeite Ring',
        Ring2 = 'Jadeite Ring',
        Back = 'Nomad\'s Mantle +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',
        Feet = 'Warlock\'s Boots',
    },
    ['mist'] = {
        Main = 'Earth Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Evasion Torque',
        Ear1 = 'Morion Earring',
        Ear2 = 'Morion Earring',
        Body = 'Tiger Jerkin',
        Hands = 'Warlock\'s Gloves',
        Ring1 = 'Jadeite Ring',
        Ring2 = 'Jadeite Ring',
        Back = 'Mist Silk Cape',
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
    IsFishing = false,
};

-----------------------------------------------------------------
-- Start of the profile functions
-----------------------------------------------------------------
profile.Packer = {};

-----------------------------------------------------------------
-- When the profile loads
-----------------------------------------------------------------
profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

-----------------------------------------------------------------
-- When the profile unloads
-----------------------------------------------------------------
profile.OnUnload = function()
end

-----------------------------------------------------------------
-- When a manual command is sent to Ashitacast
-----------------------------------------------------------------
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
        if (Settings.IsFishing == true) then
            gFunc.EquipSet(sets.UtilFishing);
        else
            gFunc.EquipSet(sets.Idle);
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