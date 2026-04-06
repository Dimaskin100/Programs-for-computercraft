local robotlib = {}

if fs.exists("mif.lua") == false then
shell.run("wget https://raw.githubusercontent.com/Dimaskin100/Programs-for-computercraft/refs/heads/main/Programs/ForComputers/mif.lua")
end

if fs.exists("startup.lua") == false then
shell.run("wget https://raw.githubusercontent.com/Dimaskin100/Programs-for-computercraft/refs/heads/main/Programs/ForComputers/startup.lua")
end

local mif = require("mif")

mif.program("robotlib")

local robots = {}

local robots1 = mif.get("robots")

if robots1 == "" then
else
    for word in string.gmatch(robots1, "([^:]+)") do
    table.insert(robots, word)
end
end

rednet.open("right")

function robotlib.connect(robots1)
    for k, v in pairs(robots1) do
        if tonumber(v) == nil then
            return false
        end
    end

    local answers = {}
    for k, v in pairs(robots1) do
        rednet.send(v, "connect")
        local snr, msg = rednet.receive(2)
        if snr and snr == v then
            table.insert(answers, {id = snr, msg = msg, dte = dte})
            if msg == true then
                table.insert(robots, snr)
            end
        else
            table.insert(answers, {id = v, msg = false})
        end
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
    
    return answers
end

function robotlib.send(command, to)
    if #robots == 0 then
        return false
    end

    if to == true then
        to = robots
        else
            for k, v in pairs(to) do
                local proverka = false
           for k1, v1 in pairs(robots) do
           if v1 == v then proverka = true break end 
           end

           if proverka == false then return false end
            end
        end

    local answers = {}
    for k, v in pairs(to) do
        rednet.send(v, command)
        local snr, msg = rednet.receive(2)
        if snr and snr == v then
            table.insert(answers, {id = snr, msg = msg, dte = dte})
        else
            table.insert(answers, {id = v, msg = false})
        end
    end
    
    return answers
end

function robotlib.searchRobot(robots1)
    local answers = {}

    for k, v in pairs(robots1) do
rednet.send(v, "searchRobot")
        local snr, msg, dte = rednet.receive(0.3)

        if snr and snr == v and msg == "robot" then
            table.insert(answers, {id = snr, msg = true, dte = dte})
        else
            table.insert(answers, {id = v, msg = false})
        end
    end

    return answers
end

function robotlib.isHaveControl(robots1)
local answers = {}
    
for k, v in pairs(robots1) do
rednet.send(v, "isHaveControl")
        local snr, msg, dte = rednet.receive(0.3)

        if snr == v then
table.insert(answers, {id = snr, msg =  msg, dte = dte})
        else
            table.insert(answers, {id = v, msg = false})
        end
    end

    return answers
end

function robotlib.disconnect()
    if #robots == 0 then
        return false
    end

    for k, v in pairs(robots) do
        rednet.send(v, "disconnect")
    end
    robots = {}
    mif.set("robots", "")
    return true
end

return robotlib




