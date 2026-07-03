LspServers = vim.tbl_extend('force', LspServers, { taplo = {} })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'taplo' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'toml' })

--- @type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        toml = { 'taplo' },
      },
    },
  },
}
