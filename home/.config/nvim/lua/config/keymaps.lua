-- Remove default <Space> keymap for normal and visual mode
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>", { silent = true, desc = "Remove default keybind" })
-- Clear search highlights when pressing <Esc> in normal mode
vim.keymap.set({ "n" }, "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlights" })
-- Use <M-\> key to enter terminal (t) mode when mode is normal terminal (nt)
vim.keymap.set(
    { "n" }, "<M-\\>",
    function()
        if vim.api.nvim_get_mode().mode == "nt" then
            vim.cmd("startinsert")
        end
    end,
    { silent = true, desc = "Enter terminal mode" }
)
-- Use <C-\> and <M-\> key to exit terminal mode, use <C-S-\><C-n> key to force exit terminal mode
vim.keymap.set({ "t" }, "<C-\\>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })
vim.keymap.set({ "t" }, "<M-\\>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })
