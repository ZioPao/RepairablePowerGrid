RepairLineRecipes = {}

-----------
RepairLineRecipes.RepairLineAdvance = function(_, _, player)

  RepairablePowerGrid.Repair(256)   -- TODO dunno

end

RepairLineRecipes.RepairLineNormal = function(_, _, player)
  RepairablePowerGrid.Repair(48)

end

RepairLineRecipes.CheckStatus = function(_, _, player)

  RepairablePowerGrid.CheckStatus()
  
end