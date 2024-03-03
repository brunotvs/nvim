-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.del('n', '<C-k>', { buffer = bufnr })
  vim.keymap.del('n', 'q', { buffer = bufnr })
  vim.keymap.set('n', 'i', api.node.show_info_popup, opts('Info'))
end

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    on_attach = on_attach,
  },
  keys = {
    { '<M-b>', vim.cmd.NvimTreeToggle, desc = 'NvimTree: Toggle', mode = { 'n', 'v' } },
    { '<M-f>', vim.cmd.NvimTreeFindFileToggle, desc = 'NvimTree: Toggle file', mode = { 'n', 'v' } },
  },
}
