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
            { "<leader>gs", mode = { "n" }, gitsigns.stage_hunk, desc = "Gitsigns: stage hunk" },
            { "<leader>gr", mode = { "n" }, gitsigns.reset_hunk, desc = "Gitsigns: reset hunk" },
            { "<leader>gs", mode = { "v" }, methods.stage_hunk, desc = "Gitsigns: stage hunk" },
            { "<leader>gr", mode = { "v" }, methods.reset_hunk, desc = "Gitsigns: reset hunk" },
            { "<leader>gk", mode = { "n" }, gitsigns.preview_hunk, desc = "Gitsigns: preview hunk in-hover" },
            { "<leader>gi", mode = { "n" }, gitsigns.preview_hunk_inline, desc = "Gitsigns: preview hunk in-line" },
            { "<leader>gS", mode = { "n" }, gitsigns.stage_buffer, desc = "Gitsigns: buffer stage" },
            { "<leader>gR", mode = { "n" }, gitsigns.reset_buffer, desc = "Gitsigns: buffer reset" },
        }
    end
}
