

local ServerCommands = {}



local function OnServerCommand(module, command, args)
    if module == PLM_Common.moduleName then
        if ServerCommands[command] then
            args = args or {}
            ServerCommands[command](args)

        end
    end
end

Events.OnServerCommand.Add(OnServerCommand)


---------------------------------- Global Mod Data -----------------------------


local function OnReceiveGlobalModData(key, modData)
    if modData then
        ModData.remove(key)
        ModData.add(key, modData)
    end
end


Events.OnReceiveGlobalModData.Add(OnReceiveGlobalModData)

local function OnConnected()
    print("RPG: requested mod data")
    ModData.request(PLM_Common.globalModDataName)
end


Events.OnConnected.Add(OnConnected)