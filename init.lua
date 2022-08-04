--https://api.github.com/repos/DripDemiGod/Aspirin-rTerminal/contents/commands?ref=main
httpService = game:GetService("HttpService")
local rawData = httpService:GetAsync("https://api.github.com/repos/DripDemiGod/Aspirin-rTerminal/contents/commands?ref=main")
local jsonData = httpService:JSONDecode(rawData)
print(jsonData)
