local augroup = vim.api.nvim_create_augroup("UserConfigs", { clear = true })

-- Configure terminal to start in insert mode by default
vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter" }, {
    pattern = { "term://*" },
    group = augroup,
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        if mode:match("nt") or not mode:match("t") then -- 'nt' is normal mode and 't' is insert mode in the terminal
            vim.schedule(function() vim.cmd("startinsert") end)
        end
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
