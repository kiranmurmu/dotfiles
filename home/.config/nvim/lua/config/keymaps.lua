-- Remove default <Space> keymap for normal and visual mode
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>", { silent = true, desc = "Remove default keybind" })
-- Clear search highlights when pressing <Esc> in normal mode
vim.keymap.set({ "n" }, "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlights" })
-- Use <C-\> key to enter terminal mode. Does nothing in normal mode
vim.keymap.set(
    { "n" }, "<C-\\>",
    function()
        if vim.api.nvim_get_mode().mode == "nt" then
            return vim.cmd("startinsert")
        else
            return "<Nop>"
        end
    end,
    { silent = true, desc = "Toggle terminal mode" }
)
-- Use <C-\> key to exit terminal mode
vim.keymap.set({ "t" }, "<C-\\>", "<C-\\><C-n>", { silent = true, desc = "Toggle terminal mode" })
