local camera = {}

camera.x = 0
camera.y = 0
camera.scale_x = 1
camera.scale_y = 1
camera.rotation = 0
camera.layers = {}

function camera:new()
    return setmetatable({}, {__index = self})
end

function camera:newLayer(scale, func)
    table.insert(self.layers, {draw = func, scale = scale})
    table.sort(self.layers, function(a, b) return a.scale < b.scale end)
end

function camera:setPosition(nx, ny)
    self.x = nx
    self.y = ny
end

function camera:draw()
    local bx, by = self.x, self.y

    for _,v in ipairs(self.layers) do
        self.x = bx * v.scale
        self.y = by * v.scale
        camera:set()
        v.draw()
        camera:unset()
    end
end

function camera:set()
    love.graphics.push()
    love.graphics.rotate(-self.rotation)
    love.graphics.scale(1 / self.scale_x, 1 / self.scale_y)
    love.graphics.translate(-self.x, -self.y)
end

function camera:unset()
    love.graphics.pop()
end

function camera:move(dx, dy)
    self.x = self.x + (dx or 0)
    self.y = self.y + (dy or 0)
end

function camera:rotate(dr)
    self.rotation = self.rotation + dr
end

function camera:scale(sx, sy)
    sx = sx or 1
    self.scale_x = self.scale_x + sx
    self.scale_y = self.scale_y + sy
end

function camera:setScale(sx, sy)
    self.scale_x = sx or self.scale_x
    self.scale_y = sy or self.scale_y
end

local new = function()
    return camera:new()
end

return setmetatable(camera, {__call = new})
