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

        --if we just mirror the sprite, then there's a weird offset
        if char.x_dir == -1 then x = char.x - char.sprite_size end
        char.x_dir = 1 --we're facing right now
        char.full_direction = 'right'

        x = x + char.step * dt
        char.currentAnimation = char.animations.moveRight
        char:setPos(x, y)
    end)
    char:setKeyAction('a', function(char, dt)
        local x, y = char:getPos()
        
        if char.x_dir == 1 then x = char.x + char.sprite_size end
        char.x_dir = -1 --we're facing left now
        char.full_direction = 'left'

        x = x - char.step * dt
        char.currentAnimation = char.animations.moveLeft
        char:setPos(x, y)
    end)
    char:setKeyAction('s', function(char, dt)
        char.full_direction = 'down'
        local x, y = char:getPos()
        y = y + char.step * dt
        char.currentAnimation = char.animations.moveRight
        char:setPos(x, y)
    end)
    char:setKeyAction('w', function(char, dt)
        char.full_direction = 'up'
        local x, y = char:getPos()
        y = y - char.step * dt
        char.currentAnimation = char.animations.moveUp
        char:setPos(x, y)
    end)
    char:setKeyAction('space', function(char, dt)
        if char.full_direction == 'up' then
            char.currentAnimation = char.animations.attackUp
        elseif char.full_direction == 'down' then
            char.currentAnimation = char.animations.attackDown
        else
            char.currentAnimation = char.animations.attackSide
        end
    end)

    --set an animation for moving
    char.animations.moveRight = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.5)
    char.animations.moveRight:setBounds(2, 2, 1, 6)

    char.animations.moveDown = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.5)
    char.animations.moveDown:setBounds(1, 1, 1, 8)

    char.animations.moveUp = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.5)
    char.animations.moveUp:setBounds(3, 3, 1, 6)

    char.animations.moveLeft = char.animations.moveRight

    char.animations.attackDown = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.4)
    char.animations.attackDown:setBounds(6, 6, 1, 6)

    char.animations.attackUp = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.4)
    char.animations.attackUp:setBounds(5, 5, 1, 6)

    char.animations.attackSide = Animation:new(char.image, char.sprite_size, char.sprite_size, 0.2)
    char.animations.attackSide:setBounds(4, 4, 1, 5)

    return char
end

return CharacterLoader