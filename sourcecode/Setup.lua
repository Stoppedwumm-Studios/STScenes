script.Parent.STScenes.Parent = game.ServerStorage
Instance.new("Configuration", workspace).Name = "Workspace"

local Found = false
for i, object in pairs(game.ServerStorage:GetChildren()) do
	if object.Name == "STScenes" then
		Found = true
		break
	end
end

if Found == false then
	error("BDE64, Setup failed while verifying, please contact Developer immediatly")
end

return nil
