return {
  'folke/trouble.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope.nvim',
      -- opts = {
      --   defaults = {
      --     mappings = {
      --       i = {
      --         ['<c-t>'] = function()
      --           require('trouble.providers.telescope').open_with_trouble()
      --         end,
      --       },
      --       n = {
      --         ['<c-t>'] = function()
      --           require('trouble.providers.telescope').open_with_trouble()
      --         end,
      --       },
      --     },
      --   },
      -- },
    },
  },
  keys = {
    {
      '<leader>xx',
      function()
        require('trouble').toggle()
      end,
      desc = 'Trouble: Toggle',
    },
    {
      '<leader>xw',
      function()
        require('trouble').toggle('workspace_diagnostics')
      end,
      desc = 'Trouble: Workspace diagnostics',
    },
    {
      '<leader>xd',
      function()
        require('trouble').toggle('document_diagnostics')
      end,
      desc = 'Trouble: Document diagnostics',
    },
    {
      '<leader>xq',
      function()
        require('trouble').toggle('quickfix')
      end,
      desc = 'Trouble: Quickfix',
    },
    {
      '<leader>xl',
      function()
        require('trouble').toggle('loclist')
      end,
      desc = 'Trouble: Loclist',
    },
    {
      '<leader>xr',
      function()
        require('trouble').toggle('lsp_references')
      end,
      desc = 'Trouble: Lsp references',
    },
    {
      ']t',
      function()
        require('trouble').next({ skip_groups = true, jump = true })
      end,
      desc = 'Trouble: Lsp references',
    },
    {
      '[t',
      function()
        require('trouble').previous({ skip_groups = true, jump = true })
      end,
      desc = 'Trouble: Lsp references',
    },
  },
}
