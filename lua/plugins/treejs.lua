return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    use_default_keymaps = false,
  },
  config = function(_, opts)
    require('treesj').setup({ opts })
  end,
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
