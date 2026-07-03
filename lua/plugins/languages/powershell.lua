LspServers = vim.tbl_extend('force', LspServers, { powershell_es = {} })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'powershell-editor-services' })

--- @type LazySpec
return {
  'powershell',
  virtual = true,
}
