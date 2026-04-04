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