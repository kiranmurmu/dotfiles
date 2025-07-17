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
            { "gs", mode = { "n", "x" }, flash.jump, desc = "Flash: search jump" },
            { "gl", mode = { "n", "o" }, flash.treesitter, desc = "Flash: location select" },
        }
    end
}
