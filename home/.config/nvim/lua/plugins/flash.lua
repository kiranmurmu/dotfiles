-- lua/plugins/flash.lua
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
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
            { "<leader>s", mode = { "n", "x" }, flash.jump, desc = "Flash: standalone jumping mode similar to search" },
        }
    end
}
