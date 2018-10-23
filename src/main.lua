-- main.lua
-- entry point of the game

local Stack = require('util.stack')
local Context = require('util.context')
local menu = require('menu.menu')
local testLevel = require('levels.test.test')
local Camera = require('util.camera')

--create main global camera
mainCamera = Camera()

--Create global stack so any module can pop or push contexts
contextStack = Stack:new()

--Create contexts of all modules
menuContext = Context:new(menu)
testLevelContext = Context:new(testLevel)

--We'll start in the menu context
--contextStack:push(menuContext)
contextStack:push(testLevelContext)

local currentContext = contextStack:peek()
currentContext:set()
