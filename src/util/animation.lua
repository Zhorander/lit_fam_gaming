local animation = {}

function animation:new(image, width, height, duration)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o.spriteSheet = image
    o.quads = {}
    o.finished = false
    o.height = height
    o.width = width

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

--[[ setBounds
     vstart - row start number
     vend - row end number
     hstart - column start number
     hend - column end number
]]
function animation:setBounds(vstart, vend, hstart, hend)
    self.quads = {}
    for y = (vstart * self.height) - self.height, (self.height * vend) - self.height, self.height do
        for x = (hstart * self.width) - self.width, (self.width * hend) - self.width, self.width do
            table.insert(self.quads, love.graphics.newQuad(x, y, self.width, self.height, self.spriteSheet:getDimensions()))
        end
    end
end

function animation:update(dt)
    self.currentTime = self.currentTime + dt
    if self.currentTime >= self.duration then
        self.finished = true
        self.currentTime = self.currentTime - self.duration
    end
end

return animation