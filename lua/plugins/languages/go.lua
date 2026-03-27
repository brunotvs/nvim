LspServers = vim.tbl_extend('force', LspServers, {
  gopls = {},
})

MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'go-debug-adapter', 'delve' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'go' })
NeotestAdapters = vim.tbl_extend('force', NeotestAdapters, { ['neotest-golang'] = {} })

---@type LazySpec
return {
  {
    'fredrikaverpil/neotest-golang',
    dependencies = { 'neotest/neotest' },
  },
  {
    'leoluz/nvim-dap-go',
    opts = {},
  },
}
