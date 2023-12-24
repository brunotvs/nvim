LspServers.cssls = {}
table.insert(MasonEnsureInstalled, "prettierd")
table.insert(TreesitterEnsureInstalled, 'css')
table.insert(TreesitterEnsureInstalled, 'scss')
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
