TableInsert(LspServers, { emmet_ls = {}, html = {} })
TableInsert(MasonEnsureInstalled, { 'prettierd' })
TableInsert(TreesitterEnsureInstalled, { 'html' })
-- TableInsert(ServersToFilterFromFormat, { "html" })
--- @type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        html = { 'prettierd' },
      },
    },
  },
}
