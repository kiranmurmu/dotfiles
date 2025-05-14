-- Remove default <Space> keymap
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>", { silent = true, remap = false })
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set({ "n" }, "<Esc>", "<cmd>nohlsearch<CR>")
-- Use <Ctrl-L> as <End> key in insert mode
vim.keymap.set({ "i" }, "<C-l>", "<End>")
-- Use <Esc> key to exit terminal mode
vim.keymap.set({ "t" }, "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
