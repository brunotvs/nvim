--- @type LazySpec
return {
  'nvim-treesitter/nvim-treesitter-context',
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
