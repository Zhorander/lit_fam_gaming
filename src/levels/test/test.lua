local CharacterLoader = require "loader.load_character"
local sti = require "sti"
local bump = require "util.bump"

local step = 100
local delta = 0.1
local test = {}
local character = {}

function test.load()
    -- Load map file
    world = bump.newWorld()
    map = sti("assets/map/temp.lua", {"bump"})
    map:bump_init(world)

    --load character
    --character = Character:new(nil, 0, 'assets/RoguePlayer.png', 32)
    character = CharacterLoader:create('assets/RoguePlayer.png', 0, 32, 48, 48)
    --world.add(character, 48, 48, 32, 32)
end

function test.update(dt)
    -- Update world
    map:update(dt)
    --update character
    character:update(dt)
end

function test.draw()
    map:draw()
    --un-comment to show the collision on walls
    -- map:bump_draw(world)

    character:draw()
end

function test.keypressed(key)
    if key == 'q' then
        love.event.quit()
    end
end


return test