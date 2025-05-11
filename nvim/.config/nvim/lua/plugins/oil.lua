-- lua/plugins/oil.lua
return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
        view_options = { show_hidden = true },
        float = {
            -- padding = 3,
            max_width = 0.8,
            max_height = 0.8,
        },
        keymaps = {
            ["<Esc>"] = { "actions.close", mode = "n" },
        },
    },
    keys = function()
        local oil = require("oil")
        return {
            { "<leader>fe", mode = { "n" }, oil.open_float, desc = "Open Oil Explorer" },
        }
    end
}
