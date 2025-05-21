-- lua/plugins/blink.lua
local blink_version = "v1.1.1"
return {
    "saghen/blink.cmp",
    version = blink_version,
    dependencies = { "folke/lazydev.nvim" },
    opts_extend = { "sources.default" },
    opts = {
        keymap = {
            preset = "none",
            ["<C-k>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "cancel", "fallback" },
            ["<C-y>"] = { "accept", "fallback" },
            ["<Tab>"] = { "select_and_accept", "fallback" },
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-n>"] = { "select_next", "fallback_to_mappings" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        cmdline = {
            keymap = {
                preset = "none",
                ["<C-y>"] = { "accept" },
                ["<C-e>"] = { "cancel" },
                ["<Tab>"] = { "show", "select_and_accept" },
                ["<CR>"] = { "accept_and_enter", "fallback"  },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<Left>"] = { "select_prev", "fallback" },
                ["<Right>"] = { "select_next", "fallback" },
            },
            completion = {
                menu = { auto_show = false },
                list = {
                    selection = { preselect = false },
                },
            },
        },
        completion = {
            documentation = {
                auto_show = false,
                auto_show_delay_ms = 200,
                window = {
                    border = "none",
                    max_width = math.floor(vim.o.columns * 0.4),
                    max_height = math.floor(vim.o.lines * 0.5),
                },
            },
            list = { selection = { auto_insert = false } },
            accept = { auto_brackets = { enabled = true } },
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
                force_version = blink_version,
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
