local mif = {}

-- MIF - Memory In Files
-- This libary for ComputerCraft

local np = nil

local function check(number, name)
    if np == nil then return false end

    if number >= 1 and not fs.exists("variables") then
        local answer = fs.makeDir("variables")
        if answer == false then return false end
    end

    if number >= 2 and not fs.exists("variables/"..np) then
        local answer = fs.makeDir("variables/"..np)
        if answer == false then return false end
    end

    if number >= 3 and not fs.exists("variables/"..np.."/"..name) then
        local file = io.open("variables/"..np.."/"..name, "w")
        if file then
            file:close()
        else
            return false
        end
    end

    return true
end

function mif.program(name)
    if name == nil or name == "" then return false end
    np = tostring(name)
    return check(2)
end

function mif.get(name)
    if not check(3, name) then return false end

    local filePath = "variables/"..np.."/"..name
    local file = io.open(filePath, "r")
    if not file then return false end

    local text = file:read("*a")
    
    file:close()
    return text
end

function mif.set(name, value)
    if not check(3, name) then return false end

    local filePath = "variables/"..np.."/"..name
    local file = io.open(filePath, "w")
    if not file then return false end

    file:write(value)
    file:flush()
    
    file:close()
    return true
end

function mif.delete(name)
    if not check(2, name) then return false end
    
    local filePath = "variables/"..np.."/"..name
    if fs.exists(filePath) then
        fs.delete(filePath)
        return true
    else
        return false
    end
end

function mif.deleteProgram()
    if not check(1, name) then return false end

    local dirPath = "variables/"..np
    if fs.exists(dirPath) then
        fs.delete(dirPath)
        np = nil
        return true
    else
        return false
    end
end

return mif
