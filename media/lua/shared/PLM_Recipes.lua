RepairLineRecipes = {}

-----------
RepairLineRecipes.RepairLineAdvance = function(_, _, player)

  RepairablePowerGrid.Repair(256)   -- TODO dunno

end

RepairLineRecipes.RepairLineNormal = function(_, _, player)
  RepairablePowerGrid.Repair(48)

end

RepairLineRecipes.CheckStatus = function(_, _, player)
  if RepairablePowerGrid.IsPowerOn() then

    local powerHours = RepairablePowerGrid.GetPowerHours()

    getPlayer():Say("We should have " .. tostring(powerHours) .. " hours")
  else
    getPlayer():Say("There's no power in the grid...")
  end

  
end


RepairLineRecipes.CraftFuseBox = function(_, _, player)
  if SandboxVars.ReduceGen.Craftable == false then
    print(getPlayer():getUsername() .. " not allowed to Crafted a FuseBox")

    -- TODO Remove the crafted thing here


    getPlayer():Say(getText("Crafting this item is not allowed by this server"))
    getPlayer():getInventory():AddItem("Radio.ElectricWire")
    getPlayer():getInventory():AddItem("Radio.ElectricWire")
    getPlayer():getInventory():AddItem("Radio.ElectricWire")
    getPlayer():getInventory():AddItem("Radio.ElectricWire")
    getPlayer():getInventory():AddItem("Radio.ElectricWire")
    getPlayer():getInventory():AddItem("Base.SheetMetal")
    getPlayer():getInventory():AddItem("Base.SheetMetal")
    getPlayer():getInventory():AddItem("Base.SheetMetal")
    getPlayer():getInventory():AddItem("Base.SheetMetal")
    getPlayer():getInventory():AddItem("Base.SheetMetal")
    return
  end

  -- local fb = InventoryItemFactory.CreateItem("Fuse.FuseBox");
  -- fb:setActualWeight(10);
  -- fb:setWeight(10);
  -- getPlayer():getInventory():AddItem(fb);
  -- print(getPlayer():getUsername() .. " Crafted a FuseBox");
end
