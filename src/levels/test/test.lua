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

    --set player layer in camera
    mainCamera:newLayer(3, function()character:draw();end)
    --set background layer in camera
    mainCamera:newLayer(1, function()map:draw();end)

    --set camera to character's position
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
        character:setPos(x, y - delta)
    end
    if love.keyboard.isDown('s') then
        delta = step * dt
        local x, y = character:getPos()
        character:setPos(x, y + delta)
    end
    if love.keyboard.isDown('a') then
        delta = step * dt
        local x, y = character:getPos()
        character:setPos(x - delta, y)
    end

    --set camera to follow character's position
    local x, y = character:getPos()
    mainCamera:setPosition(x, y)
end

function test.draw()
    mainCamera:draw()
end

function test.keypressed(key)
    if key == 'q' then
        love.event.push('q')
    end
end


return test