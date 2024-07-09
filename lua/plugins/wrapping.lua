--- @type LazySpec
return {
  'andrewferrier/wrapping.nvim',
  lazy = false,
  config = function(_, opts)
    require('wrapping').setup(opts)
  end,
}
