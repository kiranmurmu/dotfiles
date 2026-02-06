-- Remove default <Space> keymap for normal and visual mode
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>", { silent = true, desc = "Remove default keybind" })
-- Clear search highlights when pressing <Esc> in normal mode
vim.keymap.set({ "n" }, "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlights" })
-- Exit terminal mode, use <C-S-\><C-n> key to force exit terminal mode
vim.keymap.set({ "t" }, "<C-\\><C-\\>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })
vim.keymap.set({ "n" }, "<leader>bc", "<cmd>close<CR>", { silent = true, desc = "Close current buffer" })
vim.keymap.set({ "n" }, "<leader>bd", "<cmd>bdelete<CR>", { silent = true, desc = "Delete current buffer" })
-- Custom keymaps for insert mode
vim.keymap.set({ "i" }, "<C-h>", "<Left>", { silent = true, desc = "<CTRL-h> to <Left> in insert mode" })
vim.keymap.set({ "i" }, "<C-l>", "<Right>", { silent = true, desc = "<CTRL-l> to <Right> in insert mode" })
-- Custom keymaps for command-line mode
vim.keymap.set({ "c" }, "<C-a>", "<Home>", { noremap = true, silent = false, desc = "<CTRL-a> to <Home> in command-line mode" })
vim.keymap.set({ "c" }, "<C-f>", "<Right>", { noremap = true, silent = false, desc = "<CTRL-f> to <Right> in command-line mode" })
vim.keymap.set({ "c" }, "<C-b>", "<Left>", { noremap = true, silent = false, desc = "<CTRL-b> to <Left> in command-line mode" })
