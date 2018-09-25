-- small demo for TiledMap loader
--love.filesystem.load("tiledmap.lua")()
tileMap = require('loader.loader') 

local testLevel = {}

gKeyPressed = {}
gCamX,gCamY = 100,100
 
function testLevel.load()
	TiledMap_Load("assets/map/test.tmx")
end
 
function testLevel.keyreleased( key )
	gKeyPressed[key] = nil
end
 
function testLevel.keypressed( key, unicode ) 
	gKeyPressed[key] = true 
	if (key == "escape") then os.exit(0) end
	if (key == " ") then -- space = next map
		gMapNum = (gMapNum or 1) + 1
		if (gMapNum > 10) then gMapNum = 1 end
		TiledMap_Load(string.format("map/map%02d.tmx",gMapNum))
		gCamX,gCamY = 100,100
	end
end
 
function testLevel.update( dt )
	local s = 500*dt
	if (gKeyPressed.up) then gCamY = gCamY - s end
	if (gKeyPressed.down) then gCamY = gCamY + s end
	if (gKeyPressed.left) then gCamX = gCamX - s end
	if (gKeyPressed.right) then gCamX = gCamX + s end
end
 
function testLevel.draw()
    love.graphics.print('arrow-keys=scroll, space=next map', 50, 50)
	love.graphics.setBackgroundColor(0x80,0x80,0x80)
	TiledMap_DrawNearCam(gCamX,gCamY)
end

return testLevel
