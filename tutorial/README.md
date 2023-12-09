# Tutorial
A quick start Guide for STScenes

# Quickstart
## Prepartion
First, create a Folder in the ServerStorage and call it "Scenes". This will be our storage for scenes.

## Your first scene
Now, lets create a Scene, add a configuration object to you Folder and call it "Init". This scene will be loaded after setup, this will only affect the workspace for now, more info about this see: INSERT ANCHOR HERE

Add a Folder as Child and call it "workspace", add in there what you like to have in your workspace.

## Switching between Scenes
After you done this, go to <https://stoppedwumm-studios.github.io/STScenes/> and look for the newest asset ID

Add a
```lua
local STScenes = require(NEWEST ASSET ID HERE)
```

in your Script and test run to look for any errors with your init Scene

If the scene loads correctly, you should have done everything right!

Now lets add another Scene, you can call it what you want.

See <https://stoppedwumm-studios.github.io/STScenes/tutorial/#your-first-scene> again, but instead of calling it "Init", call it something to your liking.

Now, you need to let the programm index your scene folder, this is the command:

```luau
STScenes:GetScenes()
```

This function will return a table:

```luau
{
  ["Init"] = game.ServerStorage.Scenes.Init
}
```

It contains all scenes, with their name and Instance
