return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = function()
        local web =  require("nvim-web-devicons")

        local function _buf_get_icon()
            local name = vim.api.nvim_buf_get_name(0)
            local icon = web.get_icon(name, nil, { default = false })
            return icon or ""
        end

        local default_sections = {
            lualine_a = { "mode" },
            lualine_b = {
                { "branch", icon = "" },
            },
            lualine_c = {
                { _buf_get_icon, padding = { left = 1 }, separator = "" },
                { "filename", path = 1, separator = "󰊢" },
                { "diff" },
            },
            lualine_x = { "diagnostics", "filesize", "encoding", "fileformat" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        }

        return {
            options = {
                icons_enabled = true,
                theme = "auto",
                section_separators = {},
                component_separators = { left = "", right = "" },
                globalstatus = false,
            },
            sections = default_sections,
            inactive_sections = default_sections,
        }
    end,
}
