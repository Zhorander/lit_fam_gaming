local Stack = {
    stack = {}
}

--create new stack object
function Stack:new(o)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

--push a value
function Stack:push(val)
    if not val then
        print('Nothing given to push')
        return
    end

    table.insert(self.stack, val)
end

--check if stack is empty
function Stack:isEmpty()
    return #self.stack == 0
end

--pop and return the top value
function Stack:pop()
    local top = self.stack[#self.stack]
    self.stack[#self.stack] = nil
    return top
end

--[[
    Creates an iterator that pops values off the stack

    Usage: for i in [stack_obj]:iterPop() do stuff end
]]
function Stack:iterPop()
    return function()
        return self:pop()
    end
end

--look at the top value in the stack
function Stack:peek()
    return self.stack[#self.stack]
end

return Stack