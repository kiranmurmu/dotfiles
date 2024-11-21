-- Add this file to '~/.config/nvim' location for NeoVim Linux.

if vim.g.vscode then
  -- Put anything you want to happen only in VSCode here
else
  -- ordinary Neovim
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.autoindent = true
  vim.opt.smarttab = true
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4
  vim.opt.mouse = "a"
  vim.opt.title = tue
  vim.opt.wrap = false
  vim.opt.clipboard = "unnamedplus"
  vim.opt.encoding = "utf-8"
end
