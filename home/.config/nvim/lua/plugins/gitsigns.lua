-- lua/plugins/gitsigns.lua
return {
    "lewis6991/gitsigns.nvim",
    opts = {
        preview_config = {
            style = "minimal",
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
        function methods.diffthis() gitsigns.diffthis("~") end
        function methods.setqflist() gitsigns.setqflist("all") end
        function methods.blame_line() gitsigns.blame_line({ full = true }) end

        return {
            { "]c", mode = { "n" }, methods.nav_next, desc = "Gitsigns: next hunk" },
            { "[c", mode = { "n" }, methods.nav_prev, desc = "Gitsigns: previous hunk" },
            { "ih", mode = { "o", "x" }, gitsigns.select_hunk, desc = "Gitsigns: select hunk" },
            { "<C-h>s", mode = { "n" }, gitsigns.stage_hunk, desc = "Gitsigns: stage hunk" },
            { "<C-h>s", mode = { "v" }, methods.stage_hunk, desc = "Gitsigns: stage hunk" },
            { "<C-h>r", mode = { "n" }, gitsigns.reset_hunk, desc = "Gitsigns: reset hunk" },
            { "<C-h>r", mode = { "v" }, methods.reset_hunk, desc = "Gitsigns: reset hunk" },
            { "<C-h>S", mode = { "n" }, gitsigns.stage_buffer, desc = "Gitsigns: stage buffer" },
            { "<C-h>R", mode = { "n" }, gitsigns.reset_buffer, desc = "Gitsigns: reset buffer" },
            { "<C-h>p", mode = { "n" }, gitsigns.preview_hunk, desc = "Gitsigns: preview hunk" },
            { "<C-h>i", mode = { "n" }, gitsigns.preview_hunk_inline, desc = "Gitsigns: preview hunk inline" },
            { "<C-h>d", mode = { "n" }, gitsigns.diffthis, desc = "Gitsigns: diff this" },
            { "<C-h>D", mode = { "n" }, methods.diffthis, desc = "Gitsigns: diff this" },
            { "<C-h>q", mode = { "n" }, gitsigns.setqflist, desc = "Gitsigns: set qf list" },
            { "<C-h>Q", mode = { "n" }, methods.setqflist, desc = "Gitsigns: set qf list" },
            { "<C-h>w", mode = { "n" }, gitsigns.toggle_word_diff, desc = "Gitsigns: toggle word diff" },
            { "<C-h>t", mode = { "n" }, gitsigns.toggle_current_line_blame, desc = "Gitsigns: toggle current line blame" },
            { "<C-h>b", mode = { "n" }, methods.blame_line, desc = "Gitsigns: blame line" },
        }
    end
}
