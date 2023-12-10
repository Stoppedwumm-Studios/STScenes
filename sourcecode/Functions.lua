local module = {}
local IndexedScenes = {}
local IndexedAudioScenes = {}
local LoadedScene = game.ServerStorage
local LoadedAudioScene = game.ServerStorage
local function Index(index, enable)
	for i, object in pairs(index:GetChildren()) do
		if object:IsA("Script") then
			object.Enabled = enable
		end
		Index(object, enable)
	end
end

local Found = game.ServerStorage.STScenes:FindFirstChild("SceneLoaded")

if Found == nil then
	if game.ServerStorage:FindFirstChild("Scenes") == nil then
		error("Scene Folder does not exist, see: https://stoppedwumm-studios.github.io/STScenes/tutorial/")
	end

	game.ServerStorage.Scenes.Init:Clone().Parent = workspace.Workspace

	LoadedAudioScene = game.ServerStorage.Audio.Init:Clone()
	LoadedAudioScene.Parent = game.SoundService

	LoadedScene = workspace.Workspace.Init
	LoadedAudioScene = game.SoundService.Init
	Instance.new("Configuration", game.ServerStorage.STScenes).Name = "SceneLoaded"
end

function module:GetScenes()
	if game.ServerStorage:FindFirstChild("Scenes") == nil then
		error("Scene Folder does not exist, see: https://stoppedwumm-studios.github.io/STScenes/tutorial/")
	end
	for i, object in pairs(game.ServerStorage.Scenes:GetChildren()) do
		IndexedScenes[object.Name] = object
	end
	return IndexedScenes
end

function module:GetAudioScenes()
	if game.ServerStorage:FindFirstChild("Audio") == nil then
		error("Audio Folder does not exist, see: https://stoppedwumm-studios.github.io/STScenes/tutorial/")
	end
	for i, object in pairs(game.ServerStorage.Audio:GetChildren()) do
		IndexedAudioScenes[object.Name] = object
	end
	return IndexedAudioScenes
end

function module:Credits()
	return game:GetService("HttpService"):JSONDecode(game:GetService("HttpService"):GetAsync("https://stoppedwumm-studios.github.io/STScenes/api/v1/credits"))
end

function module:ChangeScene(SceneName)
	LoadedScene:Remove()
	LoadedScene = IndexedScenes[SceneName]:Clone()
	LoadedScene.Parent = workspace.Workspace
	Index(LoadedScene, true)
	return LoadedScene
end

function module:ChangeAudioScene(SceneName)
	LoadedAudioScene:Remove()
	LoadedAudioScene = IndexedAudioScenes[SceneName]:Clone()
	LoadedAudioScene.Parent = game.SoundService
	return LoadedAudioScene
end

return module
