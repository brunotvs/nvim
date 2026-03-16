--- @type LazySpec
return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = vim.fn.has('win32') == 1 and 'nmake' or 'make',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  init = function()
    require('telescope').load_extension('fzf')
  end,
}
