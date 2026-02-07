-- lua/plugins/gitsigns.lua
return {
    "lewis6991/gitsigns.nvim",
    opts = {
        word_diff = false,
        preview_config = {
            style = "minimal",
            border = "single",
            relative = "cursor",
            row = 1,
            col = 0
        },
    },
    keys = function()
        local methods = {}
        local gitsigns = require("gitsigns")

        function methods.nav_next()
            if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
            else
                gitsigns.nav_hunk("next")
            end
        end

        function methods.nav_prev()
            if vim.wo.diff then
                vim.cmd.normal({ "[c", bang = true })
            else
                gitsigns.nav_hunk("prev")
            end
        end

        function methods.stage_hunk() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end
        function methods.reset_hunk() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end

        return {
            { "]c", mode = { "n" }, methods.nav_next, desc = "Gitsigns: next hunk" },
            { "[c", mode = { "n" }, methods.nav_prev, desc = "Gitsigns: previous hunk" },
            { "ih", mode = { "o", "x" }, gitsigns.select_hunk, desc = "Gitsigns: select hunk" },
            { "<C-h>s", mode = { "n" }, gitsigns.stage_hunk, desc = "Gitsigns: stage hunk" },
            { "<C-h>r", mode = { "n" }, gitsigns.reset_hunk, desc = "Gitsigns: reset hunk" },
            { "<C-h>s", mode = { "v" }, methods.stage_hunk, desc = "Gitsigns: stage hunk" },
            { "<C-h>r", mode = { "v" }, methods.reset_hunk, desc = "Gitsigns: reset hunk" },
            { "<C-h>o", mode = { "n" }, gitsigns.preview_hunk, desc = "Gitsigns: preview hunk open" },
            { "<C-h>i", mode = { "n" }, gitsigns.preview_hunk_inline, desc = "Gitsigns: preview hunk inline" },
            { "<C-h>bs", mode = { "n" }, gitsigns.stage_buffer, desc = "Gitsigns: buffer stage" },
            { "<C-h>br", mode = { "n" }, gitsigns.reset_buffer, desc = "Gitsigns: buffer reset" },
        }
    end
}
