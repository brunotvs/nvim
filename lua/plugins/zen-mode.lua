--- @type LazySpec
return {
  'folke/zen-mode.nvim',
  ---@type ZenOptions
  opts = {
    window = {
      options = {
        signcolumn = 'no', -- disable signcolumn
        -- number = false, -- disable number column
        -- relativenumber = false, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
        foldcolumn = '0', -- disable fold column
        list = false, -- disable whitespace characters
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
            options = {
              number = false,
              relativenumber = false,
            },
          },
        }
        require('zen-mode').toggle(opts)
      end,
      desc = 'Zen: Toggle zen mode',
    },
  },
}
