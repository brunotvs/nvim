TableInsert(LspServers, { pyright = {} })
TableInsert(MasonEnsureInstalled, { 'debugpy' })
TableInsert(TreesitterEnsureInstalled, { 'python' })
TableInsert(NeotestAdapters, { ['neotest-python'] = {} })

--- @type LazySpec
return {
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'williamboman/mason.nvim',
    },
    init = function()
      local mason_registry = require('mason-registry')
      local install_location = require('mason-core.installer.InstallLocation')
      local path = install_location.global():package('debugpy')
      require('dap-python').setup(path)
    end,
  },
  {
    'nvim-neotest/neotest-python',
    ft = 'python',
    dependencies = {
      'nvim-neotest/neotest',
    },
  },
  {
    'bfredl/nvim-ipy',
    init = function()
      vim.g.nvim_ipy_perform_mappings = 0
    end,
  },
}
