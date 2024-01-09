return {
  'stevearc/aerial.nvim',
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim"
  },
  opts = {
    filter_kind = false,
  },
  init = function()
    local telescope = require('telescope')
    telescope.load_extension('aerial')
  end,
  keys = {
    { '<M-o>', '<cmd>AerialToggle!<CR>', "Aerial: Toggle outline" }
  },
}
