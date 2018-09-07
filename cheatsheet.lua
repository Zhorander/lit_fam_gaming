-- <><><><><> Comments <><><><><>

-- single line comment

--[[
    Multi line
    Comment
]]

-- <><><><><> Variables <><><><><>

--using local binds a variable to a scope
do -- do starts a block, which also starts a scope
    local x = 23
    print(x) -- 23
end
print(x) -- nil

a,b,c = 1,2,3 -- multiple assignment

type(2) -- 'number'
type({}) -- 'table'
type('s') -- 'string'

--<><><><><> Strings <><><><><>
hello = "hello"
world = 'world'

--multi line string
long_string = [[Hello,
World!
what
a long
string!]]

hello_world = hello .. world .. '\n'

print(string.len(hello))
--same as
print(#hello)

--<><><><><> Loops <><><><><>
while cond do --anything that isn't nil or false is true
    --stuff
end

for i=1,20 do print(i) end

for i=1,20,2 do print(i) end

--[[print all key value pairs in a table
e.g.
    1          23
    2          4
    thing      'other thing'
    square     function
]]
for key,value in pairs(table) do
    print(key, value)
end

for int_key,value in ipairs(table) do --use only integer indexes
    print(int_key, value)
end

--<><><><><> conditionals <><><><><>
if 'thing' and 2 then --anything that isn't nil or false is true
    print('hi')
elseif never_getting_here == 2 then
    print('unreachable code')
else
    print('more unreachable code')
end

a = 3 or 'thing' -- a = 3
a = false or 'thing' -- a = 'thing'
a = nil or 'thing' -- a = 'thing'

a = 3 and 'thing' -- a = 'thing'
a = 3 and nil -- a = nil
a = false and 3 -- a = false

--<><><><><> Tables <><><><><>

t = {} --table with nothing in it
t.['thing'] = 'other thing'
--same as
t.thing = 'other thing'
t[1] = 23
t[2] = 4

--We can do it all at once
t = {
    ['thing'] = 'other thing',
    --same as
    thing = 'other thing',
    [1] = 23,
    [2] = 4
}

-- We can make just an array too
t = {1,2,3,4,'what am i doing here?', function() print('hi') end}

--if we want to insert values sequentially we can use table.insert()
for i=1,20 do
    table.insert(t, i)
end

function t.thing() --[[stuff]] end
--same as
t.thing = function() --[[stuff]] end

--if we want to refer to a specific instance of t
function t:thing()
    print(self.x)
end
--same as
function t.thing(self)
    print(self.x)
end

--<><><><><> Functions <><><><><>
function a()
    print('hi')
end
--same as
a = function() print('hi') end

--variable arg functions
function greet(greeting, ...)
    local people = {...} --good practice to use local as often as you can to avoid overriding other variables
    for i,j in ipairs(people) do
        print(greeting .. j)
    end
end

greet('Hello, ', 'Person1', 'Person2')

--functions can return multiple values
a,b = (funtion() return 2,3 end)()

--functions without a return statement implicitly return nil
a = (function() end)()
print(a) -- nil

--<><><><><> Metatables <><><><><>
-- Metatables are just tables with fun functions, kinda
t = {}
t.__index = other_table --if t[i] isn't in t then search other_table for it
t.__call = function() end --invoking t() will call this function
t.__add = function(a,b) end -- behaviour for doing t + something
t.__sub = function(a,b) end --you get the picture

--set the metatable with the setmetatable function
y = {}
y = setmetatable(y, t)

y + something -- will invoke t.__add
y() -- will invoke t.__call

-- a more terse example
y = setmetatable({}, t)

--<><><><><> Classes <><><><><>
-- The conventional way to create a class is:
Class = {}
--constructor
function Class:new(o) --Optional arg o to make into child class
    --if we call Class:new(), then self will refer to Class
    --but if we do this:
    --   a = Class:new() then
    --   calling a:new(), self will refer to a
    local o = o or {} -- if o is nil then the 'or' returns a table {}
    o = setmetatable(o, self) -- we set self to be superclass/template for o
    self.__index = self -- since self is o's metatable, anything not found in o will be looked for in self

    --constructor stuff
    o.thing = 23
    o.otherthing = 'efes'

    return o
end

function Class:getX()
    return self.x
end

--<><><><><> The Math Module <><><><><>
--The Math module has some interesting things
--We can require it, but it's usually already in the global scope
local math = require('math')

print( math.sqrt(4) )
print( math.pow(3, 2) )
print( math.sin(90) )
print( math.sin(math.pi) )
