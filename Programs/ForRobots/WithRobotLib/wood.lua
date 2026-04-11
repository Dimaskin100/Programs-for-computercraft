local r = require("robotlib")
local mif = require("mif")

mif.program("startup")
mif.set("program", "wood.lua")

mif.program("wood")

local robots = {}
local robots1 = mif.get("robots")
local answer = nil

if robots1 == "" then
    print("Write ID robots:")
local robotsID = io.read()

term.clear()

for txt in string.gmatch(robotsID, "%S+") do
table.insert(robots, tonumber(txt))
end

    local text = ""
    for k, v in pairs(robots) do
        if k == 1 then
           text = v
           else
            text = text..":"..v
        end
    end
    mif.set("robots", text)

    answer = r.connect(robots)

for k, v in pairs(answer) do
if v.msg == false then
    mif.set("robots", "")
    r.disconnect()
    print("Error")
  end
end
    
else
    for word in string.gmatch(robots1, "([^:]+)") do
    table.insert(robots, tonumber(word))
end
end

if not mif.get("robots") == "" then
while true do
    if rs.getOutput("left") == true then
        r.send("r", true) r.send("r", true)
        
        for i = 2, 15 do
            r.send("sel "..i, true)
            r.send("dr", true)
        end
        r.send("sel 1", true)

        r.send("r", true) r.send("r", true)
    end
    
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
end
