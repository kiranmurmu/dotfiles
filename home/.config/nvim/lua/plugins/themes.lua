-- lua/plugins/themes.lua

local function colorscheme(name, config)
    for _, theme in ipairs(config.themes) do
        if theme.name == name then
            for key, value in pairs(config.opts) do
                theme[key] = value
            end
            return theme
        end
    end
    return config.themes
end

return colorscheme("catppuccin", {
    opts = {
        lazy = false,
        priority = 1000,
        config = function(self)
            vim.cmd.colorscheme(self.name)
        end
    },
    themes = {
        { "rebelot/kanagawa.nvim", name = "kanagawa", opts = {} },
        { "folke/tokyonight.nvim", name = "tokyonight", opts = {} },
        { "catppuccin/nvim", name = "catppuccin", opts = {} },
    },
})
