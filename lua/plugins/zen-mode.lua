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
    {
      '<leader>zt',
      function()
        require('zen-mode').toggle({
          window = {
            width = 100, -- width will be 50% of the editor width
          },
        })
      end,
      desc = 'Zen: Toggle zen mode',
    },
  },
}
