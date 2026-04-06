local mif = {}

local np = nil

local function check(number, name2)

    if np == nil then
        return false
    end

if fs.exists("variables") == false and number >= 1 then
        fs.makeDir("variables")
    end

    if fs.exists("variables/"..np) == false and number >= 2 then
        fs.makeDir("variables/"..np)
    end

    if fs.exists("variables/"..np.."/"..name2) == false and number >= 3 then
        io.open("variables/"..np.."/"..name2, "w"):close()
    end

    return true
end

function mif.program(name)
    np = tostring(name)
    check(2)
    return true
end

function mif.get(name)
    local name1 = name
    local answer = check(3, name1) if answer == false then return false end

    local file = io.open(name, "r")
    local text = file:read("*a")
    file:close()

    return text
end

function mif.set(name, set)
    local name1 = name
    local answer = check(3, name1) if answer == false then return false end

    local file = io.open(name, "w")
    file:write(set)
    file:flush() file:close()

    return true
end

function mif.delete(name)
    local answer = check(2) if answer == false then return false end

    if fs.exists("variables/"..np.."/"..name) then
    fs.delete("variables/"..np.."/"..name)
    else
        return false
    end

    return true
end

function mif.deleteProgram()
    local answer = check(1) if answer == false then return false end

    if fs.exists("variables/"..np) then
    fs.delete("variables/"..np)
    np = nil
    else
        return false
    end

    return true
end

return mif
