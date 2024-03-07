TableInsert(MasonEnsureInstalled, { 'commitlint' })
return {
  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        gitcommit = { 'commitlint' },
      },
    },
  },
}
