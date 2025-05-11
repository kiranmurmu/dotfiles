-- lua/plugins/lspconfig.lua
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {
                ensure_installed = { "lua_ls" },
                handlers = {
                    function(server)
                        local blink_cmp = require("blink.cmp")
                        local lspconfig = require("lspconfig")
                        local capabilities = blink_cmp.get_lsp_capabilities()
                        lspconfig[server].setup({ capabilities = capabilities })
                    end
                },
            },
        },
        { "saghen/blink.cmp", opts = {} },
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
        local blink_cmp = require("blink.cmp")
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
        vim.diagnostic.config({
            virtual_text = true,
            -- virtual_lines = true,
            underline = true,
            severity_sort = true,
            float = {
                border = "rounded",
                source = true,
                max_width = 100,
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚",
                    [vim.diagnostic.severity.WARN] = "󰀪",
                    [vim.diagnostic.severity.INFO] = "󰋽",
                    [vim.diagnostic.severity.HINT] = "󰌶",
                }
            },
        })
    end
}
