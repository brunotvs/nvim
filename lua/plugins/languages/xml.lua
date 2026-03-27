LspServers = vim.tbl_extend('force', LspServers, { lemminx = {} })
MasonEnsureInstalled = vim.list_extend(MasonEnsureInstalled, { 'xmlformatter' })
TreesitterEnsureInstalled = vim.list_extend(TreesitterEnsureInstalled, { 'xml' })

--- @type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        xml = { 'xmlformatter' },
      },
    },
  },
}
