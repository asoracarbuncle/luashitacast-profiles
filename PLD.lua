local profile = {};
local sets = {
    ['Idle'] = {
        Main = 'Durandal',
        Sub = 'Koenig shield',
        Ammo = 'Happy Egg',
        Head = 'Adaman barbuta',
        Neck = 'Parade Gorget',
        Ear1 = 'Knight\'s earring',
        Ear2 = 'Merman\'s earring',
        Body = 'Adaman cuirass',
        Hands = 'Adaman gauntlets',
        Ring1 = 'Sattva ring',
        Ring2 = 'Jelly ring',
        Back = 'Beak Mantle +1',
        Waist = 'Swift belt',
        Legs = 'Adaman cuisses',
        Feet = 'Gallant Leggings',
    },
    ['Engaged'] = {
        Main = 'Durandal',
        Sub = 'Koenig shield',
        Ammo = 'Happy Egg',
        Head = 'Adaman barbuta',
        Neck = 'Parade Gorget',
        Ear1 = 'Knight\'s earring',
        Ear2 = 'Merman\'s earring',
        Body = 'Adaman cuirass',
        Hands = 'Adaman gauntlets',
        Ring1 = 'Sattva ring',
        Ring2 = 'Jelly ring',
        Back = 'Beak Mantle +1',
        Waist = 'Swift belt',
        Legs = 'Adaman cuisses',
        Feet = 'Gallant Leggings',
    },
    ['FastCast'] = {},    
    ['HPUnder85'] = {
        Neck = 'Peacock Amulet',
    },
    ['Enmity'] = {
        Main = 'Durandal',
        Sub = 'Koenig shield',
        Ammo = 'Happy Egg',
        Head = 'Adaman barbuta',
        Neck = 'Harmonia\'s torque',
        Ear1 = 'Knight\'s earring',
        Ear2 = 'Merman\'s earring',
        Body = 'Adaman cuirass',
        Hands = 'Adaman gauntlets',
        Ring1 = 'Sattva ring',
        Ring2 = 'Jelly ring',
        Back = 'Beak Mantle +1',
        Waist = 'Warwolf belt',
        Legs = 'Adaman cuisses',
        Feet = 'Gallant Leggings',
    }, 
	['Cure'] = {
        Main = 'Durandal',
        Sub = 'Koenig shield',
        Ammo = 'Happy Egg',
        Head = 'Adaman barbuta',
        Neck = 'Parade Gorget',
        Ear1 = 'Knight\'s earring',
        Ear2 = 'Hospitaler earring',
        Body = 'Adaman cuirass',
        Hands = 'Adaman gauntlets',
        Ring1 = 'Sattva ring',
        Ring2 = 'Jelly ring',
        Back = 'Beak Mantle +1',
        Waist = 'Warwolf belt',
        Legs = 'Adaman cuisses',
        Feet = 'Gallant Leggings',	
	},	
	['SavageBlade'] = {
        Main = 'Durandal',
        Sub = 'Koenig shield',
        Ammo = 'Happy Egg',
        Head = 'Adaman barbuta',
        Neck = 'Spike necklace',
        Ear1 = 'Knight\'s earring',
        Ear2 = 'Merman\'s earring',
        Body = 'Adaman cuirass',
        Hands = 'Adaman gauntlets',
        Ring1 = 'Garnet Ring',
        Ring2 = 'Garnet Ring',
        Back = 'Beak Mantle +1',
        Waist = 'Warwolf belt',
        Legs = 'Adaman cuisses',
        Feet = 'Gallant Leggings',	
	},	
	['SwiftBlade'] = {
        Main = 'Durandal',
        Sub = 'Koenig shield',
        Ammo = 'Happy Egg',
        Head = 'Adaman barbuta',
        Neck = 'Spike necklace',
        Ear1 = 'Knight\'s earring',
        Ear2 = 'Merman\'s earring',
        Body = 'Adaman cuirass',
        Hands = 'Adaman gauntlets',
        Ring1 = 'Garnet Ring',
        Ring2 = 'Garnet Ring',
        Back = 'Beak Mantle +1',
        Waist = 'Warwolf belt',
        Legs = 'Adaman cuisses',
        Feet = 'Gallant Leggings',
	},	
	['ShieldBash'] = {
        Main = 'Durandal',
        Sub = 'Koenig shield',
        Ammo = 'Happy Egg',
        Head = 'Adaman barbuta',
        Neck = 'Parade Gorget',
        Ear1 = 'Drone earring',
        Ear2 = 'Drone earring',
        Body = 'Adaman cuirass',
        Hands = 'Adaman gauntlets',
        Ring1 = 'Sattva ring',
        Ring2 = 'Jelly ring',
        Back = 'Beak Mantle +1',
        Waist = 'Warwolf belt',
        Legs = 'Adaman cuisses',
        Feet = 'Gallant Leggings',	
	},	
};
profile.Sets = sets; -- Ignore this
profile.Packer = {}; -- Ignore this

-- Spells table(s)
local Spells = {};

-- Cure spells
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

-- This code block executes when the LUA is loaded by ashitacast
profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

-- This code block executes when the LUA is unloaded by ashitacast
profile.OnUnload = function()
end

-- This code block executes when you type a custom command into the chat stream
-- In general, ignore this
profile.HandleCommand = function(args)
end

-- This code block executes when all other moves/abilities/casts are over and it returns to default "state"
profile.HandleDefault = function()

    -- Get the player table
    local player = gData.GetPlayer();

    -- When engaged
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Engaged);

    -- All other statuses
    else
        gFunc.EquipSet(sets.Idle);

    end

    -- Check if player is under 85% HP
    if (player.HPP < 85) then
        gFunc.EquipSet(sets.HPUnder85);
    end

end

-- This code block executes when you perform a job ability
profile.HandleAbility = function()

    -- Get the required data table(s)
    local action = gData.GetAction();

    -- Provoke
    if (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Enmity);

    -- Shield Bash
    elseif (action.Name == 'Shield Bash') then
        gFunc.EquipSet(sets.ShieldBash);

    end
		
end

-- This code block executes when you use an item
profile.HandleItem = function()
end

-- This code block executes just before a spell begins to cast (aka precast)
profile.HandlePrecast = function()
    gFunc.EquipSet(sets.FastCast);
end

-- This code block executes while a cast is occurring (aka midcast)
profile.HandleMidcast = function()

    -- Get the required data table(s)
    local action = gData.GetAction();

    -- Cure
    if (Spells.Cures[action.Name]) then
        gFunc.EquipSet(sets.Cure);

    -- Flash
    elseif (action.Name == 'Flash') then
        gFunc.EquipSet(sets.Enmity);

    end

end

-- This code block executes just before you fire a ranged weapon
profile.HandlePreshot = function()
end

-- This code block executes while a shot is occurring
profile.HandleMidshot = function()
end

-- This code block executes when you performa a weapon skill
profile.HandleWeaponskill = function()

    -- Get the required data table(s)
    local action = gData.GetAction();

        -- Check if player is using Savage blade
    if (action.Name == 'Savage Blade') then 
        gFunc.EquipSet(sets.SavageBlade);
    end 

    -- Check if player is using Swift blade
    if (action.Name == 'Swift Blade') then 
        gFunc.EquipSet(sets.SwiftBlade);
    end

end

return profile;