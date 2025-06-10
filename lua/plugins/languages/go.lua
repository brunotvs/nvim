TableInsert(LspServers, {
  gopls = {},
})

TableInsert(MasonEnsureInstalled, { 'go-debug-adapter', 'delve' })
TableInsert(TreesitterEnsureInstalled, { 'go' })
TableInsert(NeotestAdapters, { ['neotest-golang'] = {} })

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
