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
  local d = 0
  local n, i1 = 1, 0
  answer = io.read()

  if answer == "exit" then
    r.disconnect()
    term.clear()
    exit()
  else
    answer = tonumber(answer)

    if answer > 1024 then
answer = 1024
    end
  end
  
r.send("dgu", true)
r.send("u", true)
  
  for i = 1, d do
if i1 == 64 then
i1 = 0
n = n + 1
      r.send("sel "..n, true)
    end
    i1 = i1 + 1
    r.send("dg", true) r.send("f", true)
    r.send("dgd", true) r.send("pd", true)
  end

  for i = 1, d do
r.send("b", true)
  end
r.send("d", true)
  n = 1
end
