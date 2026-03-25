LspServers = vim.tbl_extend('error', LspServers, { taplo = {} })
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
