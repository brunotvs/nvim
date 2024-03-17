--- @type LazySpec
return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      options = {
        foldcolumn = '0',
      },
    },
  },
  keys = {
    { '<leader>zz', '<cmd>ZenMode<CR>', desc = 'Zen: Toggle zen mode' },
  },
}
