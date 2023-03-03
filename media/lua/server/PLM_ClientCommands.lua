
local ClientCommands = {}


ClientCommands.SendRepairGen = function (_, args)
    RepairablePowerGrid.TurnPowerOn()
    RepairablePowerGridServer.powerHours = SandboxVars.ReduceGen.CD + 48
    RepairablePowerGridServer.powerHours = RepairablePowerGridServer.powerHours + 24

end



local function OnClientCommand(module, command, playerObj, args)
    if module == 'RepairablePowerGrid' and ClientCommands[command] then
        ClientCommands[command](playerObj, args)
    end
end

Events.OnClientCommand.Add(OnClientCommand)


