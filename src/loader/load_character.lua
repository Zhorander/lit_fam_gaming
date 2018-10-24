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
        char.currentAnimation = char.animations.moveLeft
        char:setPos(x, y)
    end)
    char:setKeyAction('s', function(char, dt)
        local x, y = char:getPos()
        y = y + char.step * dt
        char.currentAnimation = char.animations.moveDown
        char:setPos(x, y)
    end)
    char:setKeyAction('w', function(char, dt)
        local x, y = char:getPos()
        y = y - char.step * dt
        char.currentAnimation = char.animations.moveUp
        char:setPos(x, y)
    end)
    char:setKeyAction(' ', function(char, dt)
        char.currentAnimation = char.animations.attack
    end)

    --set an animation for moving
    char.animations.moveRight = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.5)
    char.animations.moveRight:setBounds(2, 2, 1, 6)

    char.animations.moveDown = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.5)
    char.animations.moveDown:setBounds(1, 1, 1, 8)

    char.animations.moveUp = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.5)
    char.animations.moveUp:setBounds(3, 3, 1, 6)

    char.animations.moveLeft = char.animations.moveRight

    char.animations.attack = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.2)
    char.animations.attack:setBounds(4, 4, 1, 5)

    return char
end

return CharacterLoader