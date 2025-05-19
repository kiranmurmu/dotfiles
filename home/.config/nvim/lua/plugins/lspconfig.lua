-- lua/plugins/lspconfig.lua
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp", opts = {},
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
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
        -- Diagnostics config
        vim.diagnostic.config({
            -- virtual_text = true,
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
