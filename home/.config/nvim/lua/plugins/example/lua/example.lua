-- lua/plugins/example/lua/example.lua
local M = {}

function M:setup()
    print("loading local plugin!")
end

function M:greet(input, user)
    input = input or {}
    print("Hello, " .. user .. "! you executed '" .. input.name .. "' command")
end

return M
