LspServers['rust_analyzer'] = {}
table.insert(TreesitterEnsureInstalled, 'rust')
return {
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'rouge8/neotest-rust',
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust")
        }
      })
    end
  }
}
