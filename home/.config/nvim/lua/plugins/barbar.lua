-- lua/plugins/barbar.lua
return {
    "romgrk/barbar.nvim",
    version = "^1.0.0",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        auto_hide = false,
        clickable = false,
        animation = false,
        maximum_padding = 0,
        minimum_padding = 0,
        no_name_title = "[No Name]",
        insert_at_end = true,
        tabpages = false,
        icons = {
            buffer_index = false,
            buffer_number = false,
            button = "",
            gitsigns = { enabled = false },
            separator = {
                left = "▏", right = "▕",
            },
            scroll = {
                left = "", right = "",
            },
            separator_at_end = false,
            modified = { button = "" },
            pinned = {
                button = "",
                filename = true,
            },
            inactive = {
                separator = {
                    left = "▏", right = "▕",
                },
            },
            visible = {
                modified = {
                    buffer_number = false,
                },
            },
        },
    },
}
