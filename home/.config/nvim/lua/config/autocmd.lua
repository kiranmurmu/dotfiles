local augroup = vim.api.nvim_create_augroup("UserConfigs", { clear = false })

-- Configure terminal only keymaps
vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = { "term://*" },
    group = augroup,
    callback = function(self)
      vim.api.nvim_buf_set_keymap(self.buf, "n", "<C-\\><C-\\>", "<cmd>startinsert<CR>", { silent = true })
    end,
})

-- Properly close Man pages with 'q' key
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "man" },
  group = augroup,
  callback = function(self)
      vim.api.nvim_buf_set_keymap(self.buf, "n", "q", "<cmd>bdelete<CR>", { silent = true })
  end,
})
