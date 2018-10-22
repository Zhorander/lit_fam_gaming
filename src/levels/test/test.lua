local sti = require "sti"
local test = {}

function test.load()
    -- Load map file
    map = sti("assets/map/temp.lua")
end

function test.update(dt)
    -- Update world
    map:update(dt)
end

function test.draw()
    -- Draw world
    map:draw()
end

return test