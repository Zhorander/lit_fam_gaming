local Character = require("util.character")
local sti = require "sti"

local test = {}
local step = 5
local character = {}

function test.load()
    -- Load map file
    map = sti("assets/map/temp.lua")

    --load character
    character = Character:new(nil, 0, 'assets/RoguePlayer.png', 32)
end

function test.update(dt)
    -- Update world
    map:update(dt)

    local x, y = character:getPos()
    mainCamera:set_position(x, y)
end

function test.draw()
    -- Draw world
    map:draw()

    --draw player
    character:draw()
end

function test.keypressed(k)
    if k == 'd' then
        local x, y = character:getPos()
        character:setPos(x + step, y)
    end
    if k == 'a' then
        local x, y = character:getPos()
        character:setPos(x - step, y)
    end
    if k == 's' then
        local x, y = character:getPos()
        character:setPos(x, y + step)
    end
    if k == 'w' then
        local x, y = character:getPos()
        character:setPos(x, y - step)
    end
end

return test