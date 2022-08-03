--Got the motivation to finally start up this project again to create a better framework.
--Now going to be making a more modular system to make things not only more clean by easier for others to make their own commands.

--For now, don't try this on anything other than Synapse as it simply will not work! (who am I kidding im writing this on a macbook rn)


--Makes it easier to import other systems if needed. (MUST BE LOCALIZED IN REPOSITORY)
local function import(file)
  return loadstring(syn.request(("https://raw.githubusercontent.com/DripDemiGod/Aspirin-rTerminal/main/%s.lua"):format(file)), file .. '.lua')()
end

import("init")
