-- lua/plugins/mason_lspconfig.lua
return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = { "lua_ls" },
        automatic_enable = {
            exclude = { "lua_ls" },
        },
    },
}
