LspServers['rust_analyzer'] = {}
table.insert(TreesitterEnsureInstalled, 'rust')
return {
  { 'williamboman/mason-lspconfig.nvim' },
}
