LspServers.cssls = {}
TableInsert(LspServers, { cssls = {} })
TableInsert(MasonEnsureInstalled, { "prettierd" })
TableInsert(TreesitterEnsureInstalled, { 'css', 'scss' })
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      formatters_by_ft = {
        css = { "prettierd" },
        scss = { "prettierd" },
        sass = { "prettierd" },
      },
    }
  }
}
