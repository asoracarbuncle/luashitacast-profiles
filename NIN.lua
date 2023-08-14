local profile = {};
local sets = {
    ['Idle_Priority'] = {
        Main = { 'Mokuto +1', 'Shinobi-Gatana', 'Wakizashi' },
        Sub = { 'Mokuto', 'Shinobi-Gatana', 'Wakizashi' },
        Head = { 'Lizard Helm', 'Ryl.Ftm. Bandana' },
        Neck = 'Leather Gorget',
        Ear1 = 'Silver Earring',
        Ear2 = 'Silver Earring',
        Body = { 'Lizard Jerkin', 'Ryl.Ftm. Vest' },
        Hands = { 'Ryl.Ftm. Gloves' },
        Ring1 = 'Reflex Ring',
        Ring2 = 'Reflex Ring',
        Back = 'Traveler\'s Mantle',
        Waist = { 'Warrior\'s Belt', 'Leather Belt' },
        Legs = { 'Lizard Trousers', 'Leather Trousers' },
        Feet = 'Leaping Boots',
    },
    ['WSBase'] = {},
    ['WSPhysical'] = {},
    ['WSMagical_Priority'] = {},
    ['WSBreath'] = {},
    ['Strength'] = {
        Ring1 = 'San d\'Orian Ring',
        Ring2 = 'Sardonyx Ring',
    },
    ['Dexterity'] = {
        Ring1 = 'Amethyst Ring',
        Ring2 = 'Amethyst Ring',
    },
};
profile.Sets = sets;

-----------------------------------------------------------------
-- Settings
-----------------------------------------------------------------
local Settings = {
    CurrentLevel  = 0,
};

-----------------------------------------------------------------
-- Physical weapon skills
-----------------------------------------------------------------
local WeaponSkills = {};
WeaponSkills.Physical = {
    ['Blade: Rin'] = true,
    ['Blade: Retsu'] = true,
    ['Blade: Jin'] = true,
    ['Blade: Ten'] = true,
    ['Blade: Ku'] = true,
    ['Blade: Shun'] = true,
    ['Blade: Metsu'] = true,
    ['Blade: Kamu'] = true,
    ['Blade: Hi'] = true,
};

-----------------------------------------------------------------
-- Magical weapon skills
-----------------------------------------------------------------
WeaponSkills.Magical = {
    ['Blade: Teki'] = true,
    ['Blade: To'] = true,
    ['Blade: Chi'] = true,
    ['Blade: Ei'] = true,
    ['Blade: Yu'] = true,
};

profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
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

    -- Equip the idle set
    gFunc.EquipSet(sets.Idle);

end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

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

        -- Check for individual weapon skills
        if (action.name == 'Blade: Rin') then
            gFunc.EquipSet(sets.Strength);

        elseif (action.name == 'Blade: Retsu') then
            gFunc.EquipSet(sets.Dexterity);

        end

    -- Magical weapon skill
    elseif (WeaponSkills.Magical[action.Name]) then
        gFunc.EquipSet(
            gFunc.Combine(
                sets.WSBase,
                sets.WSMagical
            )
        );
    
    end

end

return profile;