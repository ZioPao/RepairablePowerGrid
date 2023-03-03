RepairLineRecipes = RepairLineRecipes or {}
RepairLineRecipes.GetItemTypes = RepairLineRecipes.GetItemTypes or {}
RepairLineRecipes.OnCanPerform = RepairLineRecipes.OnCanPerform or {}
RepairLineRecipes.OnCreate = RepairLineRecipes.OnCreate or {}
RepairLineRecipes.OnGiveXP = RepairLineRecipes.OnGiveXP or {}
RepairLineRecipes.OnTest = RepairLineRecipes.OnTest or {}

-----------

RepairLineRecipes.OnCreate.RepairGen = function(_, _, player)
  getSandboxOptions():getOptionByName("ElecShutModifier"):setValue(2147483647)
  powerHours = SandboxVars.ReduceGen.CD + 48
  powerHours = powerHours + 24
  player:Say(getText("This will hold for another " .. powerHours .. "hours "))
  print("PowerGrid: ON! " .. powerHours .. "hours ")
end