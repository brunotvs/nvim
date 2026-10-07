---@type LazySpec
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          -- ['@class.outer'] = '<c-v>', -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = false,
      },
      move = { set_jumps = true },
    },
  },
  init = function()
    vim.g.no_plugin_maps = true
  end,

  keys = {
    -- Capture maps
    {
      'aa',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@parameter.outer', 'textobjects')
      end,
      mode = { 'x', 'o' },
      desc = 'Select outer parameter',
    },

    {
      'ia',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@parameter.inner', 'textobjects')
      end,
      mode = { 'x', 'o' },
      desc = 'Select inner parameter',
    },
    {
      'af',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
      end,
      mode = { 'x', 'o' },
      desc = 'Select outer function',
    },
    {
      'if',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
      end,
      mode = { 'x', 'o' },
      desc = 'Select inner function',
    },
    {
      'ac',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
      end,
      mode = { 'x', 'o' },
      desc = 'Select outer class',
    },
    {
      'ic',
      function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
      end,
      mode = { 'x', 'o' },
      desc = 'Select inner class',
    },

    -- Swap maps
    {
      '<leader>a',
      function()
        require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')
      end,
      mode = { 'n' },
      desc = 'Swap next parameter',
    },
    {
      '<leader>A',
      function()
        require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.outer')
      end,
      mode = { 'n' },
      desc = 'Swap previous parameter',
    },

    -- Move maps
    {
      ']f',
      function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Move to next function start',
    },
    {
      '][',
      function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Move to next class start',
    },
    {
      ']o',
      function()
        require('nvim-treesitter-textobjects.move').goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Next to next loop',
    },
    {
      ']F',
      function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Move to next function end',
    },
    {
      ']]',
      function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Move to next class end',
    },
    {
      '[f',
      function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Move to previous function start',
    },
    {
      '[[',
      function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Move to previous class start',
    },
    {
      '[F',
      function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Move to previous function end',
    },
    {
      '[]',
      function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Move to previous class end',
    },
    {
      ';',
      function()
        require('nvim-treesitter-textobjects.repeatable_move').repeat_last_move_next()
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Repeat last move next',
    },
    {
      ',',
      function()
        require('nvim-treesitter-textobjects.repeatable_move').repeat_last_move_previous()
      end,
      mode = { 'n', 'x', 'o' },
      desc = 'Repeat last move previous',
    },
  },
}
