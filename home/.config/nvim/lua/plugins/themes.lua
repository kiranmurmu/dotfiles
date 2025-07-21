-- lua/plugins/themes.lua

local function colorscheme(name, config)
    for _, theme in ipairs(config.themes) do
        if name:match(theme.name) then
            for key, value in pairs(config.opts) do
                theme[key] = value
            end
            theme["colorscheme"] = name
        end
    end
    return config.themes
end

return colorscheme("kanagawa", {
    opts = {
        lazy = false,
        priority = 1000,
        config = function(self)
            require(self.name).setup(self.opts)
            vim.cmd.colorscheme(self.colorscheme)
        end
    },
    themes = {
        { "folke/tokyonight.nvim", name = "tokyonight", opts = {} },
        { "catppuccin/nvim", name = "catppuccin", opts = {} },
        {
            "rebelot/kanagawa.nvim", name = "kanagawa",
            opts = {
                colors = {
                    theme = { all = { ui = { bg_gutter = "none" } } },
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },
                        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        TabLineFill = { bg = theme.ui.bg_m1 },
                        TabLineSel = { bg = theme.ui.bg },
                        TabLine = { bg = theme.ui.bg_m2 },
                    }
                end,
            },
        },
    },
})
