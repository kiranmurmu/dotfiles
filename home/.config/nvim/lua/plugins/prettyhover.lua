-- lua/plugins/prettyhover.lua
return {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = {
        border = "single",
        max_width = math.floor(vim.o.columns * 0.7),
        max_height = math.floor(vim.o.lines * 0.7),
        wrap = true,
        toggle = false,
        multi_server = true,
    },
    props = {
        diagnostic = {
            underline = true,
            severity_sort = true,
            float = {
                border = "single",
                max_width = math.floor(vim.o.columns * 0.7),
                max_height = math.floor(vim.o.lines * 0.7),
                source = true,
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚",
                    [vim.diagnostic.severity.WARN] = "󰀪",
                    [vim.diagnostic.severity.INFO] = "󰋽",
                    [vim.diagnostic.severity.HINT] = "󰌶",
                }
            },
        },
    },
    init = function(self, props)
        props = props or self.props or {}
        vim.diagnostic.config(props.diagnostic or {})
    end,
    keys = function()
        local mod = { pretty_hover = require("pretty_hover") }
        return {
            { "<C-k>", mode = { "n" }, vim.diagnostic.open_float, desc = "Show diagnostics in a floating window" },
            { "<S-k>", mode = { "n" }, mod.pretty_hover.hover, desc = "Displays hover information about the symbol under the cursor" },
        }
    end
}
