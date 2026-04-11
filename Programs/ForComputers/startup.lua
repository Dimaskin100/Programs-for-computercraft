if fs.exists("mif.lua") == false then
shell.run("wget https://raw.githubusercontent.com/Dimaskin100/Programs-for-computercraft/refs/heads/main/Programs/ForComputers/mif.lua")
end

local mif = require("mif")

mif.program("startup")

local program = mif.get("program")

if fs.exists(program) then
    shell.run(program)
end
