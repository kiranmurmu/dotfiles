return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = { theme = "auto" },
        sections = {
            lualine_b = { { "branch", icon = "\u{f419}" }, "diff", "diagnostics" },
            lualine_c = { { "filename", path = 1 } },
            lualine_x = { "encoding", { "fileformat", icons_enabled = true }, "filetype" },
        },
        inactive_sections = {
            lualine_c = { { "filename", path = 1 } },
        },
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}
