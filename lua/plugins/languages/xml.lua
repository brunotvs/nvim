LspServers.lemminx = {}
table.insert(MasonEnsureInstalled, "xmlformatter")
table.insert(TreesitterEnsureInstalled, 'xml')
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      formatters_by_ft = {
        xml = { "xmlformatter" },
      },
    }
  }
}
