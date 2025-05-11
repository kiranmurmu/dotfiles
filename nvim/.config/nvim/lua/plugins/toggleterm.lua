-- lua/plugins/toggleterm.lua
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        open_mapping = [[<C-\>]],
        direction = "float",
        float_opts = {
            border = "curved",
        },
        on_create = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-c>", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_open = function()
            if vim.fn.mode() ~= "i" then
                require("toggleterm.terminal").Terminal:set_mode("i")
            end
        end
    },
    keys = {
        { [[<C-\>]], mode = { "n" }, "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
    }
}
