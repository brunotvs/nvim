LspServers = vim.tbl_extend('force', LspServers, { powershell_es = {} })

--- @type LazySpec
return {
  'powershell',
  virtual = true,
}
