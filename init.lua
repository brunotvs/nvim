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
---@param values List
function TableInsert(list, values)
  for key, value in pairs(values) do
    local list_len = #list
    local index = (type(key) == 'number' and { list_len + 1 } or { key })[1]
    list[index] = value
  end
end

LspServers = {
  clangd = {},
}

---@type string[]
MasonEnsureInstalled = {
  'latexindent',
}
---@type string[]
TreesitterEnsureInstalled = {
  'vimdoc',
  'vim',
  'markdown',
  'markdown_inline',
}
---@type string[]
NeotestAdapters = {}

---@type (fun(client: any, bufnr:integer): nil)[]
AdditionalOnAttachFunctions = {}

require('config.lazy')

require('secrets.secrets')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
