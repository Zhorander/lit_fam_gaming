local animation = {}

function animation:new(image, width, height, duration)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o.spriteSheet = image
    o.quads = {}
    o.finished = false

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(o.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    o.duration = duration or 1
    o.currentTime = 0

    return o
end

function animation:draw(x, y)
    local spriteNum = math.floor(self.currentTime / self.duration * #self.quads) + 1
    love.graphics.draw(self.spriteSheet, self.quads[spriteNum], x, y, 0, 1)
end

function animation:isDone()
    return self.finished
end

function animation:update(dt)
    self.currentTime = self.currentTime + dt
    if self.currentTime >= self.duration then
        self.finished = true
        self.currentTime = self.currentTime - self.duration
    end
end

return animation