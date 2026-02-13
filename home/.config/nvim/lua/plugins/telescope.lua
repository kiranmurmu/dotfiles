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
        local actions_state = require("telescope.actions.state")
        local actions_layout = require("telescope.actions.layout")
        local actions_set = require("telescope.actions.set")
        local user_actions = {}
        do
            ---@class find_files
            user_actions.find_files = {}
            do
                ---@class find_files
                local find_files = user_actions.find_files
                find_files.select = actions_set.select
                find_files.get_current_picker = actions_state.get_current_picker

                ---@param prompt_bufnr number
                function find_files.select_multiple(prompt_bufnr)
                    ---@class find_files
                    local self = find_files

                    ---@class picker
                    ---@field get_multi_selection fun(): table<number, [string]>
                    local picker = self.get_current_picker(prompt_bufnr)
                    local picker_selected = picker:get_multi_selection()

                    ---@param picker_entry [string]
                    ---@param command "edit"|"badd"
                    function self.edit(picker_entry, command)
                        command = command or "badd"
                        local string_cmd = table.concat({ command, picker_entry[1]}, " ")
                        local parsed_cmd = vim.api.nvim_parse_cmd(string_cmd, {})
                        ---@diagnostic disable-next-line param-type-mismatch
                        vim.api.nvim_cmd(parsed_cmd, { output = false })
                    end

                    self.select(prompt_bufnr, "default")
                    for _, picker_entry in ipairs(picker_selected) do
                        self.edit(picker_entry, "badd")
                    end
                end
            end
        end

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
                        ["<C-k>"] = actions_layout.toggle_preview,
                        ["<C-l>"] = false,
                        ["<C-h>"] = false,
                    },
                },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<M-d>"] = actions.delete_buffer,
                        },
                        n = {
                            ["<M-d>"] = actions.nop,
                        },
                    },
                },
                find_files = {
                    mappings = {
                        i = {
                            ["<CR>"] = user_actions.find_files.select_multiple,
                        },
                    },
                },
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true,
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
            { "<leader>fg", mode = { "n" }, builtin.live_grep, desc = "Telescope file grep" },
            { "<leader>dd", mode = { "n" }, builtin.diagnostics, desc = "Telescope diagnostics" },
            { "<leader>fb", mode = { "n" }, builtin.buffers, desc = "Telescope find buffers" },
            { "<leader>fd", mode = { "n" }, builtin.builtin, desc = "Telescope find pickers" },
            { "<leader>fs", mode = { "n" }, builtin.current_buffer_fuzzy_find, desc = "Telescope file search" },
            { "<leader>fe", mode = { "n" }, file_browser.file_browser, desc = "Telescope file explorer" },
            { "<leader>fh", mode = { "n" }, builtin.help_tags, desc = "Telescope find help-tags" },
            { "<leader>fc", mode = { "n" }, builtin.commands, desc = "Telescope find commands" },
            { "<leader>fk", mode = { "n" }, builtin.keymaps, desc = "Telescope find keymaps" },
            { "<leader>fr", mode = { "n" }, builtin.registers, desc = "Telescope find registers" },
            { "<leader>fj", mode = { "n" }, builtin.jumplist, desc = "Telescope find jumplist" },
            { "<leader>fm", mode = { "n" }, builtin.marks, desc = "Telescope find marks" },
            { "<leader>ss", mode = { "n" }, builtin.spell_suggest, desc = "Telescope spell suggest" },
            { "<leader>sm", mode = { "n" }, builtin.man_pages, desc = "Telescope search man pages" },
            { "<leader>fl", mode = { "n" }, builtin.quickfix, desc = "Telescope quickfix list" },
            { "<leader>ll", mode = { "n" }, builtin.loclist, desc = "Telescope location list" },
            { "<leader>gg", mode = { "n" }, builtin.git_status, desc = "Telescope git status" },
            { "<leader>gf", mode = { "n" }, builtin.git_files, desc = "Telescope git files" },
        }
    end
}
