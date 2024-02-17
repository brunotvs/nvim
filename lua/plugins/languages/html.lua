TableInsert(LspServers, { emmet_ls = {}, html = {} })
TableInsert(MasonEnsureInstalled, { 'prettierd' })
TableInsert(TreesitterEnsureInstalled, { 'html' })
-- TableInsert(ServersToFilterFromFormat, { "html" })
return {
  {
    'stevearc/conform.nvim',
    dev = true,
    url = 'https://github.com/brunotvs/conform.nvim.git',
    opts = {
      formatters_by_ft = {
        html = { 'prettierd' },
      },
    },
  },
}
