-- lua/plugins/barbar.lua
return {
    "romgrk/barbar.nvim",
    version = "^1.0.0",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.barbar_auto_setup = false
        vim.api.nvim_create_user_command(
            "BufferCreate",
            function()
                vim.api.nvim_create_buf(true, false)
            end,
            { desc = "Creates a new, empty, unnamed buffer" }
        )
    end,
    opts = {
        auto_hide = false,
        clickable = true,
        animation = false,
        maximum_padding = 0,
        minimum_padding = 0,
        maximum_length = 15,
        minimum_length = 0,
        insert_at_end = true,
        insert_at_start = false,
        focus_on_close = "previous",
        tabpages = true,
        no_name_title = "[No Name]",
        icons = {
            buffer_index = false,
            buffer_number = false,
            filename = true,
            button = " 󰅙",
            gitsigns = { enabled = false },
            separator = {
                left = "▏", right = "",
            },
            scroll = {
                left = "▏❮ ", right = " ❯▕",
            },
            separator_at_end = true,
            filetype = { custom_colors = true },
            modified = { button = " 󰅙" },
            pinned = {
                button = " 󰅙",
                filename = true,
                separator = {
                    left = "▏ ", right = "",
                },
            },
            current = {
                filetype = { custom_colors = false },
            },
            visible = {
                filetype = { custom_colors = false },
            },
            inactive = {
                filetype = { custom_colors = false },
                separator = {
                    left = "▏", right = "",
                },
            },
        },
    },
    config = function(self, opts)
        opts = opts or {}
        local _ = require("barbar").setup(opts)
        local hl = require("barbar.utils.highlight")

        for _, key_map in ipairs(self.key_maps) do
            vim.keymap.set(key_map.mode, key_map[1], key_map[2], { silent = true, desc = key_map.desc })
        end

        local hg_current = { "BufferDefaultCurrent" }
        local hg_inactive = { "BufferDefaultInactive" }
        local hg_visible = { "BufferDefaultVisible" }
        local hg_inactive_sign = { "BufferDefaultInactiveSign" }
        local hg_inactive_icon = { "BufferDefaultInactiveIcon" }

        local bg_current = hl.bg_or_default(hg_current, "none")
        local bg_inactive = hl.bg_or_default(hg_inactive, "none")
        local bg_visible = hl.bg_or_default(hg_visible, "none")
        local fg_current = hl.fg_or_default(hg_current, "#efefef", 255)
        local fg_visible = hl.fg_or_default(hg_inactive, "#efefef", 255)
        local fg_inactive_sign = hl.fg_or_default(hg_inactive_sign, "#efefef", 255)
        local fg_inactive_icon = hl.fg_or_default(hg_inactive_icon, "#efefef", 255)

        local hl_current = { fg = fg_visible.gui, bg = bg_current.gui }
        local hl_current_mod = { fg = fg_visible.gui, bg = bg_current.gui }
        local hl_current_btn = { fg = fg_visible.gui, bg = bg_current.gui }
        local hl_current_mod_btn = { fg = fg_current.gui, bg = bg_current.gui }
        local hl_current_sign = { fg = fg_visible.gui, bg = bg_current.gui }
        local hl_visible = { fg = fg_visible.gui, bg = bg_visible.gui }
        local hl_visible_mod = { fg = fg_visible.gui, bg = bg_visible.gui }
        local hl_visible_mod_btn = { fg = fg_current.gui, bg = bg_visible.gui }
        local hl_visible_sign = { fg = fg_visible.gui, bg = bg_visible.gui }
        local hl_inactive = { fg = fg_inactive_sign.gui, bg = bg_inactive.gui }
        local hl_inactive_icon = { fg = fg_inactive_icon.gui, bg = bg_inactive.gui }
        local hl_inactive_mod = { fg = fg_inactive_sign.gui, bg = bg_inactive.gui }
        local hl_inactive_mod_btn = { fg = fg_visible.gui, bg = bg_inactive.gui }
        local hl_inactive_pin = { fg = fg_inactive_sign.gui, bg = bg_inactive.gui }

        vim.api.nvim_set_hl(0, "BufferCurrent", hl_current)
        vim.api.nvim_set_hl(0, "BufferCurrentSign", hl_current_sign)
        vim.api.nvim_set_hl(0, "BufferCurrentMod", hl_current_mod)
        vim.api.nvim_set_hl(0, "BufferCurrentBtn", hl_current_btn)
        vim.api.nvim_set_hl(0, "BufferCurrentModBtn", hl_current_mod_btn)
        vim.api.nvim_set_hl(0, "BufferVisible", hl_visible)
        vim.api.nvim_set_hl(0, "BufferVisibleMod", hl_visible_mod)
        vim.api.nvim_set_hl(0, "BufferVisibleModBtn", hl_visible_mod_btn)
        vim.api.nvim_set_hl(0, "BufferVisibleSign", hl_visible_sign)
        vim.api.nvim_set_hl(0, "BufferInactive", hl_inactive)
        vim.api.nvim_set_hl(0, "BufferInactiveMod", hl_inactive_mod)
        vim.api.nvim_set_hl(0, "BufferInactiveModBtn", hl_inactive_mod_btn)
        vim.api.nvim_set_hl(0, "BufferInactiveIcon", hl_inactive_icon)
        vim.api.nvim_set_hl(0, "BufferInactivePin", hl_inactive_pin)
    end,
    key_maps = {
        { "[b", mode = { "n" }, "<cmd>BufferPrevious<CR>", desc = "Barbar: buffer first" },
        { "]b", mode = { "n" }, "<cmd>BufferNext<CR>", desc = "Barbar: buffer last" },
        { "<M-[>", mode = { "n" }, "<cmd>BufferMovePrevious<CR>", desc = "Barbar: buffer move previous" },
        { "<M-]>", mode = { "n" }, "<cmd>BufferMoveNext<CR>", desc = "Barbar: buffer move next" },
        { "<M-{>", mode = { "n" }, "<cmd>BufferScrollLeft<CR>", desc = "Barbar: buffer scroll left" },
        { "<M-}>", mode = { "n" }, "<cmd>BufferScrollRight<CR>", desc = "Barbar: buffer scroll right" },
        { "<leader>bn", mode = { "n" }, "<cmd>BufferCreate<CR>", desc = "Barbar: buffer create" },
        { "<leader>bp", mode = { "n" }, "<cmd>BufferPin<CR>", desc = "Barbar: buffer pin or unpin" },
        { "<leader>bd", mode = { "n" }, "<cmd>BufferDelete<CR>", desc = "Barbar: buffer delete" },
        { "<leader>bc", mode = { "n" }, "<cmd>BufferClose<CR>", desc = "Barbar: buffer close" },
        { "<leader>bu", mode = { "n" }, "<cmd>BufferRestore<CR>", desc = "Barbar: buffer restore" },
        { "<leader>bw", mode = { "n" }, "<cmd>BufferWipeout<CR>", desc = "Barbar: buffer wipeout" },
        { "<leader>b1", mode = { "n" }, "<cmd>BufferFirst<CR>", desc = "Barbar: buffer first" },
        { "<leader>b2", mode = { "n" }, "<cmd>BufferGoto 2<CR>", desc = "Barbar: goto buffer 2" },
        { "<leader>b3", mode = { "n" }, "<cmd>BufferGoto 3<CR>", desc = "Barbar: goto buffer 3" },
        { "<leader>b4", mode = { "n" }, "<cmd>BufferGoto 4<CR>", desc = "Barbar: goto buffer 4" },
        { "<leader>b5", mode = { "n" }, "<cmd>BufferGoto 5<CR>", desc = "Barbar: goto buffer 5" },
        { "<leader>b6", mode = { "n" }, "<cmd>BufferGoto 6<CR>", desc = "Barbar: goto buffer 6" },
        { "<leader>b7", mode = { "n" }, "<cmd>BufferGoto 7<CR>", desc = "Barbar: goto buffer 7" },
        { "<leader>b8", mode = { "n" }, "<cmd>BufferGoto 8<CR>", desc = "Barbar: goto buffer 8" },
        { "<leader>b9", mode = { "n" }, "<cmd>BufferGoto 9<CR>", desc = "Barbar: goto buffer 9" },
        { "<leader>b0", mode = { "n" }, "<cmd>BufferLast<CR>", desc = "Barbar: buffer last" },
        { "<leader>bs", mode = { "n" }, "<cmd>BufferPick<CR>", desc = "Barbar: buffer index select" },
        { "<leader>bx", mode = { "n" }, "<cmd>BufferPickDelete<CR>", desc = "Barbar: buffer index delete" },
        { "<leader>brc", mode = { "n" }, "<cmd>BufferCloseAllButCurrent<CR>", desc = "Barbar: buffer remove all but current" },
        { "<leader>brp", mode = { "n" }, "<cmd>BufferCloseAllButPinned<CR>", desc = "Barbar: buffer remove all but pinned" },
        { "<leader>bro", mode = { "n" }, "<cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Barbar: buffer remove all but current or pinned" },
        { "<leader>brv", mode = { "n" }, "<cmd>BufferCloseAllButVisible<CR>", desc = "Barbar: buffer remove all but visible" },
        { "<leader>bru", mode = { "n" }, "<cmd>BufferCloseBuffersLeft<CR>", desc = "Barbar: buffers remove left" },
        { "<leader>brk", mode = { "n" }, "<cmd>BufferCloseBuffersRight<CR>", desc = "Barbar: buffers remove right" },
        { "<leader>bg", mode = { "n" }, "<cmd>BufferMoveStart<CR>", desc = "Barbar: buffer move to start" },
        { "<leader>bm1", mode = { "n" }, "<cmd>BufferMove 1<CR>", desc = "Barbar: move buffer by 1" },
        { "<leader>bm2", mode = { "n" }, "<cmd>BufferMove 2<CR>", desc = "Barbar: move buffer by 2" },
        { "<leader>bm3", mode = { "n" }, "<cmd>BufferMove 3<CR>", desc = "Barbar: move buffer by 3" },
        { "<leader>bm4", mode = { "n" }, "<cmd>BufferMove 4<CR>", desc = "Barbar: move buffer by 4" },
        { "<leader>bm5", mode = { "n" }, "<cmd>BufferMove 5<CR>", desc = "Barbar: move buffer by 5" },
        { "<leader>bm6", mode = { "n" }, "<cmd>BufferMove 6<CR>", desc = "Barbar: move buffer by 6" },
        { "<leader>bm7", mode = { "n" }, "<cmd>BufferMove 7<CR>", desc = "Barbar: move buffer by 7" },
        { "<leader>bm8", mode = { "n" }, "<cmd>BufferMove 8<CR>", desc = "Barbar: move buffer by 8" },
        { "<leader>bm9", mode = { "n" }, "<cmd>BufferMove 9<CR>", desc = "Barbar: move buffer by 9" },
        { "<leader>bm0", mode = { "n" }, "<cmd>BufferMove 0<CR>", desc = "Barbar: move buffer by 0" },
        { "<leader>bob", mode = { "n" }, "<cmd>BufferOrderByBufferNumber<CR>", desc = "Barbar: buffer order by buffer number" },
        { "<leader>bon", mode = { "n" }, "<cmd>BufferOrderByName<CR>", desc = "Barbar: buffer order by name" },
        { "<leader>bod", mode = { "n" }, "<cmd>BufferOrderByDirectory<CR>", desc = "Barbar: buffer order by directory" },
        { "<leader>bol", mode = { "n" }, "<cmd>BufferOrderByLanguage<CR>", desc = "Barbar: buffer order by language" },
        { "<leader>bow", mode = { "n" }, "<cmd>BufferOrderByWindowNumber<CR>", desc = "Barbar: buffer order by window number" },
    },
}
