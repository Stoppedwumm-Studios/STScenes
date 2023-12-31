# Tutorial
A quick start Guide for STScenes

# Quickstart
## Preperation
First, create a Folder in the ServerStorage and call it "Scenes". This will be our storage for scenes.

YOUR GAME HAS TO BE PUBLISHED (it can be set to private) AND HTTP REQUESTS ENABLED (>Game Settings>Security>Enable Http Requests).

This is needed to update and load essential scripts from Github

More information about we need HTTP Requests: <https://stoppedwumm-studios.github.io/STScenes/security-safety-privacy/>

## Your first scene
Now, lets create a Scene, add a configuration object to you Folder and call it "Init". This scene will be loaded after setup, this will only affect the workspace for now, more info about this see: <https://stoppedwumm-studios.github.io/STScenes/tutorial/#more-scene-types>

Add in there what you like to have in your workspace.

## Switching between Scenes
After you done this, go to <https://stoppedwumm-studios.github.io/STScenes/> and look for the newest asset ID

Add a
```lua
local STScenes = require(NEWEST ASSET ID HERE)
```

in your Script and test run to look for any errors with your Init Scene

If the scene loads correctly, you should have done everything right!

Now lets add another Scene, you can call it what you want.

See <https://stoppedwumm-studios.github.io/STScenes/tutorial/#your-first-scene> again, but instead of calling it "Init", call it something to your liking.

Now, you need to let the programm index your scene folder, this is the command:

```lua
STScenes:GetScenes()
```

This function will return a table:

```lua
{
  ["Init"] = game.ServerStorage.Scenes.Init
}
```

It contains all scenes, with their name and Instance

Change the scene via the ChangeScene("YOUR SCENE NAME") Function

```lua
STScenes:ChangeScene("YOUR SCENE NAME")
```

it returns the Loaded Scene Instance

## Scripts
Scripts WILL BE EXECUTED IN SCENE FOLDER IF THERE IS NO FAILSAFE

I wrote a Function to load the script, to use it, disable the script in the scene, as soon as it loads in, it will do a recursive search in the Scenes for scripts and enable them

## More Scene Types
### AudioScenes
Create a "Audio" Folder in your ServerStorage, it behaves like normal Scenes (needs to be indexed again:

```lua
STScenes:GetAudioScenes()
```

), but if you want to switch, use

```lua
STScenes:ChangeAudioScene("YOUR AUDIO SCENE NAME")
```

It will load in SoundService.Audio, where you can trigger it like normal (the loaded Audio Scene gets returned by the function)

### Note
**MORE will follow shortly**

# Settings
Settings are build to make your console a bit clearer (and if you want, you can disable the updater :-[]!)

These are the standard ones:
```lua
{
	-- Enable Updater
	updater = true,
	-- Enable logging
	logging = false,
	-- Enable Script
	scriptactive = true
}
```

# Advanced Usage
If you plan on making an event, maybe consider this: <https://stoppedwumm-studios.github.io/STScenes/mixed-scenes/>
