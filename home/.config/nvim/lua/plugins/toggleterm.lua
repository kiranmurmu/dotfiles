-- lua/plugins/toggleterm.lua
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        open_mapping = false,
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.5
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.5
            end
        end,
        shade_terminals = false,
        direction = "float",
        float_opts = {
            border = "curved",
        },
        on_create = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<M-;>", "<cmd>close<CR>", { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-c>", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
    },
    keys = {
        { "<M-;>", mode = { "n", "v", "i" }, "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
    },
}
