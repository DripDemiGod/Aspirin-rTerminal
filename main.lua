if not syn then kick("\nUnsupported Exploit.\nrTerminal is for Synapse - X\nONLY") end
local start = tick()
local running = true
local client = game:GetService('Players').LocalPlayer;
local usedCache = shared.__urlcache and next(shared.__urlcache) ~= nil
rconsolename("rTerminal Loading...")

--http stuff
shared.__urlcache = shared.__urlcache or {}
local function urlLoad(url)
    local success, result

    if shared.__urlcache[url] then
        success, result = true, shared.__urlcache[url]
    else
        success, result = pcall(game.HttpGet, game, url)
    end

    if (not success) then
        return fail(string.format('Failed to GET url %q for reason: %q', url, tostring(result)))
    end

    local fn, err = loadstring(result)
    if (type(fn) ~= 'function') then
        return fail(string.format('Failed to loadstring url %q for reason: %q', url, tostring(err)))
    end

    local results = { pcall(fn) }
    if (not results[1]) then
        return fail(string.format('Failed to initialize url %q for reason: %q', url, tostring(results[2])))
    end

    shared.__urlcache[url] = result
    return unpack(results, 2)
end

local metadata = urlLoad("https://raw.githubusercontent.com/DripDemiGod/Asprin-rTerminal/main/metadata.lua")
local httpService = game:GetService('HttpService')

--Command Functions
local function help(ctable)
	print("Here is a list of available commands: ")
	for i, v in pairs(ctable) do
		--print(tostring(ctable[i][1])) --PRINTS FUNCTION ID
		rconsoleprint(ctable[i][2].. "\n")
	end
end

local function add(ctable, var1, var2)
	if var1 and var2 then
		print(var1 + var2)
	end
end

local function clear(ctable)
    rconsoleclear()
end

local function quit(ctabke)
    running = false
end

--Main Command Dictionary
--Adding commands is simple. ["commandIndex"] = {commandFunction, "descriptionString"}
local Commands = {
	["help"] = {help, "'help': Gives brief information about the terminal and returns all commands available."},
	["add"] = {add, "'add': Requires 2 varaibles. Adds them together and prints the output."},
    ["clear"] = {clear, "'clear': Clears the rTerminal console."},
    ["quit"] = {quit, "'quit': Closes the terminal and terminates the script."}
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
local function inputFunc()
    rconsoleprint("\nC:\rTerminal>")
    local commandInput = rconsoleinput()
    if commandInput then
        if Commands[commandInput] then
            Commands[commandInput][1](Commands)
        else
            rconsoleprint("Unknown command. Please use the command 'help' for a list of available commands. \n")
        end
    end
end
rconsolename("rTerminal ver: ".. metadata.version)
rconsoleprint(string.format('Loaded script in %.4f second(s)!', tick() - start, 3))
rconsoleprint("\nVersion: ".. metadata.version)
rconsoleprint("\nLastest Updated: ".. metadata.updated)
rconsoleprint("\n".. metadata.message)
rconsoleprint("Use the 'clear' command to clear this message.")
rconsoleprint("You can turn these off by default in the 'rterminal.config' file.")
rconsoleprint("------------------------------------------------------------------")

while running == true do
    task.wait()
    inputFunc()
end
rconsoleclear()
rconsolename("rTerminal task terminated.")