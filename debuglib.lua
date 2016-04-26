--Part of the LPPLIB Project
-- https://github.com/gnmmarechal/lpplibs
-- debuglib
debuglibversion = 1
Debug = {}

--Colours
	Debug.colorwhite = Color.new(255,255,255)
	Debug.colorgreen = Color.new(0,240,32)
	Debug.colorred = Color.new(255,0,0)
	Debug.colorblack = Color.new(0,0,0)
	Debug.colorcurrent = Debug.color.white
	
function Debug.setDebugColor(colorname) --Sets default debug lib text colour
	Debug.colorcurrent = colorname
end

function debuglib.require(version)
	if debuglibversion == version then
	else
		System.exit()
	end
end


--Using code from Eucliod r6 for Debug.getFPS()
Debug.varfpstimer = Timer.new()
Debug.varfps = 0
Debug.varfps_counter = 0
function Debug.getFPS() --Gets framerate and returns its value
	Debug.varfps_counter = Debug.varfps_counter + 1
	if Timer.getTime(Debug.varfpstimer) > 1000 then
		Timer.reset(Debug.varfpstimer)
		Debug.varfps = Debug.varfps_counter
		Debug.varfps_counter = 0
	end
	return Debug.varfps
--	gpu_drawtext(160, 220, Debug.var.fps)
end
function Debug.drawFPS(DISPLAY) --Draws FPS on either TOP_SCREEN or BOTTOM_SCREEN
	Debug.varframerate = Debug.getFPS()
	Screen.debugPrint(0,0,"FPS:"..Debug.varframerate, Debug.colorcurrent, DISPLAY)
end
function Debug.takeScreenshot()
	day_value,day,month,year = System.getDate()
	h,m,s = System.getTime()
	System.takeScreenshot("/scrshot-"..day_value..day..month..year..h..m..s..".bmp",false)
end