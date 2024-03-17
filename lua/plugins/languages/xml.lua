TableInsert(LspServers, { lemminx = {} })
TableInsert(MasonEnsureInstalled, { 'xmlformatter' })
TableInsert(TreesitterEnsureInstalled, { 'xml' })

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
