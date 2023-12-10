local failed = {
	failed = false,
	err = ""
}

local HTTP = game:GetService("HttpService")

local NewestVersion = HTTP:GetAsync("https://stoppedwumm-studios.github.io/STScenes/api/v1/new")

local Certificate =  HTTP:GetAsync("https://stoppedwumm-studios.github.io/STScenes/api/v1/cert")

local MyCert = "KI108TTRE01LA"
local MyVersion = "0.1.0"

if tostring(Certificate):find(MyCert) then
	if NewestVersion:find(MyVersion) then
		
	else
		print("Older Version and newest certificate")
		failed.failed = true
		warn("Please upgrade this ModuleScript immediatly if you drag and dropped it out of your toolbox")
		failed.err = "Please upgrade immediatly"
	end
else
	warn("Old or unvalid Certificate, cannot upgrade: Needed: " .. Certificate .. ", has " .. MyCert)
	failed.failed = true
	failed.err = "Wrong Certificate"
end

return failed
