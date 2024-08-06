--- @type LazySpec
return {
  'RRethy/vim-illuminate',
  opts = {
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
      'lsp',
      'treesitter',
      'regex',
    },
    delay = 100,
    filetypes_denylist = {
      'dirbuf',
      'dirvish',
      'fugitive',
      'NvimTree',
      'Outline',
    },
  },
  config = function(_, opts)
    require('illuminate').configure(opts)
  end,
}
