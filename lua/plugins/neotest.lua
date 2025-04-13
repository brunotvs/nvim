--- @type LazySpec
return {
  'nvim-neotest/neotest',
  url = 'https://github.com/brunotvs/neotest.git',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'folke/trouble.nvim',
    'nvim-neotest/nvim-nio',
  },
  opts = {
    adapters = NeotestAdapters,
    status = { virtual_text = true },
    output = { open_on_run = true },
  },
  init = function()
    local neotest_ns = vim.api.nvim_create_namespace('neotest')
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          -- Replace newline and tab characters with space for more compact diagnostics
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)
  end,
  config = function(_, opts)
    if opts.adapters then
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        if type(name) == 'number' then
          if type(config) == 'string' then
            config = require(config)
          end
          vim.list_extend(adapters, config)
        elseif config ~= false then
          local adapter = require(name)
          if type(config) == 'table' and not vim.tbl_isempty(config) then
            local meta = getmetatable(adapter)
            if adapter.setup then
              adapter.setup(config)
            elseif meta and meta.__call then
              adapter(config)
            else
              error('Adapter ' .. name .. ' does not support setup')
            end
          end
          adapters[#adapters + 1] = adapter
        end
      end
      opts.adapters = adapters
    end

    require('neotest').setup(opts)
  end,
  keys = {
    {
      '<leader>tt',
      function()
        require('neotest').run.run(vim.fn.expand('%'))
      end,
      desc = 'Neotest: Run File',
    },
    {
      '<leader>tl',
      function()
        require('neotest').run.run_last()
      end,
      desc = 'Neotest: Run last',
    },
    {
      '<leader>tw',
      function()
        require('neotest').watch.toggle()
      end,
      desc = 'Neotest: watch nearest',
    },
    {
      '<leader>tW',
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require('neotest').watch.stop()
      end,
      desc = 'Neotest: stop all watchers',
    },
    {
      '<leader>ta',
      function()
        require('neotest').run.run({ suite = true })
      end,
      desc = 'Neotest: Run All Test Files',
    },
    {
      '<leader>tr',
      function()
        local neotest = require('neotest')
        local nio = require('nio')
        ---@type neotest.run.RunArgs
        local args = { strategy = 'integrated', suite = false }

        nio.create(function()
          ---@diagnostic disable-next-line: invisible
          local tree = neotest.run.get_tree_from_args({}, true)
          if tree then
            neotest.run.run(args)
            return
          end
          neotest.run.run_last(args)
        end)()
      end,
      desc = 'Neotest: Run Nearest',
    },
    {
      '<leader>tR',
      function()
        local neotest = require('neotest')
        neotest.summary.run_marked()
      end,
      desc = 'Neotest: Run marked',
    },
    {
      '<M-t>',
      function()
        require('neotest').summary.toggle()
        vim.cmd.wincmd('=')
      end,
      desc = 'Neotest: Toggle Summary',
    },
    {
      '<leader>to',
      function()
        require('neotest').output.open({ enter = true, auto_close = true })
      end,
      desc = 'Neotest: Show Output',
    },
    {
      '<leader>tO',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'Neotest: Toggle Output Panel',
    },
    {
      '<leader>tS',
      function()
        require('neotest').run.stop()
      end,
      desc = 'Neotest: Stop',
    },
    {
      '<leader>dt',
      function()
        local neotest = require('neotest')
        local nio = require('nio')
        ---@type neotest.run.RunArgs
        local args = { strategy = 'dap', suite = false }

        nio.create(function()
          ---@diagnostic disable-next-line: invisible
          local tree = neotest.run.get_tree_from_args({}, true)
          if tree then
            neotest.run.run(args)
            return
          end
          neotest.run.run_last(args)
        end)()
      end,
      desc = 'Neotest: debug nearest or last',
    },
  },
}
