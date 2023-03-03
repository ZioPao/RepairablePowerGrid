------ Global Mod Data -----------

local function OnInitGlobalModData()
    print("RPG: init Global Mod Data")
    ModData.getOrCreate(PLM_Common.globalModDataName)
end

Events.OnInitGlobalModData.Add(OnInitGlobalModData)
