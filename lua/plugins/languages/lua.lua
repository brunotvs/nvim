TableInsert(LspServers, {
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = 'Disable',
        },
        hint = { enable = true },
      },
    },
  },
})

TableInsert(MasonEnsureInstalled, { 'stylua', 'local-lua-debugger' })

TableInsert(TreesitterEnsureInstalled, { 'lua' })
TableInsert(NeotestAdapters, { ['neotest-busted'] = {} })

--- @type LazySpec
return {
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      dap.adapters['local-lua'] = {
        type = 'executable',
        command = 'local-lua-debugger',
        enrich_config = function(config, on_config)
          if not config['extensionPath'] then
            local c = vim.deepcopy(config)
            -- 💀 If this is missing or wrong you'll see
            -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session

            ---@diagnostic disable-next-line: inject-field
            c.extensionPath = require('mason-core.installer.InstallLocation').global():package('local-lua-debugger')
            on_config(c)
          else
            on_config(config)
          end
        end,
      }
      dap.configurations.lua = {
        {
          name = 'Current file (local-lua-dbg, lua)',
          type = 'local-lua',
          request = 'launch',
          cwd = '${workspaceFolder}',
          program = {
            lua = 'lua',
            file = '${file}',
          },
          args = {},
        },
      }
    end,
  },
  {
    'brunotvs/neotest-busted',
    ft = 'lua',
    url = 'https://github.com/brunotvs/neotest-busted.git',
    dependencies = {
      'nvim-neotest/neotest',
    },
  },
}
