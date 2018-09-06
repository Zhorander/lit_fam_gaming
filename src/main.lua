-- main.lua
-- entry point of the game

local menu = require('menu.menu')

function love.load()
    font = love.graphics.newFont('assets/truthwillout.ttf', 50)
    love.graphics.setFont(font)
    love.graphics.setBackgroundColor(255,25,255)
    menu.load()
    --other.load()
end

function love.update()
    menu.update()
end

function love.draw()
    menu.draw()
end
