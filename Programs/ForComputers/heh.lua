term.clear()

local file = io.open(arg[1], "r")

if file then
  file:close()
else
  print("Error")
  while true do io.open() end
end

for line in io.lines(arg[1]) do
  local text = ""
    for number in string.gmatch(line, "%S+") do
    if number == "0" then
      text = text.." "
    elseif number == "1" then
      text = text.."#"
    end
  end
  print(text)
end
