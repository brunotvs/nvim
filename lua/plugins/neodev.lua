--- @type LazySpec
return {
  'folke/neodev.nvim',
  opts = {
    library = {
      plugins = { 'neotest' },
      types = true,
    },
  },
  enabled = false,
}
