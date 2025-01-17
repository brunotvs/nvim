---@module 'oil'
--- @type LazySpec
return {
  'stevearc/oil.nvim',
  ---@type oil.SetupOpts
  opts = {
    columns = {
      'icon',
      -- 'permissions',
      -- 'size',
      -- 'mtime',
    },
    view_options = {

      -- Show files and directories that start with "."
      show_hidden = true,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '-', ':Oil<CR>', desc = 'Oil parent directory' },
  },
}
