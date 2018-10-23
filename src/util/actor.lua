--[[ The actor class specifies what an object should do
     given some input
]]

local Actor = {}

function Actor:new(child)
    child = child or {}
    setmetatable(child, self)
    self.__index = self
    child.is_actor = true
    child.keyboardActions = {}

    return child
end

function Actor:setKeyAction(key, action)
    assert(type(action) == 'function')
    assert(type(key) == 'string')
    self.keyboardActions[key] = action
end

function Actor:doKeyAction(key)
    if self.keyboardActions[key] then
        self.keyboardActions[key](self)
    end
end