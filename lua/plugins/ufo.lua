return {
  'kevinhwang91/nvim-ufo',
  enabled = false,
  dependencies = { 'kevinhwang91/promise-async' },
  init = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  opts = {
    provider_selector = function()
      return ''
    end
  },
  config = function(_, opts)
    local ufo = require('ufo')
    ufo.setup(opts)
    vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'UFO: Open all folds' })
    vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'UFO: Close all folds' })
  end
}
