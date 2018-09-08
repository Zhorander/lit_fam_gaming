local function empty() end

local Context = {
    load = empty,
    draw = empty,
    update = empty,
    keypressed = empty,
    keyreleased = empty,
    mousepressed = empty,
    mousereleased = empty,
    filedropped = empty,
    focus = empty,
    quit = empty,
    textinput = empty,
    visible = empty,
    wheelmoved = empty
}

--[[ Creates a new context from a given module
    Usage: local Menu = require'menu' local menuContext = Context:new(menu)
]]
function Context:new(module)
    local o = setmetatable({}, self)
    self.__index = self

    --check every variable in module
    --if it's a love function, then add it to the context
    for var,val in pairs(module) do
        if o[var] then o[var] = val end
    end

    return o
end

--set the current context to a module
function Context:set()
    self.load() --call current module's load since love won't
    for var,val in pairs(self) do -- e.g. love['update'] = currentContext['upddate']
        love[var] = val
    end
end

--nukes the current context
--by setting each love function to an empty function
function Context.remove()
    Context.set(Context)
end

return Context