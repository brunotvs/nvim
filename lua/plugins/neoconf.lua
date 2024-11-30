--- @type LazySpec
return {
  {
    'folke/neoconf.nvim',
    cmd = 'Neoconf',
    lazy = false,
    priority = 1,
    opts = {},
  },
  { 'neovim/nvim-lspconfig', dependencies = { 'folke/neoconf.nvim' } },
}
