-- lua/plugins/example/init.lua
return {
    "kiranmurmu/example",
    enabled = true,
    opts = {},
    config = function()
        vim.api.nvim_create_user_command(
            "Path",
            function(input)
                print(input.name .. ": " .. vim.fn.stdpath("config"))
            end,
            { bang = true, desc = "Show neovim config path" }
        )
        vim.api.nvim_create_user_command(
            "Hello",
            function(input)
                local user = os.getenv("USER")
                local example = require("example")
                example:greet(input, user)
            end,
            { bang = true, desc = "Great current user!" }
        )
    end,
}
