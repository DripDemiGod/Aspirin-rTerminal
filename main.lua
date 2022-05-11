

--Command Functions
local function help(ctable)
	print("Here is a list of available commands: ")
	for i, v in pairs(ctable) do
		--print(tostring(ctable[i][1])) --PRINTS FUNCTION ID
		print(ctable[i][2])
	end
end

local function add(ctable, var1, var2)
	if var1 and var2 then
		print(var1 + var2)
	end
end

--Main Command Dictionary
--Adding commands is simple. ["commandIndex"] = {commandFunction, "descriptionString"}
local Commands = {
	["help"] = {help, "'help': Gives brief information about the terminal and returns all commands available."},
	["add"] = {add, "'add': Requires 2 varaibles. Adds them together and prints the output."}
}

--[[
--Console Input Simulation
local commandInput = "Help" --The input that is being simulated.  
--Sterilization
commandInput = tostring(commandInput) --Needed to prevent ':lower()' from erroring incase user inputs an integer.
commandInput = commandInput:lower()
--Main Logic WILL REQUIRE A DIFFERENT SYSTEM WHEN HELP COMMAND IS WORKING.
if Commands[commandInput] then
	Commands[commandInput][1](Commands)
	--print(Commands[commandInput][2])
else
	print("Command not found. Please use the command 'help' for a list of available commands.")
end
--]]
