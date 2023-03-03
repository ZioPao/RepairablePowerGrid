RepairablePowerGridServer = {}

local function UpdatePowerCheck()
    RepairablePowerGridServer.powerHours = RepairablePowerGridServer.powerHours - 1
    -- print("PowerGrid: might break in " .. cdexpire .. "hours" )
    if RepairablePowerGridServer.powerHours > 0 then
        RepairablePowerGrid.TurnPowerOn()
    else
        RepairablePowerGrid.TurnPowerOff()
    end


    ModData.get(PLM_Common.globalModDataName)["powerHours"] = RepairablePowerGridServer.powerHours
    ModData.transmit(PLM_Common.globalModDataName)
end



local function InitPowerHours()

    if  ModData.get(PLM_Common.globalModDataName)["powerHours"] then
        RepairablePowerGridServer.powerHours =  ModData.get(PLM_Common.globalModDataName)["powerHours"]
        print("RPG: Found mod data, reusing its power hours")
    else
        RepairablePowerGridServer.powerHours = SandboxVars.ReduceGen.CD
        print("RPG: no mod data, reinit")

    end


    Events.EveryHours.Add(UpdatePowerCheck)

end


if isServer() then
    Events.OnServerStarted.Add(InitPowerHours)
elseif not isServer() and not isClient() then
    Events.OnGameStart.Add(InitPowerHours)
end

