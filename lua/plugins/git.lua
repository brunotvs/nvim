TableInsert(TreesitterEnsureInstalled, { 'gitattributes', 'git_rebase', 'gitignore', 'gitcommit', 'git_config' })
return {
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = {
          text = '+',
        },
        change = {
          text = '~',
        },
        delete = {
          text = '_',
        },
        topdelete = {
          text = '‾',
        },
        changedelete = {
          text = '~',
        },
      },
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'none',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, {
          buffer = bufnr,
          desc = '[G]o to [P]revious Hunk',
        })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, {
          buffer = bufnr,
          desc = '[G]o to [N]ext Hunk',
        })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, {
          buffer = bufnr,
          desc = '[P]review [H]unk',
        })
      end,
    },
  },
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    cmd = 'Git',
    event = 'BufEnter',
    keys = {
      { '<leader>lg', '<cmd>Git<CR>', desc = 'Git: status' },
    },
  },
  'tpope/vim-rhubarb', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
}
