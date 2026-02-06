-- lua/plugins/ccc.lua
return {
    "uga-rosa/ccc.nvim",
    opts = {
        alpha_show = "hide",
        win_opts = {
            relative = "cursor",
            row = 1,
            col = 1,
            style = "minimal",
            border = "single",
        },
        highlighter = {
            auto_enable = false,
            lsp = true,
        }
    },
}
