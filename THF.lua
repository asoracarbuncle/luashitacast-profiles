local profile = {};
local sets = {
    ['Idle'] = {
        Sub = 'Maple Shield',
        Head = 'Ryl.Ftm. Bandana',
        Neck = 'Leather Gorget',
        Body = 'Ryl.Ftm. Vest',
        Hands = 'Ryl.Ftm. Gloves',
        Ring1 = 'San d\'Orian Ring',
        Back = 'Rabbit Mantle',
        Waist = 'Leather Belt',
        Legs = 'Leather Trousers',
        Feet = 'Ryl.Ftm. Boots',
    },
    ['Engaged'] = {
        Sub = 'Maple Shield',
        Head = 'Ryl.Ftm. Bandana',
        Neck = 'Leather Gorget',
        Body = 'Ryl.Ftm. Vest',
        Hands = 'Ryl.Ftm. Gloves',
        Ring1 = 'San d\'Orian Ring',
        Back = 'Rabbit Mantle',
        Waist = 'Leather Belt',
        Legs = 'Leather Trousers',
        Feet = 'Ryl.Ftm. Boots',
    },
    ['UtilFishing'] = {
        Body = 'Fsh. Tunica',
        Hands = 'Fsh. Gloves',
        Legs = 'Fisherman\'s Hose',
        Feet = 'Fisherman\'s Boots',
    },
};
profile.Sets = sets;

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
end

return profile;