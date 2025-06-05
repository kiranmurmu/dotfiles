-- lua/plugins/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua", "python", "rust" },
        sync_install = true,
        auto_install = true,
        highlight = { enable = true },
    },
    config = function(self)
        require("nvim-treesitter.configs").setup(self.opts);
    end
}
