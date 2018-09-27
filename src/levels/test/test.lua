local sti = require "sti"

function love.load()
    -- Load map file
    map = sti("assets.map.test.lua")
end

function love.update(dt)
    -- Update world
    map:update(dt)
end

function love.draw()
    -- Draw world
    map:draw()
end