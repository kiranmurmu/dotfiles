-- lua/plugins/markdown.lua
return {
    "MeanderingProgrammer/render-markdown.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {
        completions = {
            lsp = { enabled = true },
            blink = { enabled = true },
        },
        code = { border = "none" },
    },
}
