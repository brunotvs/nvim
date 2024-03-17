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
    init = function(_)
      local mason_registry = require('mason-registry')
      local debugpy = mason_registry.get_package('debugpy')
      local path = debugpy:get_install_path()
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
  { 'bfredl/nvim-ipy' },
}
