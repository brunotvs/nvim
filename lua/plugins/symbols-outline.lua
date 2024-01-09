return {
  'simrat39/symbols-outline.nvim',
  config = function(_, opts)
    require('symbols-outline').setup(opts)
  end,
  keys = {
    { '<M-o>', '<cmd>SymbolsOutline<CR>', "SymbolsOutline: Toggle outline" }
  },
}
