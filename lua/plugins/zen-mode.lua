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
    {
      '<leader>zz',
      function()
        ---@type ZenOptions
        local opts = {
          window = {
            width = 130, -- width will be 50% of the editor width
          },
        }
        require('zen-mode').toggle(opts)
      end,
      desc = 'Zen: Toggle zen mode',
    },
    {
      '<leader>zt',
      function()
        ---@type ZenOptions
        local opts = {
          window = {
            width = 100, -- width will be 50% of the editor width
          },
        }
        require('zen-mode').toggle(opts)
      end,
      desc = 'Zen: Toggle zen mode',
    },
  },
}
