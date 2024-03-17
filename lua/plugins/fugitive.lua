--- @type LazySpec
return {
  {
    'tpope/vim-fugitive',
    cmd = 'Git',
    enabled = false,
    event = 'BufEnter',
    keys = {
      { '<leader>lg', '<cmd>Git<CR>', desc = 'Git: status' },
    },
  },
  {
    'tpope/vim-rhubarb',
    enabled = false,
    dependencies = {
      'tpope/vim-fugitive',
    },
  },
}
