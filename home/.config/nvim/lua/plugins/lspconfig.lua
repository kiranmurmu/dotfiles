-- lua/plugins/lspconfig.lua
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = { "lua_ls" },
                automatic_enable = {
                    exclude = { "lua_ls" },
                },
            },
        },
        "saghen/blink.cmp",
    },
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = { vim.env.VIMRUNTIME } },
                    },
                },
            },
        },
    },
    config = function(_, opts)
        -- Setup custom lsp servers
        local blink_cmp = require("blink.cmp")
        for server, config in pairs(opts.servers) do
            config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities)
            -- Nvim 0.11+ lsp config
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end
    end
    -- WARNING: Do not add 'keys' property in this config, otherwise lsp will not load!
}
