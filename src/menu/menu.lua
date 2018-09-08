local gui = require('util.Gspot')

local menu = {}
local start
local gui = gui()

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()


function menu.load()
    font = love.graphics.newFont('assets/truthwillout.ttf', 50)
    love.graphics.setFont(font)
    love.graphics.setBackgroundColor(255,25,255)

    start = gui:button('START', {x = width * .2, y = 250, w = 128, h = gui.style.unit})
    quit = gui:button('QUIT', {x = width * .2, y = 250 + gui.style.unit, w = 128, h = gui.style.unit})

    function start:click(x, y) print('Ouch!') end
    function quit:click(x,y) love.quit() end
end

function menu.draw()
    love.graphics.setColor(0, 255, 153)

    local rect_x = width * .2
    local rect_y = height * .1

    love.graphics.rectangle('fill', rect_x, rect_y, .6 * width, .2 * height)

    love.graphics.setColor(0,0,0)
    love.graphics.printf('LIT FAM GAMING', rect_x * 2, rect_y * 1.7, 200, 'center')

    gui:draw()
end

function menu.update(dt)
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    gui:update(dt)
end

function menu.keypressed(key)
    if gui.focus then
        gui:keypress(key) -- only sending input to the gui if we're not using it for something else
    end
end

function menu.mousepressed(x, y, button)
    gui:mousepress(x, y, button) -- pretty sure you want to register mouse events
end

function menu.mousereleased(x, y, button)
    gui:mouserelease(x, y, button)
end

function menu.quit()
    os.exit()
end

return menu