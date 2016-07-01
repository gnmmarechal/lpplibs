--Part of the LPPLIB Project
-- https://github.com/gnmmarechal/lpplibs
-- debuglib
debuglibversion = 1
DebugLib = {}

--Colours
	DebugLib.colorwhite = Color.new(255,255,255)
	DebugLib.colorgreen = Color.new(0,240,32)
	DebugLib.colorred = Color.new(255,0,0)
	DebugLib.colorblack = Color.new(0,0,0)
	DebugLib.colorcurrent = DebugLib.color.white
	
function DebugLib.setDebugColor(colorname) --Sets default debug lib text colour
	DebugLib.colorcurrent = colorname
end

function DebugLib.require(version)
	if debuglibversion == version then
	else
		System.exit()
	end
end


--Using code from Eucliod r6 for DebugLib.getFPS()
DebugLib.varfpstimer = Timer.new()
DebugLib.varfps = 0
DebugLib.varfps_counter = 0
function DebugLib.getFPS() --Gets framerate and returns its value
	DebugLib.varfps_counter = DebugLib.varfps_counter + 1
	if Timer.getTime(DebugLib.varfpstimer) > 1000 then
		Timer.reset(DebugLib.varfpstimer)
		DebugLib.varfps = DebugLib.varfps_counter
		DebugLib.varfps_counter = 0
	end
	return DebugLib.varfps
--	gpu_drawtext(160, 220, DebugLib.var.fps)
end
function DebugLib.drawFPS(DISPLAY) --Draws FPS on either TOP_SCREEN or BOTTOM_SCREEN
	DebugLib.varframerate = DebugLib.getFPS()
	Screen.debugPrint(0,0,"FPS:"..DebugLib.varframerate, DebugLib.colorcurrent, DISPLAY)
end
function DebugLib.takeScreenshot()
	day_value,day,month,year = System.getDate()
	h,m,s = System.getTime()
	System.takeScreenshot("/scrshot-"..day_value..day..month..year..h..m..s..".bmp",false)
end