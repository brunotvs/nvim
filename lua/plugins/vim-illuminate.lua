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
    filetype_overrides = {
      tex = {
        providers = {
          'regex',
          'lsp',
          'treesitter',
        },
      },
    },
    filetypes_denylist = {
      'dirbuf',
      'dirvish',
      'fugitive',
      'NvimTree',
      'Outline',
    },
  },
  config = function(_, opts)
    local i = require('illuminate')
    i.configure(opts)
    vim.keymap.set('n', '<M-N>', function()
      i.goto_prev_reference(true)
    end, { desc = 'Illuminate previous' })
  end,
}
