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
            { "gl", mode = { "o" }, flash.remote, desc = "Flash: perform motions in remote locations" },
            { "gs", mode = { "n", "x", "o" }, flash.jump, desc = "Flash: standalone jumping mode similar to search" },
            { "gh", mode = { "n", "x", "o" }, flash.treesitter, desc = "Flash: quick selection of a specific treesitter node" },
        }
    end
}
