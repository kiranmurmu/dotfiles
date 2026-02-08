-- lua/plugins/telescope.lua
return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = function()
        local actions = require("telescope.actions")
        local actions_layout = require("telescope.actions.layout")
        return {
            defaults = {
                preview = { hide_on_startup = true },
                prompt_prefix = "  ",
                selection_caret = "  ",
                entry_prefix = "  ",
                borderchars = {
                    prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                },
                mappings = {
                    i = {
                        ["<C-u>"] = actions.results_scrolling_up,
                        ["<C-d>"] = actions.results_scrolling_down,
                    },
                },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<M-d>"] = actions.delete_buffer,
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
            }
        }
    end,
    config = function(self, opts)
        opts = opts or self.opts or {}
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("file_browser")
    end,
    keys = function()
        local builtin = require("telescope.builtin")
        local file_browser = require("telescope").extensions.file_browser
        return {
            { "<leader>ff", mode = { "n" }, builtin.find_files, desc = "Telescope find files" },
            { "<leader>fg", mode = { "n" }, builtin.live_grep, desc = "Telescope find grep" },
            { "<leader>fd", mode = { "n" }, builtin.diagnostics, desc = "Telescope find diagnostics" },
            { "<leader>fb", mode = { "n" }, builtin.buffers, desc = "Telescope find buffers" },
            { "<leader>ft", mode = { "n" }, builtin.builtin, desc = "Telescope find pickers" },
            { "<leader>fz", mode = { "n" }, builtin.current_buffer_fuzzy_find, desc = "Telescope fuzzy find" },
            { "<leader>fe", mode = { "n" }, file_browser.file_browser, desc = "Telescope file explorer" },
            { "<leader>fh", mode = { "n" }, builtin.help_tags, desc = "Telescope find help-tags" },
            { "<leader>fk", mode = { "n" }, builtin.keymaps, desc = "Telescope find keymaps" },
            { "<leader>fr", mode = { "n" }, builtin.registers, desc = "Telescope find registers" },
            { "<leader>fj", mode = { "n" }, builtin.jumplist, desc = "Telescope find jumplist" },
            { "<leader>fm", mode = { "n" }, builtin.marks, desc = "Telescope find marks" },
            { "<leader>fs", mode = { "n" }, builtin.spell_suggest, desc = "Telescope spell suggest" },
        }
    end
}
