term.clear()

local r = require("robotlib")
local robots = {}
local answer = nil

print("Write ID robots:")
local robotsID = io.read()

term.clear()

for txt in string.gmatch(robotsID, "%S+") do
table.insert(robots, tonumber(txt))
end

answer = r.connect(robots)

for k, v in pairs(answer) do
if v.msg == false then
    r.disconnect()
    print("Error")
    exit()
  end
end

while true do
term.clear()
  local vd = {}
  answer = io.read()

  if answer == "exit" then
    r.disconnect()
    term.clear()
    exit()
  end

  for txt in string.gmatch(answer, "%S+") do
table.insert(vd, tonumber(txt))
  end

  for i = 1, vd[1] do
    r.send("dgd", true)
r.send("d", true)
  end

  for i = 1, vd[2] do
    r.send("dg", true)
r.send("f", true)
  end

  for i = 1, vd[2] do
r.send("b", true)
  end

  for i = 1, vd[1] do
r.send("u", true)
  end
end
