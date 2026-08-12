---@module "conform"

LspServers = vim.tbl_extend('force', LspServers, {
  r_language_server = {},
})

MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, {
  'r-languageserver',
})

TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'r' })

--- @type LazySpec
return {
  'r-config',
  virtual = true,
}
