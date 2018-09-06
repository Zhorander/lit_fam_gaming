local menu = {}

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()


function menu.load()
    -- love.graphics.setFont(font)
end

function menu.draw()
    love.graphics.setColor(0, 255, 153)

    local rect_x = width * .2
    local rect_y = height * .1

    love.graphics.rectangle('fill', rect_x, rect_y, .6 * width, .2 * height)

    love.graphics.setColor(0,0,0)
    love.graphics.printf('LIT FAM GAMING', rect_x * 2, rect_y * 1.7, 200, 'center')
    love.graphics.print('START', rect_x * 1, 250)
    love.graphics.print('SETTINGS', rect_x * 1, 300)

end

function menu.update()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
end

return menu
