--- @type LazySpec
return {
  'rbong/vim-flog',
  enabled = false,
  dependencies = {
    'tpope/vim-fugitive',
  },
  lazy = true,
  cmd = { 'Flog', 'Flogsplit', 'Floggit' },
  keys = {
    { '<leader>gb', '<cmd>Flog<CR>', desc = 'Flog: Git branches' },
  },
}
