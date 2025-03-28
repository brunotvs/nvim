---@module "dapui"

--- @type LazySpec
return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  main = 'dapui',
  ---@diagnostic disable: missing-fields
  --- @type dapui.Config
  opts = {},
  ---@diagnostic enable: missing-fields
  init = function()
    local dap, dapui = require('dap'), require('dapui')
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
  keys = {
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result',
    },
    {
      '<M-k>',
      function()
        require('dapui').eval()
      end,
      desc = 'Debug: Set Breakpoint',
    },
  },
}
