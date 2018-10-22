local Character = {}

function Character:new(child, id, path, sprite_size)
    local child = child or {}

    child = setmetatable(child, self)
    self.__index = self
    child.id = id
    child.path = path
    child.x = 0
    child.y = 0
    child.sprite_size = sprite_size
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
    love.graphics.draw(self.image, self.quad, self.x, self.y)
end

return Character