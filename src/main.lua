-- main.lua
-- entry point of the game

local Stack = require('util.stack')
local Context = require('util.context')
local menu = require('menu.menu')

--Create global stack so any module can pop or push contexts
contextStack = Stack:new()

--Create contexts of all modules
menuContext = Context:new(menu)

--We'll start in the menu context
contextStack:push(menuContext)

local currentContext = contextStack:peek()
currentContext:set()