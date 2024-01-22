TableInsert(LspServers, { emmet_ls = {}, html = {} })
TableInsert(MasonEnsureInstalled, { "prettierd" })
TableInsert(TreesitterEnsureInstalled, { "html" })
TableInsert(ServersToFilterFromFormat, { "html" })
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      formatters_by_ft = {
        html = { "prettierd" },
      },
    }
  },
}
