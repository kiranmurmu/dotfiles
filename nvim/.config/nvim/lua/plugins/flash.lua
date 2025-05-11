-- lua/plugins/flash.lua
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = { char = { jump_labels = true } },
        prompt = { enabled = false },
    },
    keys = function()
        local flash = require("flash")
        return {
            { "<leader>sf", mode = { "n", "x", "o" }, flash.jump, desc = "Flash Jump" },
            { "<leader>sa", mode = { "n", "x", "o" }, flash.treesitter, desc = "Flash Treesitter" },
            { "<leader>ss", mode = { "n", "x", "o" }, flash.treesitter_search, desc = "Treesitter Search" },
        }
    end
}
