--- @type LazySpec
return {
  'rbong/vim-flog',
  cmd = 'Flog',
  keys = {
    { '<leader>gb', '<cmd>Flog<CR>', desc = 'Flog: Git branches' },
  },
}
