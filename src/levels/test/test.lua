local CharacterLoader = require "loader.load_character"
local sti = require "sti"

local step = 100
local delta = 0.1
local test = {}
local character = {}

function test.load()
    -- Load map file
    map = sti("assets/map/temp.lua")

    --load character
    --character = Character:new(nil, 0, 'assets/RoguePlayer.png', 32)
    character = CharacterLoader:create('assets/RoguePlayer.png', 0, 32, 1, 1)
end

function test.update(dt)
    -- Update world
    map:update(dt)
    --update character
    character:update(dt)

    if love.keyboard.isDown('d') then
        character:doKeyAction('d', dt)   
    elseif love.keyboard.isDown('w') then
        character:doKeyAction('w', dt)
    elseif love.keyboard.isDown('s') then
        character:doKeyAction('s', dt)
    elseif love.keyboard.isDown('a') then
        character:doKeyAction('a', dt)
    elseif love.keyboard.isDown('space') then
        character:doKeyAction(' ', dt)
    end

    --set camera to follow character's position
    local x, y = character:getPos()
end

function test.draw()
    map:draw()
    character:draw()
end

function test.keypressed(key)
    if key == 'q' then
        love.event.quit()
    end
end


return test