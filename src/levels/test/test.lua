local Character = require("util.character")

local sti = require "sti"
local test = {}

local step = 100
local delta = 0.1

function test.load()
    -- Load map file
    map = sti("assets/map/temp.lua")

    --load character
    character = Character:new(nil, 0, 'assets/RoguePlayer.png', 32)
end

function test.update(dt)
    -- Update world
    map:update(dt)

    if love.keyboard.isDown('d') then
        delta = step * dt
        test.keypressed('d')
    end
    if love.keyboard.isDown('w') then
        delta = step * dt
        test.keypressed('w')
    end
    if love.keyboard.isDown('s') then
        delta = step * dt
        test.keypressed('s')
    end
    if love.keyboard.isDown('a') then
        delta = step * dt
        test.keypressed('a')
    end
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
        character:setPos(x + delta, y)
    end
    if k == 'a' then
        local x, y = character:getPos()
        character:setPos(x - delta, y)
    end
    if k == 's' then
        local x, y = character:getPos()
        character:setPos(x, y + delta)
    end
    if k == 'w' then
        local x, y = character:getPos()
        character:setPos(x, y - delta)
    end
end

return test