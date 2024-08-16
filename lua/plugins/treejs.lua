--- @type LazySpec
return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    use_default_keymaps = false,
  },
  keys = {
    {
      '<leader>bt',
      function()
        require('treesj').toggle()
      end,
      desc = 'Treesj: Toggle block',
    },
  },
}
