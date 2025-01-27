---@module 'oil'
--- @type LazySpec
return {
  'stevearc/oil.nvim',
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git'
      end,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '-', ':Oil<CR>', desc = 'Oil parent directory' },
  },
}
