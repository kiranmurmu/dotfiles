-- Remove default <Space> keymap for normal and visual mode
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>", { silent = true, desc = "Remove default keybind" })
-- Clear search highlights when pressing <Esc> in normal mode
vim.keymap.set({ "n" }, "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlights" })
-- Enter terminal (t) mode when vim mode is normal terminal (nt)
vim.keymap.set(
    { "n" }, "<C-\\><C-\\>",
    function()
        if vim.api.nvim_get_mode().mode == "nt" then
            vim.cmd("startinsert")
        end
    end,
    { silent = true, desc = "Enter terminal mode" }
)
-- Exit terminal mode, use <C-S-\><C-n> key to force exit terminal mode
vim.keymap.set({ "t" }, "<C-\\><C-\\>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })
vim.keymap.set({ "n" }, "<leader>bc", "<cmd>close<CR>", { silent = true, desc = "Close current buffer" })
vim.keymap.set({ "n" }, "<leader>bd", "<cmd>bdelete<CR>", { silent = true, desc = "Delete current buffer" })
