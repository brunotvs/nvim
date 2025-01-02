--- @type LazySpec
return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  init = function()
    require('telescope').load_extension('fzf')
  end,
}
