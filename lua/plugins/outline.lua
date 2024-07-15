--- @type LazySpec
return {
  'hedyhli/outline.nvim',
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  opts = {},
  keys = {
    { '<M-o>', '<cmd>Outline!<CR>', desc = 'Outline: Toggle outline' },
  },
}
