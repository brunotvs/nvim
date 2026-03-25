LspServers = vim.tbl_extend('error', LspServers, {
  gopls = {},
})

MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'go-debug-adapter', 'delve' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'go' })
NeotestAdapters = vim.list_extend(NeotestAdapters, { ['neotest-golang'] = {} })

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
