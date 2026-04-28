term.clear()

sleep(1)

local r = require("robotlib")

local robots = {}
local answer = nil

local mif = require("mif")

mif.program("startup")
if mif.get("program") == "mine.lua" then
else
    mif.set("program", "mine.lua")
end

mif.program("mine")
if mif.get("number") == false then
mif.set("number", 0)
sleep(0.1)
mif.set("i", 0)
sleep(0.1)
mif.set("d", 0)
sleep(0.1)
mif.set("u", 0)
end

if r.getRobots() == false then

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
    print("Error connect")
    while true do io.read() end
  end
end

end

local number = tonumber(mif.get("number"))
sleep(0.1)
local i = tonumber(mif.get("i"))
sleep(0.1)
local d = tonumber(mif.get("d"))
sleep(0.1)
local u = tonumber(mif.get("u"))

while true do
    if number == 0 then
term.clear()
    
    print("Write number blocks: ")
    number = tonumber(io.read())

        term.clear()

        if number == nil then
            r.disconnect()
    print("Error number")
        while true do io.read() end
        end

        mif.set("number", number)
    end

    while i <= number do

            while true do
                answer = r.send("dgd", true)

                for k, v in pairs(answer) do
                    if v.msg == false then
                        stop = true
                        break
                    end
                end

                if stop == true then
                    break
                end
                r.send("d", true)
                
                d = d + 1
                mif.set("d", d)
            end

            while u <= d do
                r.send("dgu", true)
                r.send("u", true)

                u = u + 1
                mif.set("u", u)
            end
            
            i = i + 1
            mif.set("i", i)
        end
number = 0
i = 0
d = 0
u = 0
        
mif.set("number", 0)
mif.set("i", 0)
mif.set("d", 0)
mif.set("u", 0)
    end
