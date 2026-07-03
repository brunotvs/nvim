LspServers = vim.tbl_extend('force', LspServers, { rledgerls = {} })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'rustledger-lsp' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'beancount' })

vim.filetype.add({ extension = { beancount = 'beancount' } })
--- @type LazySpec
return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'beancount-config',
    virtual = true,
  },
}
