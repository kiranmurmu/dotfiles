-- lua/plugins/toggleterm.lua
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    -- event = "VeryLazy",
    opts = {
        open_mapping = false,
        shade_terminals = true,
        insert_mappings = false,
        hidden = true,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
        direction = "float",
        float_opts = {
            border = "single",
            title_pos = "center",
        },
    },
    terminals = function(self)
        local width = math.ceil(math.min(vim.o.columns, math.max(80, vim.o.columns * 0.8 - 4)))
        local height = math.ceil(math.min(vim.o.lines, math.max(20, vim.o.lines * 0.8 - 2)))
        local row = math.ceil(vim.o.lines - height) * 0.5 - 1
        local col = math.ceil(vim.o.columns - width) * 0.5 - 1
        local terms = {}

        terms.default = vim.tbl_deep_extend("keep", self.opts, {
            display_name = " Terminal ",
            cmd = "bash",
            dir = "%:p:h",
            float_opts = {
                width = width,
                height = height,
                row = row,
                col = col,
            },
            on_create = function(term)
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-\\><C-\\>", "<cmd>close<CR>", { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-\\><C-\\>", "<cmd>close<CR>", { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-c>", "<cmd>close<CR>", { noremap = true, silent = true })
            end,
            on_open = function(term)
                local dir = vim.fn.expand("#:p:h")
                if term.dir == dir then return end
                term:send({ string.format("cd %s", dir)})
                term.dir = dir
            end,
        })

        return terms
    end,
    keys = function(self)
        local Terminal = require("toggleterm.terminal").Terminal
        local terminal = self:terminals()
        local default = Terminal:new(terminal.default)

        function terminal.toggle_default()
            if vim.api.nvim_get_mode().mode == "nt" then
                vim.cmd("startinsert")
            else
                default:toggle()
            end
        end

        return {
            { "<C-\\><C-\\>", mode = { "n", "v", "i" }, terminal.toggle_default, desc = "Toggle Terminal window" },
        }
    end,
}
