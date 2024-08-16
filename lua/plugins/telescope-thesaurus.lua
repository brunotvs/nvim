--- @type LazySpec
return {
  'rafi/telescope-thesaurus.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  event = 'VeryLazy',
  init = function()
    local telescope = require('telescope')
    telescope.load_extension('thesaurus')
  end,
  keys = { { '<M-s>', '<cmd>Telescope thesaurus lookup<CR>', desc = 'Mason: Open' } },
}
