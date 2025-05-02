--- @type LazySpec
return {
  'folke/trouble.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope.nvim',
    },
  },
  cmd = 'Trouble',
  ---@class trouble.Config
  opts = {},
  keys = {
    {
      '<leader>xx',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'diagnostics',
          open_no_results = true,
        })
      end,
      desc = 'Trouble: Toggle',
    },
    {
      '<leader>xxb',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'diagnostics',
          filter = { buf = 0 },
          open_no_results = true,
        })
      end,
      desc = 'Trouble: Toggle current buffer',
    },
    {
      '<leader>xe',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'diagnostics',
          filter = {
            severity = vim.diagnostic.severity.ERROR,
          },
          open_no_results = true,
        })
      end,
      desc = 'Trouble: Toggle errors',
    },
    {
      '<leader>xeb',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'diagnostics',
          filter = {
            buf = 0,
            severity = vim.diagnostic.severity.ERROR,
          },
          open_no_results = true,
        })
      end,
      desc = 'Trouble: Toggle errors current buffer',
    },
    {
      '<leader>xq',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'qflist',
          open_no_results = true,
        })
      end,
      desc = 'Trouble: Quickfix',
    },
    {
      '<leader>xqb',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'qflist',
          filter = {
            buf = 0,
          },
          open_no_results = true,
        })
      end,
      desc = 'Trouble: Quickfix',
    },
    {
      '<leader>xQ',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'qflist',
          win = {
            position = 'right',
            size = 0.3,
          },
          open_no_results = true,
        })
      end,
      desc = 'Trouble: Quickfix',
    },
    {
      '<leader>xQb',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'qflist',
          filter = {
            buf = 0,
          },
          win = {
            position = 'right',
            size = 0.3,
          },
          open_no_results = true,
        })
      end,
      desc = 'Trouble: Quickfix',
    },
    {
      '<leader>xl',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'loclist',
          open_no_results = true,
        })
      end,
      desc = 'Trouble: Loclist',
    },
    {
      '<leader>xlb',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'loclist',
          open_no_results = true,
          filter = {
            buf = 0,
          },
        })
      end,
      desc = 'Trouble: Loclist',
    },
    {
      '<leader>xr',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'lsp',
          focus = false,
        })
      end,
      desc = 'Trouble: Lsp references',
    },
    {
      '<M-o>',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'symbols',
          focus = false,
          win = { size = 0.3 },
        })
      end,
      desc = 'Trouble: symbols outline',
    },
    {
      '[x',
      function()
        require('trouble').prev()
        require('trouble').jump()
      end,
    },
    {
      ']x',
      function()
        require('trouble').next()
        require('trouble').jump()
      end,
    },
    {
      '<leader>E',
      function()
        local trouble = require('trouble.api')

        ---@diagnostic disable-next-line: missing-fields
        trouble.toggle({
          mode = 'qflist',
          open_no_results = true,
          filter = {
            buf = 0,
            range = true,
          },
          win = { position = 'right', size = 0.3 },
        })
      end,
    },
  },
}
