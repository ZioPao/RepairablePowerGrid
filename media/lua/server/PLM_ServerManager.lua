RepairablePowerGridServer = {}

local function UpdatePowerCheck()
    RepairablePowerGridServer.powerHours = RepairablePowerGridServer.powerHours - 1
    -- print("PowerGrid: might break in " .. cdexpire .. "hours" )
    if RepairablePowerGridServer.powerHours > 0 then
        RepairablePowerGrid.TurnPowerOn()
    else
        RepairablePowerGrid.TurnPowerOff()
    end


    sendServerCommand('RepairablePowerGrid', 'UpdatePowerHours', {value = RepairablePowerGridServer.powerHours})
  
end



local function InitPowerHours()

    RepairablePowerGridServer.powerHours = SandboxVars.ReduceGen.CD
    print(RepairablePowerGridServer.powerHours)
    Events.EveryHours.Add(UpdatePowerCheck)

end


if isServer() then
    Events.OnServerStarted.Add(InitPowerHours)
elseif not isServer() and not isClient() then
    Events.OnGameStart.Add(InitPowerHours)
end

