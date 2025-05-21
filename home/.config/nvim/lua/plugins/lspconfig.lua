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
        -- Hover config
        local hover = vim.lsp.buf.hover
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.lsp.buf.hover = function()
            return hover({
                border = "single",
                max_width = math.floor(vim.o.columns * 0.7),
                max_height = math.floor(vim.o.lines * 0.7),
            })
        end
    end
}
