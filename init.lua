--Project on halt as I have already lost motivation since I realised I CANT TEST MY IDEAS IF I DONT HAVE ACCESS TO SYNAPSEEEEEEE
--Ideas:
--Modules can technically be used normally since it is being ran in the roblox environment. (LuaU instead of the normal Lua 5.1)
--Use them as normal, experiment with using functions defined with one scrupt in another. EXAMPLE:

--script_1: test = 1234
--script_2: print(test)

--This should print out 1234 HOPEFULLY.


--BRUH WHY AM I EVEN DOING THIS NOW I CAN'T EVEN TEST IF IT WORKS IM ON A FKN MACBOOK FFS


--METATABLE COMMANDS METHOD
local commandsTable = {

	example = function()
		print("This is an example function!")
	end,

	example2 = function()
		print("And this is another example!")
	end

}

local commands = setmetatable(commandsTable, {__index = function(tb, key) return function() print("Command not found!") end end})

commands["example"]() --prints "This is an example function!"
commands["cake"]() --prints "Command not found!"
