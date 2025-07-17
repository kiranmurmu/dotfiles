-- lua/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
        defaults = {
            preview = { hide_on_startup = true },
            prompt_prefix = "  ",
            selection_caret = "  ",
            entry_prefix = "  ",
            mappings = {
                i = {
                    ["<C-u>"] = require("telescope.actions").results_scrolling_up,
                    ["<C-d>"] = require("telescope.actions").results_scrolling_down,
                },
            },
        },
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        ["<M-d>"] = require("telescope.actions").delete_buffer,
                    },
                },
            },
        },
        extensions = {
            file_browser = {
                hidden = true,
                git_status = false,
                path = "%:p:h",
            },
        },
    },
    config = function(self)
        local telescope = require("telescope")
        telescope.setup(self.opts)
        telescope.load_extension("file_browser")
    end,
    keys = function()
        local builtin = require("telescope.builtin")
        local file_browser = require("telescope").extensions.file_browser
        return {
            { "<leader>ff", mode = { "n" }, builtin.find_files, desc = "Telescope find files" },
            { "<leader>gg", mode = { "n" }, builtin.live_grep, desc = "Telescope live grep" },
            { "<leader>dd", mode = { "n" }, builtin.diagnostics, desc = "Telescope diagnostics" },
            { "<leader>bb", mode = { "n" }, builtin.builtin, desc = "Telescope builtin pickers" },
            { "<leader>ee", mode = { "n" }, file_browser.file_browser, desc = "Telescope file browser" },
            { "<leader>hh", mode = { "n" }, builtin.help_tags, desc = "Telescope help tags" },
            { "<leader>kk", mode = { "n" }, builtin.keymaps, desc = "Telescope find keymaps" },
            { "<leader>rr", mode = { "n" }, builtin.registers, desc = "Telescope find registers" },
            { "<leader>jj", mode = { "n" }, builtin.jumplist, desc = "Telescope find jumplist" },
            { "<leader>mm", mode = { "n" }, builtin.marks, desc = "Telescope find marks" },
            { "<leader>ll", mode = { "n" }, builtin.buffers, desc = "Telescope list buffers" },
            { "<leader>ss", mode = { "n" }, builtin.current_buffer_fuzzy_find, desc = "Telescope fuzzy find" },
        }
    end
}
