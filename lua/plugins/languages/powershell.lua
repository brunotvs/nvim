LspServers = vim.tbl_extend('error', LspServers, { powershell_es = {} })

--- @type LazySpec
return {
  'powershell',
  virtual = true,
}
