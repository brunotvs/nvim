---@module "conform"

LspServers = vim.tbl_extend('force', LspServers, {
  lua_ls = {
    init_options = {
      storagePath = (function()
        local install_location = require('mason-core.installer.InstallLocation')
        return install_location.global():share('luals-addons')
      end)(),
    },
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

MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'stylua', 'local-lua-debugger', 'luals-addon-busted', 'luals-addon-luassert' })

TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'lua' })
NeotestAdapters = vim.tbl_extend('force', NeotestAdapters, { ['neotest-busted'] = {} })

--- @type LazySpec
return {
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'stevearc/conform.nvim',
    ---@type conform.setupOpts
    opts = {
      formatters = {
        stylua = {
          command = 'stylua',
          cwd = require('conform.util').root_file({ 'stylua.toml', '.stylua.toml' }),
          require_cwd = true,
        },
      },
      formatters_by_ft = {
        lua = {
          'stylua',
        },
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
    dependencies = {
      'nvim-neotest/neotest',
    },
  },
}
