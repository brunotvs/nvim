TableInsert(LspServers, { cssls = {} })
TableInsert(MasonEnsureInstalled, { 'prettierd' })
TableInsert(TreesitterEnsureInstalled, { 'css', 'scss' })
-- TableInsert(ServersToFilterFromFormat, { 'cssls' })
return {
  {
    'stevearc/conform.nvim',
    dev = true,
    url = 'https://github.com/brunotvs/conform.nvim.git',
    opts = {
      formatters_by_ft = {
        css = { 'prettierd' },
        scss = { 'prettierd' },
        sass = { 'prettierd' },
      },
    },
  },
}
