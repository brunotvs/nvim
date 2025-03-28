--- @type LazySpec
return {
  {
    'mfussenegger/nvim-dap',
    opts = {},
    keys = {
      {
        '<F1>',
        function()
          require('dap').step_into()
        end,
        desc = 'Debug: Step Into',
      },
      {
        '<F2>',
        function()
          require('dap').step_over()
        end,
        desc = 'Debug: Step Over',
      },
      {
        '<F3>',
        function()
          require('dap').step_out()
        end,
        desc = 'Debug: Step Out',
      },
      {
        '<F5>',
        function()
          require('dap').continue()
        end,
        desc = 'Debug: Start/Continue',
      },
      {
        '<F17>',
        function()
          require('dap').disconnect()
        end,
        desc = 'Debug: Disconnect',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Debug: Toggle Breakpoint',
      },
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = 'Debug: Set Breakpoint',
      },
      {
        '<leader>dl',
        function()
          require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end,
        desc = 'Debug: Set Breakpoint',
      },
    },
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
      'williamboman/mason.nvim',
    },
    main = 'mason-nvim-dap',
    opts = {
      automatic_setup = true,
      handlers = {},
    },
  },
}
