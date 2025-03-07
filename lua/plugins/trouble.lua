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
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Trouble: Toggle',
    },
    {
      '<leader>xb',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Trouble: Toggle',
    },
    {
      '<leader>xe',
      '<cmd>Trouble diagnostics filter.severity=vim.diagnostic.severity.ERROR<cr>',
      desc = 'Trouble: Toggle',
    },
    {
      '<leader>xd',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Trouble: Document diagnostics',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Trouble: Quickfix',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle win.position=right win.size=.3<cr>',
      desc = 'Trouble: Quickfix',
    },
    {
      '<leader>xl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Trouble: Loclist',
    },
    {
      '<leader>xr',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'Trouble: Lsp references',
    },
    {
      '<M-o>',
      '<cmd>Trouble symbols toggle focus=false<cr>',
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
  },
}
