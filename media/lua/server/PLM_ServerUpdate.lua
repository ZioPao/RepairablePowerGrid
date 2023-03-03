
-- TODO Add an init to initialize this value


RepairablePowerGridServer = {}


local function InitPowerHours()


    RepairablePowerGridServer.powerHours = SandboxVars.ReduceGen.CD
    print(RepairablePowerGridServer.powerHours)

end
Events.OnServerStarted.Add(InitPowerHours)


-------------


local function UpdatePowerCheck()
    RepairablePowerGridServer.powerHours = RepairablePowerGridServer.powerHours - 1
    -- print("PowerGrid: might break in " .. cdexpire .. "hours" )
    if RepairablePowerGridServer.powerHours > 0 then
        RepairablePowerGrid.TurnPowerOn()
    else
        RepairablePowerGrid.TurnPowerOff()
    end
  
end



Events.EveryHours.Add(UpdatePowerCheck)
  




