if fs.exists("mif.lua") == false then
shell.run("wget https://raw.githubusercontent.com/Dimaskin100/Programs-for-computercraft/refs/heads/main/Programs/ForComputers/mif.lua")
end

if fs.exists("startup.lua") == false then
shell.run("wget https://raw.githubusercontent.com/Dimaskin100/Programs-for-computercraft/refs/heads/main/Programs/ForComputers/startup.lua")
end

local mif = require("mif")

mif.program("startup")
mif.set("program", "wood.lua")

term.clear()

while true do
if turtle.detect() then

    turtle.dig()
turtle.forward()
turtle.digDown()

local a = 0

while turtle.detectUp() do
a = a + 1
turtle.digUp()
turtle.up()
end

for i = 1, a do
turtle.digDown()
turtle.down()
end

turtle.placeDown()
turtle.back()

end
end
