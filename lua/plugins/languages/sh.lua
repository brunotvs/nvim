TableInsert(MasonEnsureInstalled, { 'beautysh' })
TableInsert(LspServers, { bashls = {} })

return {
  {
    'stevearc/conform.nvim',
    dev = true,
    url = 'https://github.com/brunotvs/conform.nvim.git',
    opts = {
      formatters_by_ft = {
        zsh = { 'beautysh' },
      },
    },
  },
}
