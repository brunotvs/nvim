return {
  'simrat39/symbols-outline.nvim',
  config = function(_, opts)
    require('symbols-outline').setup(opts)
  end,
  keys = {
    { '<A-o>', '<cmd>SymbolsOutline<CR>', "SymbolsOutline: Toggle outline" }
  },
}
