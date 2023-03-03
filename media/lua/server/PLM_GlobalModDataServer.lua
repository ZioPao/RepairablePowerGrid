ClientCommands = {}


-- Global Mod Data data handler
ClientCommands.UpdatePowerHours = function(playerObj, args)

    ModData.get(PLM_Common.globalModDataName)["powerHours"] = args.value
    ModData.transmit(PLM_Common.globalModDataName)
end


------ Global Mod Data -----------

local function OnInitGlobalModData()
    ModData.getOrCreate(PLM_Common.globalModDataName)
end

Events.OnInitGlobalModData.Add(OnInitGlobalModData)


local function OnClientCommand(module, command, playerObj, args)
    if module == PLM_Common.moduleName and ClientCommands[command] then
        ClientCommands[command](playerObj, args)
    end
end

Events.OnClientCommand.Add(OnClientCommand)
