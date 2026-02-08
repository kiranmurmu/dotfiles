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
        vim.keymap.set({ "n" }, "<leader>]]", "<cmd>BufferNext<CR>", { silent = true, desc = "Barbar: Buffer Next" })
        vim.keymap.set({ "n" }, "<leader>[[", "<cmd>BufferPrevious<CR>", { silent = true, desc = "Barbar: Buffer Previous" })
        vim.keymap.set({ "n" }, "<leader>{{", "<cmd>BufferFirst<CR>", { silent = true, desc = "Barbar: Buffer First" })
        vim.keymap.set({ "n" }, "<leader>}}", "<cmd>BufferLast<CR>", { silent = true, desc = "Barbar: Buffer Last" })
    end,
    opts = {
        auto_hide = false,
        clickable = false,
        animation = false,
        maximum_padding = 0,
        minimum_padding = 0,
        insert_at_end = true,
        tabpages = false,
        icons = {
            buffer_index = false,
            buffer_number = true,
            filename = false,
            button = "",
            gitsigns = { enabled = false },
            separator = {
                left = "▏", right = "",
            },
            scroll = {
                left = "", right = "",
            },
            separator_at_end = true,
            modified = { button = "" },
            filetype = { enabled = false },
            pinned = {
                button = "",
                filename = false,
            },
            inactive = {
                separator = {
                    left = "▏", right = "",
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
