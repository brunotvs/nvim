-- Fuzzy Finder (files, lsp, etc)
--- @type LazySpec
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = { file_ignore_patterns = { 'node_modules' } },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = '[?] Find recently opened files',
    },
    {
      '<leader><space>',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>/',
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>gf',
      function()
        require('telescope.builtin').git_files()
      end,
      desc = 'Search [G]it [F]iles',
    },
    {
      '<leader>sf',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sw',
      function()
        require('telescope.builtin').grep_string()
      end,
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sg',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sd',
      function()
        require('telescope.builtin').diagnostics()
      end,
      desc = '[S]earch [D]iagnostics',
    },
  },
}
