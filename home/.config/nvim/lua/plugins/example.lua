-- lua/plugins/example.lua
return {
    dir = vim.fn.stdpath("config").."/lua/plugins",
    name = "example",
    enabled = true,
    opts = {},
    config = function()
        vim.api.nvim_create_user_command(
            "Path",
            function(input)
                print(input.name..": "..vim.fn.stdpath("config"))
            end,
            { bang = true, desc = "Show neovim config path" }
        )
    end,
}
