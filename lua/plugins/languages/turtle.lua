LspServers = vim.tbl_extend('force', LspServers, {
  turtle_ls = {},
})
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'turtle-language-server' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'turtle' })

vim.filetype.add({ extension = { ttl = 'turtle' } })

--- @type LazySpec
return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'turtle-config',
    virtual = true,
  },
}
