LspServers.pyright = {}
table.insert(MasonEnsureInstalled, 'debugpy')
table.insert(TreesitterEnsureInstalled, 'python')
NeotestAdapters["neotest-python"] = {}
return {
  {
    'mfussenegger/nvim-dap-python',
    ft = "python",
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = function(_)
      local mason_registry = require("mason-registry")
      local debugpy = mason_registry.get_package("debugpy")
      local path = debugpy:get_install_path()
      require("dap-python").setup(path)
    end
  },
  {
    "nvim-neotest/neotest-python",
    ft = 'python',
    dependencies = {
      "nvim-neotest/neotest",
    }
  },
  { "bfredl/nvim-ipy" }
}
