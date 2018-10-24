local Character = require "util.character"
local Actor = require "util.actor"
local Animation = require "util.animation"

local CharacterLoader = {}

function CharacterLoader:create(path, id, size, x, y)
    local char = Character:new(nil, id, path, size)
    char:setPos(x or 1, y or 1)

    --set character actions
    char:setKeyAction('d', function(char, dt)
        local x, y = char:getPos()
        x = x + char.step * dt
        char.currentAnimation = char.animations.moveRight
        char:setPos(x, y)
    end)
    char:setKeyAction('a', function(char, dt)
        local x, y = char:getPos()
        x = x - char.step * dt
        char:setPos(x, y)
    end)
    char:setKeyAction('s', function(char, dt)
        local x, y = char:getPos()
        y = y + char.step * dt
        char:setPos(x, y)
    end)
    char:setKeyAction('w', function(char, dt)
        local x, y = char:getPos()
        y = y - char.step * dt
        char:setPos(x, y)
    end)

    --set an animation for moving
    char.animations.moveRight = Animation:new(char.image, char.sprite_size, char.sprite_size, 2)

    return char
end

return CharacterLoader