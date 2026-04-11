-- This program for ComputerCraft
-- This program auto running programs
-- In library MIF, set program to "startup" and write to file "program" name your program

if fs.exists("mif.lua") == false then
shell.run("wget https://raw.githubusercontent.com/Dimaskin100/Programs-for-computercraft/refs/heads/main/Programs/ForComputers/mif.lua")
end

term.clear()

local mif = require("mif")

mif.program("startup")

local program = mif.get("program")

if fs.exists(program) then
    shell.run(program)
end
