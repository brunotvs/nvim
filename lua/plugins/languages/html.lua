LspServers.emmet_ls = {}
LspServers.html = {}
table.insert(MasonEnsureInstalled, "prettierd")
table.insert(TreesitterEnsureInstalled, "html")
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
