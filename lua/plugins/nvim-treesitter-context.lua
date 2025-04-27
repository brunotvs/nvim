--- @type LazySpec
return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    {
      '<M-\\>',
      function()
        require('treesitter-context').toggle()
      end,
      desc = 'TSContext: Toggle',
    },
  },
}
