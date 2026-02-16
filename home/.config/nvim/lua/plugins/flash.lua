-- lua/plugins/flash.lua
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
                enabled = false,
                jump_labels = false,
                highlight = { backdrop = false },
                char_actions = function ()
                    return { [";"] = "next", [","] = "prev" }
                end
            },
        },
        prompt = { enabled = false },
        highlight = { backdrop = true },
    },
    keys = function()
        local flash = require("flash")
        return {
            { "r", mode = { "o" }, flash.remote, desc = "Flash: perform motions in remote locations" },
            { "x", mode = { "o" }, flash.treesitter, desc = "Flash: quick operation of a specific treesitter node" },
            { "s", mode = { "x" }, flash.treesitter, desc = "Flash: quick operation of a specific treesitter node" },
            { "S", mode = { "n", "x" }, flash.jump, desc = "Flash: standalone jump mode similar to search" },
            { "<C-s>", mode = { "n", "x", "c" }, flash.toggle, desc = "Flash: exit jump mode" },
        }
    end
}
