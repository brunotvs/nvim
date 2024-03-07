TableInsert(LspServers, { lemminx = {} })
TableInsert(MasonEnsureInstalled, { 'xmlformatter' })
TableInsert(TreesitterEnsureInstalled, { 'xml' })
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
