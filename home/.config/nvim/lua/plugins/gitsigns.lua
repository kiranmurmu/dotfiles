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
            { "<leader>gs", mode = { "n" }, gitsigns.stage_hunk, desc = "Gitsigns: stage hunk" },
            { "<leader>gs", mode = { "v" }, methods.stage_hunk, desc = "Gitsigns: stage hunk" },
            { "<leader>gr", mode = { "n" }, gitsigns.reset_hunk, desc = "Gitsigns: reset hunk" },
            { "<leader>gr", mode = { "v" }, methods.reset_hunk, desc = "Gitsigns: reset hunk" },
            { "<leader>gS", mode = { "n" }, gitsigns.stage_buffer, desc = "Gitsigns: stage buffer" },
            { "<leader>gR", mode = { "n" }, gitsigns.reset_buffer, desc = "Gitsigns: reset buffer" },
            { "<leader>gp", mode = { "n" }, gitsigns.preview_hunk, desc = "Gitsigns: preview hunk" },
            { "<leader>gi", mode = { "n" }, gitsigns.preview_hunk_inline, desc = "Gitsigns: preview hunk inline" },
            { "<leader>gd", mode = { "n" }, gitsigns.diffthis, desc = "Gitsigns: diff this" },
            { "<leader>gD", mode = { "n" }, methods.diffthis, desc = "Gitsigns: diff this" },
            { "<leader>gq", mode = { "n" }, gitsigns.setqflist, desc = "Gitsigns: set qf list" },
            { "<leader>gQ", mode = { "n" }, methods.setqflist, desc = "Gitsigns: set qf list" },
            { "<leader>gw", mode = { "n" }, gitsigns.toggle_word_diff, desc = "Gitsigns: toggle word diff" },
            { "<leader>gt", mode = { "n" }, gitsigns.toggle_current_line_blame, desc = "Gitsigns: toggle current line blame" },
            { "<leader>gb", mode = { "n" }, methods.blame_line, desc = "Gitsigns: blame line" },
        }
    end
}
