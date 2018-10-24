local Actor = require "util.actor"

local Character = {}
Actor:new(Character) -- Character is a child class of Actor

function Character:new(child, id, path, sprite_size)
    local child = child or {}

    child = setmetatable(child, self)
    self.__index = self
    child.id = id
    child.path = path
    child.step = 100
    child.x = 0
    child.y = 0
    child.x_dir = 1
    child.y_dir = 1
    child.full_direction = 'right'
    child.rotation = 0
    child.animations = {}
    child.sprite_size = sprite_size
    child.currentAnimation = nil
    child.image = love.graphics.newImage(path)
    child.quad = love.graphics.newQuad(0, 0, sprite_size, sprite_size, child.image:getDimensions())

    return child
end

-- set the quadrant position for the sprite
-- perhaps we need to make an animation class instead?
function Character:setQuad(x, y)
    self.quad =
    love.graphics.newQuad(x, y, self.sprite_size, self.sprite_size, self.image:getDimensions())
end

function Character:setPos(x, y)
    self.x = x
    self.y = y
end

function Character:getPos()
    return self.x, self.y
end

function Character:getId()
    return self.id
end

function Character:setId(id)
    self.id = id
end

function Character:draw()
    --if we're running an animation, then don't draw the character over it
    if self.currentAnimation then
        self.currentAnimation:draw(self.x, self.y, self.rotation, self.x_dir, self.y_dir)
    else
        love.graphics.draw(self.image, self.quad, self.x, self.y, self.rotation, self.x_dir, self.y_dir)
    end
end

function Character:update(dt)
    --update currently running animation
    if self.currentAnimation then
        self.currentAnimation:update(dt)
        --check if animation is finished
        if self.currentAnimation:isDone() then
            self.currentAnimation = nil
        end
    end

    if love.keyboard.isDown('d') then
        self:doKeyAction('d', dt)   
    elseif love.keyboard.isDown('w') then
        self:doKeyAction('w', dt)
    elseif love.keyboard.isDown('s') then
        self:doKeyAction('s', dt)
    elseif love.keyboard.isDown('a') then
        self:doKeyAction('a', dt)
    end
    if love.keyboard.isDown('space') then
        self:doKeyAction('space', dt)
    end

    if self.full_direction == 'up' then
        self.quad = love.graphics.newQuad(self.sprite_size * 5, 2 * self.sprite_size, self.sprite_size, self.sprite_size, self.image:getDimensions())
    else
        self.quad = love.graphics.newQuad(0, 0, self.sprite_size, self.sprite_size, self.image:getDimensions())
    end
end

return Character