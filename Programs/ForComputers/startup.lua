if fs.exists("mif.lua") == false then
shell.run("wget ")
end

local mif = require("mif")

mif.program("startup")

local program = mif.get("program")

if fs.exists(program) then
    shell.run(program)
end