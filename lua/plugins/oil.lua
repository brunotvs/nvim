---@module 'oil'
--- @type LazySpec
return {
  'stevearc/oil.nvim',
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '-', ':Oil<CR>', desc = 'Oil parent directory' },
  },
}
