BuildStatus = {
  building = {},
  icon = ' ',
}
--- @type LazySpec
return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  dependencies = {
    'catppuccin/nvim',
    name = 'catppuccin',
  },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_b = {
        'branch',
        'diff',
        'diagnostics',
        {
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#ff9e64' },
        },
        {
          function()
            return BuildStatus.icon
          end,
          cond = function()
            local count = 0
            for _ in pairs(BuildStatus.building) do
              count = count + 1
            end
            return count ~= 0
          end,
          color = { fg = '#ff9e64' },
        },
      },
      lualine_c = {
        { 'filename', path = 1 },
      },
    },
  },
}
