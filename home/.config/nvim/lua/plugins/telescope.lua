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
            { "<leader>fg", mode = { "n" }, builtin.live_grep, desc = "Telescope live grep" },
            { "<leader>fb", mode = { "n" }, builtin.buffers, desc = "Telescope buffers" },
            { "<leader>fd", mode = { "n" }, builtin.diagnostics, desc = "Telescope diagnostics" },
            { "<leader>fh", mode = { "n" }, builtin.help_tags, desc = "Telescope help tags" },
            { "<leader>fk", mode = { "n" }, builtin.keymaps, desc = "Telescope find keymaps" },
            { "<leader>fe", mode = { "n" }, file_browser.file_browser, desc = "Telescope file browser" },
        }
    end
}
