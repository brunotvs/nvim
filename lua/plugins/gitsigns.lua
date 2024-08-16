--- @type LazySpec
return {
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
      vim.keymap.set('n', '[g', require('gitsigns').prev_hunk, {
        buffer = bufnr,
        desc = 'Gitsings: [G]o to [P]revious Hunk',
      })
      vim.keymap.set('n', ']g', require('gitsigns').next_hunk, {
        buffer = bufnr,
        desc = 'Gitsings: [G]o to [N]ext Hunk',
      })
      vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk_inline, {
        buffer = bufnr,
        desc = 'Gitsings: [P]review [H]unk inline',
      })
      vim.keymap.set('n', '<leader>hP', require('gitsigns').preview_hunk, {
        buffer = bufnr,
        desc = 'Gitsings: [P]review [H]unk',
      })
      vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_hunk, {
        buffer = bufnr,
        desc = 'Gitsings: [H]unk [R]eset',
      })
      vim.keymap.set('n', '<leader>hs', require('gitsigns').stage_hunk, {
        buffer = bufnr,
        desc = 'Gitsings: [H]unk [S]stage',
      })
      vim.keymap.set('n', '<leader>hu', require('gitsigns').undo_stage_hunk, {
        buffer = bufnr,
        desc = 'Gitsings: [H]unk [U]nstage',
      })
    end,
  },
}
