--Part of the LPPLIB Project
-- https://github.com/gnmmarechal/lpplibs
-- debuglib

--Colours
	Debug.color.white = Color.new(255,255,255)
	Debug.color.green = Color.new(0,240,32)
	Debug.color.red = Color.new(255,0,0)
	Debug.color.black = Color.new(0,0,0)
	Debug.color.current = Debug.color.white
	
function Debug.setDebugColor(colorname) --Sets default debug lib text colour
	Debug.color.current = colorname
end


--Using code from Eucliod r6 for Debug.getFPS()
Debug.var.fpstimer = Timer.new()
Debug.var.fps = 0
Debug.var.fps_counter = 0
function Debug.getFPS() --Gets framerate and returns its value
	Debug.var.fps_counter = Debug.var.fps_counter + 1
	if Timer.getTime(Debug.var.fpstimer) > 1000 then
		Timer.reset(Debug.var.fpstimer)
		Debug.var.fps = Debug.var.fps_counter
		Debug.var.fps_counter = 0
	end
	return Debug.var.fps
--	gpu_drawtext(160, 220, Debug.var.fps)
end
function Debug.drawFPS(DISPLAY) --Draws FPS on either TOP_SCREEN or BOTTOM_SCREEN
	Debug.var.framerate = Debug.getFPS()
	Screen.debugPrint(0,0,"FPS:"..Debug.var.framerate, Debug.color.current, DISPLAY)
end