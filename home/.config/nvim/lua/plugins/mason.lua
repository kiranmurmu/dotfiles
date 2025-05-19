-- lua/plugins/mason.lua
return {
    { "mason-org/mason.nvim", opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls" },
            automatic_enable = true or {
                exclude = { "lua_ls" },
            },
        },
    },
}
