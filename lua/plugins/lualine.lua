return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    dependencies = {
        "catppuccin/nvim",
    },
    opts = {
        options = {
            icons_enabled = true,
            theme = 'catppuccin',
            component_separators = '|',
            section_separators = ''
        },
        sections = {
            lualine_b = {
                'branch',
                'diff',
                'diagnostics',
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = { fg = "#ff9e64" },
                }
            },
            lualine_c = {
                { 'filename', path = 1 }
            }
        },
    }
}
