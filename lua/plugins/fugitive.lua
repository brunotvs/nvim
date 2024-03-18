--- @type LazySpec
return {
  {
    'tpope/vim-fugitive',
    cmd = 'Git',
    enabled = true,
    event = 'BufEnter',
    keys = {
      { '<leader>lg', '<cmd>Git<CR>', desc = 'Git: status' },
    },
  },
  {
    'tpope/vim-rhubarb',
    enabled = true,
    dependencies = {
      'tpope/vim-fugitive',
    },
  },
}
