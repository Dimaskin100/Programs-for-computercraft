term.clear()
term.setCursorPos(1, 1)

local file = io.open(arg[1], "r")

if file then
  file:close()
else
  print("Error")
  while true do io.open() end
end

for line in io.lines(arg[1]) do
  print(line)
end
