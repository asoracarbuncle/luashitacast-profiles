local profile = {};
profile.Sets = {
    Idle = {
        Main = 'Yew Wand +1',
        Sub = 'Maple Shield',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Tunic',
        Hands = 'Mitts',
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Mist Silk Cape',
        Legs = 'Linen Slops',
        Feet = 'Solea',
    },
    Engaged = {
        Main = 'Yew Wand +1',
        Sub = 'Maple Shield',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Tunic',
        Hands = 'Mitts',
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Mist Silk Cape',
        Legs = 'Linen Slops',
        Feet = 'Solea',
    },
    Curing = {
        Main = 'Yew Wand +1',
        Sub = 'Maple Shield',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Tunic',
        Hands = 'Mitts',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        Back = 'Mist Silk Cape',
        Legs = 'Linen Slops',
        Feet = 'Solea',
    },
};

local Spells = {};

Spells.Curing = {
    ['Cure'] = true,
    ['Cure II'] = true,
    ['Cure III'] = true,
    ['Cure IV'] = true,
    ['Cure V'] = true,
    ['Curaga'] = true,
    ['Curaga II'] = true,
    ['Curaga III'] = true,
    ['Curaga IV'] = true,
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

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(profile.Sets.Engaged);
    else
        gFunc.EquipSet(profile.Sets.Idle);
    end
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
    local action = gData.GetAction();
    if (Spells.Curing[action.Name]) then
        gFunc.EquipSet(profile.Sets.Curing);
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;