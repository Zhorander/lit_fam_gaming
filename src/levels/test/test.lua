local Character = require("util.character")
local sti = require "sti"

local step = 100
local delta = 0.1
local test = {}
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

    if love.keyboard.isDown('d') then
        delta = step * dt
        local x, y = character:getPos()
        character:setPos(x + delta, y)    
    end
    if love.keyboard.isDown('w') then
        delta = step * dt
        local x, y = character:getPos()
        character:setPos(x - delta, y)
    end
    if love.keyboard.isDown('s') then
        delta = step * dt
        local x, y = character:getPos()
        character:setPos(x, y + delta)
    end
    if love.keyboard.isDown('a') then
        delta = step * dt
        local x, y = character:getPos()
        character:setPos(x, y - delta)
    end

    local x, y = character:getPos()
    mainCamera:set_position(x, y)
end

function test.draw()
    -- Draw world
    map:draw()

    --draw player
    character:draw()
end


return test