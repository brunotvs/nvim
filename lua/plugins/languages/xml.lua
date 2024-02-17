TableInsert(LspServers, { lemminx = {} })
TableInsert(MasonEnsureInstalled, { 'xmlformatter' })
TableInsert(TreesitterEnsureInstalled, { 'xml' })
return {
  {
    'stevearc/conform.nvim',
    dev = true,
    url = 'https://github.com/brunotvs/conform.nvim.git',
    opts = {
      formatters_by_ft = {
        xml = { 'xmlformatter' },
      },
    },
  },
}
