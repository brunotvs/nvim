--- @type table<string,dapui.Config.layout[]>
local named_layouts = {
  Default = {
    {
      elements = {
        {
          id = 'scopes',
          size = 0.25,
        },
        {
          id = 'breakpoints',
          size = 0.25,
        },
        {
          id = 'stacks',
          size = 0.25,
        },
        {
          id = 'watches',
          size = 0.25,
        },
      },
      position = 'left',
      size = 40,
    },
    {
      elements = { {
        id = 'repl',
        size = 0.5,
      }, {
        id = 'console',
        size = 0.5,
      } },
      position = 'bottom',
      size = 10,
    },
  },
  Other = {
    elements = {
      {
        id = 'scopes',
        size = 0.25,
      },
      {
        id = 'breakpoints',
        size = 0.25,
      },
      {
        id = 'stacks',
        size = 0.25,
      },
      {
        id = 'watches',
        size = 0.25,
      },
    },
    position = 'left',
    size = 40,
  },
}

local additional_layouts = {
  'Other',
}

local layouts = {}
table.insert(layouts, named_layouts.Default)

for _, value in ipairs(additional_layouts) do
  table.insert(layouts, named_layouts[value])
end

--- @type LazySpec
return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  main = 'dapui',
  ---@diagnostic disable: missing-fields
  --- @type dapui.Config?
  opts = {
    layout = layouts,
  },
  ---@diagnostic enable: missing-fields
  init = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dap.listeners.after.event_initialized['dapui_config'] = function()
      local input_list = { 'Choose layout: ', '1. Default' }
      for index, value in ipairs(additional_layouts) do
        local input = index + 1 .. '. ' .. value
        table.insert(input_list, input)
      end
      local layout = vim.fn.inputlist(input_list)
      layout = math.max(layout, 1)
      dapui.open({ layout = layout })
    end
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
