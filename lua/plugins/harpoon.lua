local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    local harpoon = require('harpoon')
    harpoon:list():clear()
    local Path = require('plenary.path')
    local cwd = vim.loop.cwd()

    for _, j in pairs(multi) do
      if j.path ~= nil then
        local item_path = Path:new(j.path):make_relative(cwd)
        harpoon:list():append({ value = item_path, context = { row = 1, col = 0 } })
      end
    end
  end
  require('telescope.actions').select_default(prompt_bufnr)
end
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope.nvim',
      opts = {
        defaults = {
          mappings = {
            i = {
              ['<CR>'] = select_one_or_multi,
            },
          },
        },
      },
    },
  },
  opts = {},
  config = function(_, opts)
    require('telescope').load_extension('harpoon')
    require('harpoon'):setup(opts)
  end,
  keys = {
    {
      '<M-h>',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = 'Harpoon: Toggle menu',
    },
    {
      '<leader>ha',
      function()
        require('harpoon'):list():append()
      end,
      desc = 'Harpoon: Add file',
    },
    {
      '<leader>hh',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon: Nav file 1',
    },
    {
      '<leader>hj',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Harpoon: Nav file 2',
    },
    {
      '<leader>hk',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Harpoon: Nav file 3',
    },
    {
      '<leader>hl',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Harpoon: Nav file 4',
    },
    {
      '<leader>hc',
      function()
        require('harpoon'):list():clear()
      end,
      desc = 'Harpoon: Clear all',
    },
    {
      ']h',
      function()
        require('harpoon'):list():next()
      end,
      desc = 'Harpoon: Clear all',
    },
    {
      '][',
      function()
        require('harpoon'):list():prev()
      end,
      desc = 'Harpoon: Clear all',
    },
  },
}
