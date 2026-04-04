local r = require("robotlib")
local robots = {}

print("Write ID robots: ")
local one = tonumber(io.read())
local two = tonumber(io.read())

term.clear()

for i = one, two do
table.insert(robots, i)
end

local answer = r.connect(robots)

for k, v in pairs(answer) do
  if v.msg == false then
print("Error")
    exit()
  end
end

print("Write waiting time in seconds: ")
local time = tonumber(io.read)
