return {
  'brunotvs/nx.nvim',
  dev = false,
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = { nx_cmd_root = 'npx nx' },
  init = function()
    local telescope = require('telescope')
    telescope.load_extension('nx')
  end,
  keys = {
    { '<leader>nxg', '<cmd>Telescope nx generators<CR>', desc = 'Nx: Nx generators' },
    { '<leader>nxx', '<cmd>Telescope nx actions<CR>', desc = 'Nx: Nx actions' },
    { '<leader>nxa', '<cmd>Telescope nx affected<CR>', desc = 'Nx: Nx affected' },
    { '<leader>nxr', '<cmd>Telescope nx run_many<CR>', desc = 'Nx: Nx run many' },
  },
}
