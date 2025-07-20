-- lua/plugins/neogit.lua
return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        highlight = {
            italic = true,
            bold = true,
            underline = true
        },
        signs = {
            hunk = { "", "" },
            item = { "󰁕", "󰁆" },
            section = { "󰁕", "󰁆" },
        },
        integrations = {
            telescope = true,
            diffview = true,
        },
        kind = "tab",
    },
    keys = function()
        local neogit = require("neogit")
        return {
            { "<leader>gg", mode = { "n" }, neogit.open, desc = "Open Neogit window" },
        }
    end,
}
