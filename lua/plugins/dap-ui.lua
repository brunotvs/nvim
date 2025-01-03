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
    local dap = require('dap')
    local dapui = require('dapui')
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
  keys = {
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result',
    },
  },
}
