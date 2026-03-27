LspServers = vim.tbl_extend('force', LspServers, { pyright = {} })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'debugpy' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'python' })
NeotestAdapters = vim.tbl_extend('force', NeotestAdapters, { ['neotest-python'] = {} })

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
