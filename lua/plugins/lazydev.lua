---@module "lazydev"

--- @type LazySpec
return {
  'folke/lazydev.nvim',
  ft = 'lua',
  ---@type lazydev.Config
  opts = {
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      'lazy.nvim',
    },
    enabled = function(root_dir)
      return not vim.uv.fs_stat(root_dir .. '/.luarc.json')
    end,
  },
}
