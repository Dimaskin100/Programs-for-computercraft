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
answer = r.send("dt", true)

  for k, v in pairs(answer) do
  if v.msg == true then

r.send("dg", v.id) r.send("f", v.id)
      r.send("dgd", v.id)
      
local u = 0
      while r.send("dtu", v.id) do
u = u + 1
      r.send("dgu", v.id) r.send("u", v.id)
      end

      for i = 0, u do
r.send("d", v.id)
      end
      r.send("pd", v.id) r.send("b", v.id)
      
    end
  end
  
end
