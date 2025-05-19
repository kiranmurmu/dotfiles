-- lua/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        defaults = { preview = { hide_on_startup = true } },
    },
    keys = function()
        local builtin = require("telescope.builtin")
        return {
            { "<leader>ff", mode = { "n" }, builtin.find_files, desc = "Telescope find files" },
            { "<leader>fg", mode = { "n" }, builtin.live_grep, desc = "Telescope live grep" },
            { "<leader>fb", mode = { "n" }, builtin.buffers, desc = "Telescope buffers" },
            { "<leader>fd", mode = { "n" }, builtin.diagnostics, desc = "Telescope diagnostics" },
            { "<leader>fh", mode = { "n" }, builtin.help_tags, desc = "Telescope help tags" },
        }
    end
}
