local profile = {};
local sets = {
    ['Idle_Priority'] = {
        Main = { 'Solid Wand', 'Yew Wand +1', 'Willow Wand' },
        Sub = 'Maple Shield',
        Head = { 'Kosshin', 'Bonze\'s Circlet' },
        Neck = { 'Holy Phial', 'Rep.Bronze Medal', 'Justice Badge' },
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = { 'Seer\'s Tunic', 'San d\'Orian Tunic', 'Tunic' },
        Hands = { 'Devotee\'s Mitts', 'Zealot\'s Mitts', 'Mitts' },
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
        Back = { 'White Cape +1', 'Mist Silk Cape' },
        Waist = 'Friar\'s Rope',
        Legs = { 'Seer\'s Slacks', 'Windurstian Slops', 'Linen Slops' },
        Feet = { 'Seer\'s Pumps', 'Solea' },
    },
};
profile.Sets = sets;

-----------------------------------------------------------------
-- Settings
-----------------------------------------------------------------
local Settings = {
    CurrentLevel  = 0,
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

profile.HandleWeaponskill = function()
end

return profile;