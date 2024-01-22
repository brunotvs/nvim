return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
    keys = {
      { '<F5>',       function() require('dap').continue() end,                                            desc = 'Debug: Start/Continue' },
      { '<F1>',       function() require('dap').step_into() end,                                           desc = 'Debug: Step Into' },
      { '<F2>',       function() require('dap').step_over() end,                                           desc = 'Debug: Step Over' },
      { '<F3>',       function() require('dap').step_out() end,                                            desc = 'Debug: Step Out' },
      { '<leader>db', function() require('dap').toggle_breakpoint() end,                                   desc = 'Debug: Toggle Breakpoint' },
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Breakpoint' }
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    opts = {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    },
    config = function(_, opts)
      local dapui = require('dapui')
      dapui.setup(opts)
    end,
    keys = { { '<F7>', function() require('dapui').toggle() end, desc = 'Debug: See last session result' } }
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
      'williamboman/mason.nvim',
    },
    opts = {
      automatic_setup = true,
      handlers = {},
    },
    config = function(_, opts)
      require('mason-nvim-dap').setup(opts)
    end
  }
}
