-- lua/plugins/toggleterm.lua
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function()
        local width = math.ceil(math.min(vim.o.columns, math.max(80, vim.o.columns * 0.8 - 4)))
        local height = math.ceil(math.min(vim.o.lines, math.max(20, vim.o.lines * 0.8 - 2)))
        local row = math.ceil(vim.o.lines - height) * 0.5 - 1
        local col = math.ceil(vim.o.columns - width) * 0.5 - 1

        return {
            open_mapping = false,
            shade_terminals = true,
            insert_mappings = false,
            hidden = true,
            highlights = {
                Normal = { link = "Normal" },
                NormalFloat = { link = "TelescopeNormal" },
                FloatBorder = { link = "TelescopeBorder" },
            },
            direction = "float",
            float_opts = {
                border = "single",
                title_pos = "center",
                width = width,
                height = height,
                row = row,
                col = col,
            },
            display_name = " Terminal ",
            dir = "%:p:h",
        }
    end,
    init = function ()
        local augroup = vim.api.nvim_create_augroup("UserConfigs", { clear = false })

        -- Configure terminal to start in insert mode by default
        vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter" }, {
            pattern = { "term://*toggleterm#*" },
            group = augroup,
            callback = function()
                local mode = vim.api.nvim_get_mode().mode
                -- 'nt' is normal mode and 't' is insert mode in the terminal
                if mode:match("nt") or not mode:match("t") then
                    vim.schedule(function() vim.cmd("startinsert") end)
                end
            end,
        })
    end,
    terminal = {
        new = function(self, config)
            config = config or {}

            self.opts = self.opts or {
                bash = vim.tbl_deep_extend("keep", config, {
                    cmd = "bash",
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
                }),
                default = config,
            }

            return self.opts
        end,
    },
    keys = function(self)
        local Terminal = require("toggleterm.terminal").Terminal
        local opts = self.opts() or {}
        local term = self.terminal:new(opts)

        term.api = {}
        do
            local bash = Terminal:new(term.bash)

            function term.api.toggle_bash()
                bash:toggle()
            end
        end

        return {
            { "<C-\\><C-\\>", mode = { "n", "v", "i" }, term.api.toggle_bash, desc = "Toggle terminal window" },
        }
    end,
}
