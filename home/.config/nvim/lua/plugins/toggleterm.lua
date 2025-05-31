-- lua/plugins/toggleterm.lua
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
        open_mapping = false,
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.5
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.5
            end
        end,
        shade_terminals = true,
        insert_mappings = false,
        hidden = true,
        highlights = {},
        display_name = " Terminal ",
        direction = "float",
        float_opts = {
            border = "curved",
            title_pos = "center",
        },
        on_create = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<M-;>", "<cmd>close<CR>", { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-c>", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
    },
    config = function(self)
        ---@diagnostic disable-next-line: missing-fields
        require("toggleterm.config").set(self.opts.highlights)
    end,
    keys = function(self)
        local terminals = {}
        local toggleterm = require("toggleterm.terminal").Terminal:new(self.opts)
        -- Toggle terminal window
        function terminals.toggleterm()
            toggleterm:toggle()
        end
        -- Return keymaps
        return {
            { "<M-;>", mode = { "n", "v", "i" }, terminals.toggleterm, desc = "Toggle Terminal window" },
        }
    end,
}
