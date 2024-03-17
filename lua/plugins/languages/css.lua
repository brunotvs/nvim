TableInsert(LspServers, { cssls = {} })
TableInsert(MasonEnsureInstalled, { 'prettierd' })
TableInsert(TreesitterEnsureInstalled, { 'css', 'scss' })
-- TableInsert(ServersToFilterFromFormat, { 'cssls' })

--- @type LazySpec
return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        css = { 'prettierd' },
        scss = { 'prettierd' },
        sass = { 'prettierd' },
      },
    },
  },
}
