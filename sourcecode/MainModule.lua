local Found = false
for i, object in pairs(game.ServerStorage:GetChildren()) do
	if object.Name == "STScenes" then
		Found = true
		break
	end
end

if Found == false then
	require(script.Setup)
end

local Found = nil

warn("Updating, please make sure to enable HTTP requests via '>Game Settings>Security'")
local Update = require(script.Updater)
if Update["failed"] == true then
	error("C8051: Could not upgrade: " .. Update.err)
end

print("STScenes, made by Stoppedwumm")
print("Maybe give some credit? ;-)")

return require(script.Functions)
