local profile = {};
profile.Sets = {
    ['Idle'] = {
        Head = 'Crow Beret',
        Neck = 'Black Neckerchief',
        Ear1 = 'Dodge Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Crow Jupon',
        Hands = 'Crow Bracers',
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Crow Hose',
        Feet = 'Crow Gaiters',
    },
    ['Resting'] = {
    },
    ['Engaged'] = {
        Main = 'Crimson Blade',
        Head = 'Crow Beret',
        Neck = 'Black Neckerchief',
        Ear1 = 'Dodge Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Crow Jupon',
        Hands = 'Crow Bracers',
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Crow Hose',
        Feet = 'Crow Gaiters',
    },
    ['WeaponSkill'] = {
        ['Base'] = {},
        ['Physical'] = {
            Ring1 = 'Garnet Ring',
            Ring2 = 'Garnet Ring',
        },
        ['Magical'] = {
            Neck = 'Black Neckerchief',
            Body = 'Mage\'s Tunic',
            Ring1 = 'Eremite\'s Ring',
            Ring2 = 'Eremite\'s Ring',
            Back = 'Red Cape',
            Waist = 'Ryl.Kgt. Belt',
            Legs = 'Mage\'s Slacks',
        },
        ['Breath'] = {
        },
    },
    ['Precast'] = {
        ['FastCast'] = {},
    },
    ['Magic'] = {
        ['Base'] = {},
        ['Divine'] = {
        },
        ['Healing'] = {
            Main = 'Ebony Wand +1',
            Body = 'White Cloak',
            Neck = 'Justice Badge',
            Ring1 = 'Saintly Ring',
            Ring2 = 'Saintly Ring',
            Back = 'Red Cape',
            Waist = 'Ryl.Kgt. Belt',
        },
        ['Enhancing'] = {
            Main = 'Ebony Wand +1',
            Body = 'White Cloak',
            Neck = 'Justice Badge',
            Ring1 = 'Saintly Ring',
            Ring2 = 'Saintly Ring',
            Back = 'Red Cape',
            Waist = 'Ryl.Kgt. Belt',
        },
        ['Enfeebling'] = {
            ['Base'] = {},
            ['Light'] = {
                Main = 'Fencing Degen',
                Body = 'White Cloak',
                Neck = 'Justice Badge',
                Ring1 = 'Saintly Ring',
                Ring2 = 'Saintly Ring',
                Back = 'Red Cape',
                Waist = 'Ryl.Kgt. Belt',
            },
            ['Dark'] = {
                Main = 'Fencing Degen',
                Neck = 'Black Neckerchief',
                Body = 'Mage\'s Tunic',
                Ring1 = 'Eremite\'s Ring',
                Ring2 = 'Eremite\'s Ring',
                Back = 'Red Cape',
                Waist = 'Ryl.Kgt. Belt',
                Legs = 'Mage\'s Slacks',
            },
        },
        ['Elemental'] = {
            Main = 'Ebony Wand +1',
            Neck = 'Black Neckerchief',
            Body = 'Mage\'s Tunic',
            Ring1 = 'Eremite\'s Ring',
            Ring2 = 'Eremite\'s Ring',
            Back = 'Red Cape',
            Waist = 'Ryl.Kgt. Belt',
            Legs = 'Mage\'s Slacks',
        },
        ['Dark'] = {
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
    ['Test'] = {
        Main = 'Crimson Blade',
        Sub = 'Ryl.Sqr. Shield',
        Head = 'Crow Beret',
        Neck = 'Black Neckerchief',
        Ear1 = 'Dodge Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Crow Jupon',
        Hands = 'Crow Bracers',
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Crow Hose',
        Feet = 'Crow Gaiters',
    },
    ['Test2'] = {
        Main = 'Fencing Degen',
        Sub = 'Ryl.Sqr. Shield',
        Head = 'Crow Beret',
        Neck = 'Black Neckerchief',
        Ear1 = 'Dodge Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Crow Jupon',
        Hands = 'Crow Bracers',
        Ring1 = 'Tourmaline Ring',
        Ring2 = 'Tourmaline Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Crow Hose',
        Feet = 'Crow Gaiters',
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