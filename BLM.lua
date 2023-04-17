local profile = {};
profile.Sets = {
    ['Idle'] = {
        Main = 'Yew Wand +1',
        Neck = 'Black Neckerchief',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Mage\'s Tunic',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Mist Silk Cape',
        Legs = 'Mage\'s Slacks',
        Feet = 'Solea',
    },
    ['Resting'] = {},
    ['Engaged'] = {},
    ['WeaponSkill'] = {
        ['Base'] = {},
        ['Physical'] = {},
        ['Magical'] = {},
        ['Breath'] = {},
    },
    ['Precast'] = {
        ['FastCast'] = {},
    },
    ['Magic'] = {
        ['Base'] = {},
        ['Divine'] = {},
        ['Healing'] = {},
        ['Enhancing'] = {},
        ['Enfeebling'] = {
            ['Base'] = {
                Main = 'Yew Wand +1',
                Neck = 'Black Neckerchief',
                Body = 'Mage\'s Tunic',
                Hands = 'Seer\'s Mitts +1',
                Ring1 = 'Eremite\'s Ring',
                Ring2 = 'Eremite\'s Ring',
                Legs = 'Mage\'s Slacks',        
            },
            ['Light'] = {},
            ['Dark'] = {},
        },
        ['Elemental'] = {
            Main = 'Yew Wand +1',
            Neck = 'Black Neckerchief',
            Body = 'Mage\'s Tunic',
            Hands = 'Seer\'s Mitts +1',
            Ring1 = 'Eremite\'s Ring',
            Ring2 = 'Eremite\'s Ring',
            Back = 'Black Cape',
            Legs = 'Mage\'s Slacks',    
        },
        ['Dark'] = {
            Main = 'Yew Wand +1',
            Neck = 'Black Neckerchief',
            Body = 'Mage\'s Tunic',
            Hands = 'Seer\'s Mitts +1',
            Ring1 = 'Eremite\'s Ring',
            Ring2 = 'Eremite\'s Ring',
            Back = 'Black Cape',
            Legs = 'Mage\'s Slacks',    
        },
    },
    ['Utility'] = {
        ['ConserveMP'] = {},
        ['Fishing'] = {
            Body = 'Fsh. Tunica',
            Hands = 'Fsh. Gloves',
            Legs = 'Fisherman\'s Hose',
            Feet = 'Fisherman\'s Boots',
        },
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

    -- Get the player table
    local player = gData.GetPlayer();

    -- When engaged
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(profile.Sets.Engaged);

    -- When resting
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(profile.Sets.Resting);

    -- All other statuses
    else
        if (Settings.IsFishing == true) then
            gFunc.EquipSet(profile.Sets.Utility.Fishing);
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
                profile.Sets.Magic.Base,
                profile.Sets.Magic.Divine
            )
        );

    -- Healing Magic
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.Magic.Base,
                profile.Sets.Magic.Healing
            )
        );

    -- Enhancing Magic
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.Magic.Base,
                profile.Sets.Magic.Enhancing
            )
        );

    -- Enfeebling Magic
    elseif (action.Skill == 'Enfeebling Magic') then

        -- Light Enfeebles
        if (action.Type == "White Magic") then
            gFunc.EquipSet(
                gFunc.Combine(
                    profile.Sets.Magic.Base,
                    gFunc.Combine(
                        profile.Sets.Magic.Enfeebling.Base,
                        profile.Sets.Magic.Enfeebling.Light
                    )
                )
            );

        -- Dark Enfeebles
        else
            gFunc.EquipSet(
                gFunc.Combine(
                    profile.Sets.Magic.Base,
                    gFunc.Combine(
                        profile.Sets.Magic.Enfeebling.Base,
                        profile.Sets.Magic.Enfeebling.Dark
                    )
                )
            );
        end
    
    -- Elemental Magic
    elseif (action.Skill == 'Elemental Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.Magic.Base,
                profile.Sets.Magic.Elemental
            )
        );

    -- Dark Magic
    elseif (action.Skill == 'Dark Magic') then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.Magic.Base,
                profile.Sets.Magic.Dark
            )
        );

    end

    -- Conserve MP overrides
    if (Spells.ConserveMP[action.Name]) then
        gFunc.EquipSet(profile.Sets.Utility.ConserveMP);
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
                profile.Sets.WeaponSkill.Base,
                profile.Sets.WeaponSkill.Physical
            )
        );

    -- Magical weapon skill
    elseif (WeaponSkills.Magical[action.Name]) then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.WeaponSkill.Base,
                profile.Sets.WeaponSkill.Magical
            )
        );

    -- Breath weapon skill
    elseif (WeaponSkills.Breath[action.Name]) then
        gFunc.EquipSet(
            gFunc.Combine(
                profile.Sets.WeaponSkill.Base,
                profile.Sets.WeaponSkill.Breath
            )
        );
    
    end

end

return profile;