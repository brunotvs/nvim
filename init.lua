-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
ServersToFilterFromFormat = {}
function FilterServers(client)
  for _, value in pairs(ServersToFilterFromFormat) do
    if value == client.name then
      return false
    end
  end
  return true
end

---@param list table
---@param values table
function TableInsert(list, values)
  for _, value in ipairs(values) do
    table.insert(list, value)
  end

  for key, value in pairs(values) do
    list[key] = value
  end
end

LspServers = {
  texlab = {},
}

MasonEnsureInstalled = {
  'latexindent',
  'mypy',
  'ruff',
  'black',
  'isort',
  'commitlint',
}
TreesitterEnsureInstalled = {
  'c',
  'cpp',
  'go',
  'lua',
  'tsx',
  'typescript',
  'vimdoc',
  'vim',
  'markdown',
  'markdown_inline'
}
NeotestAdapters = {}

require("config.lazy")
require("config.highlight-on-yank")
require("config.keymaps")
require("config.options")


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
