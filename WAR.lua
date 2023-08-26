local profile = {};
local sets = {
    ['Idle'] = {
        Main = 'Chaosbringer',
        Head = 'Beetle Mask',
        Neck = 'Spike Necklace',
        Ear1 = 'Silver Earring',
        Ear2 = 'Silver Earring',
        Body = 'Beetle Harness',
        Hands = 'Custom M Gloves',
        Ring1 = 'Reflex Ring',
        Ring2 = 'Reflex Ring',
        Back = 'Nomad\'s Mantle +1',
        Waist = 'Warrior\'s Belt',
        Legs = 'Ryl.Ftm. Trousers',
        Feet = 'Leaping Boots',
    },
    ['Engaged'] = {
        Head = 'Beetle Mask',
        Neck = 'Spike Necklace',
        Ear1 = 'Bone Earring +1',
        Ear2 = 'Bone Earring +1',
        Body = 'Beetle Harness',
        Hands = 'Custom M Gloves',
        Ring1 = 'Balance Ring',
        Ring2 = 'Balance Ring',
        Back = 'Nomad\'s Mantle +1',
        Waist = 'Warrior\'s Belt',
        Legs = 'Ryl.Ftm. Trousers',
        Feet = 'Leaping Boots',
    },
    ['WSBase'] = {},
    ['WSPhysical'] = {},
    ['WSMagical'] = {},
    ['WSBreath'] = {},
};
profile.Sets = sets;

-- Weapon Skill Table(s)
local WeaponSkills = {};

-- Physical weapon skills
WeaponSkills.Physical = {
    ['Shield Break'] = true,
    ['Iron Tempest'] = true,
    ['Sturmwind'] = true,
};

-- Magical weapon skills
WeaponSkills.Magical = {};

-- Breath weapon skills
WeaponSkills.Breath = {};

-- Settings
local Settings = {
    CurrentLevel  = 0,
    IsFishing = false,
};

profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

profile.OnUnload = function()
end

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

    -- All other statuses
    else
        if (Settings.IsFishing == true) then
            gFunc.EquipSet(sets.UtilFishing);
        else
            gFunc.EquipSet(sets.Idle);
        end
    end

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