-- lua/plugins/blink.lua
return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "folke/lazydev.nvim",
        "Fildo7525/pretty_hover",
    },
    opts_extend = { "sources.default" },
    opts = {
        keymap = {
            preset = "none",
            ["<C-k>"] = { "show", "hide", "fallback" },
            ["<C-e>"] = { "cancel", "fallback" },
            ["<C-y>"] = { "accept", "fallback" },
            ["<Tab>"] = { "select_and_accept", "fallback" },
            ["<Up>"] = { "insert_prev", "fallback" },
            ["<Down>"] = { "insert_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-n>"] = { "select_next", "fallback_to_mappings" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<C-s>"] = { "show_documentation", "hide_documentation", "show_signature", "hide_signature", "fallback" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        cmdline = {
            keymap = {
                preset = "none",
                ["<C-k>"] = { "show", "hide", "fallback" },
                ["<C-l>"] = { "select_and_accept", "fallback" },
                ["<C-y>"] = { "accept", "fallback" },
                ["<C-e>"] = { "cancel", "fallback" },
                ["<Tab>"] = { "show_and_insert_or_accept_single", "select_and_accept" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<Up>"] = { "insert_prev", "fallback" },
                ["<Down>"] = { "insert_next", "fallback" },
            },
            completion = {
                menu = { auto_show = false },
                list = {
                    selection = { preselect = false, auto_insert = false },
                },
            },
        },
        completion = {
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 200,
                window = {
                    border = "single",
                    max_width = math.floor(vim.o.columns * 0.4),
                    max_height = math.floor(vim.o.lines * 0.5),
                },
                draw = function(opts)
                    if opts.item and opts.item.documentation and opts.item.documentation.value then
                        local pretty_hover = require("pretty_hover.parser")
                        local out = pretty_hover.parse(opts.item.documentation.value)
                        opts.item.documentation.value = out:string()
                    end
                    opts.default_implementation(opts)
                end,
            },
            list = { selection = { auto_insert = false } },
            accept = { auto_brackets = { enabled = false } },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                    columns = {
                        { "label", gap = 2 }, { "kind_icon", gap = 1, "kind" },
                    },
                },
            },
            trigger = {
                show_on_accept_on_trigger_character = false,
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "lazydev" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                snippets = {
                    name = "Snippets",
                    module = "blink.cmp.sources.snippets",
                    min_keyword_length = 3,
                    opts = {
                        friendly_snippets = false,
                        search_paths = {vim.fn.stdpath("config") .. "/snippets/nvim"},
                    },
                },
            },
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning",
            prebuilt_binaries = {
                download = true,
            },
        },
        signature = {
            enabled = true,
            window = {
                border = "single",
                max_width = math.floor(vim.o.columns * 0.4),
                max_height = math.floor(vim.o.lines * 0.5),
            },
        },
    },
}
