TableInsert(MasonEnsureInstalled, { 'beautysh' })
TableInsert(LspServers, { bashls = {} })

return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        zsh = { 'beautysh' },
      },
    },
  },
}
