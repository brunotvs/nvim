TableInsert(LspServers, {
  gopls = {},
})

TableInsert(MasonEnsureInstalled, { 'go-debug-adapter' })
TableInsert(TreesitterEnsureInstalled, { 'go' })
TableInsert(NeotestAdapters, { ['neotest-golang'] = {} })

---@type LazySpec
return {
  'fredrikaverpil/neotest-golang',
  dependencies = { 'neotest/neotest' },
}
