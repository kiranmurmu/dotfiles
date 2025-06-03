-- Change Neovim's default config
-- make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- set how indentation behave
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true
-- use spaces instead of tabs
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- enable mouse mode, useful for mouse scroll
vim.opt.mouse = "a"
vim.opt.title = true
-- disable word wrap
vim.opt.wrap = false
-- sync clipboard between OS and Neovim
-- vim.schedule(function ()
vim.opt.clipboard = "unnamedplus"
-- end)
-- set file default encoding
vim.opt.encoding = "utf-8"
-- show which line your cursor is on
vim.opt.cursorline = false
-- save undo history
vim.opt.undofile = false
-- don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- keep signcolumn on by default (e.g. error, warning signs)
vim.opt.signcolumn = "yes"
-- decrease update time
vim.opt.updatetime = 250
-- decrease mapped sequence wait time (keymap wait time)
-- vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
-- configure how new splits should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true
-- case-insensitive searching UNLESS \C or one or more capital letters
vim.opt.ignorecase = false
vim.opt.smartcase = false
-- sets how neovim will display certain whitespace chars
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- preview substitutions live, as you type!
-- vim.opt.inccommand = "split"
-- minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 0
-- show dialog for unsaved changes
vim.opt.confirm = true
-- show rounded window (global)
-- vim.o.winborder = "rounded"
