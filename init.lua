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
  for _, value in ipairs(ServersToFilterFromFormat) do
    if value == client.name then
      return false
    end
  end
  return true
end

---@param list table
---@param values any[]
function TableInsert(list, values)
  for key, value in pairs(values) do
    local list_len = #list
    local index = (type(key) == 'number' and { list_len + 1 } or { key })[1]
    list[index] = value
  end
end

LspServers = {
  clangd = {},
  vimls = {},
  perlnavigator = {},
  taplo = {},
}

---@type string[]
MasonEnsureInstalled = {
  'latexindent',
  'editorconfig-checker',
}
---@type string[]
TreesitterEnsureInstalled = {
  'vimdoc',
  'vim',
  'markdown',
  'markdown_inline',
  'toml',
  'editorconfig',
}
---@type string[]
NeotestAdapters = {}

---@type (fun(client: any, bufnr:integer): nil)[]
AdditionalOnAttachFunctions = {}

require('config.lazy')

local exists, _ = pcall(require, 'secrets.secrets')

if not exists then
  vim.notify_once('Secrets file not created', vim.log.levels.WARN)
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
