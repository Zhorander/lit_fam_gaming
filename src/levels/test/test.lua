local Character = require("util.character")

local sti = require "sti"
local test = {}

function test.load()
    -- Load map file
    map = sti("assets/map/temp.lua")

    --load character
    character = Character:new(nil, 0, 'assets/RoguePlayer.png', 32)
    print('<><><><><><><><><',character)
end

function test.update(dt)
    -- Update world
    map:update(dt)
end

function test.draw()
    -- Draw world
    map:draw()

    --draw player
    character:draw()
end

return test