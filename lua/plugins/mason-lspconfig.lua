local function peekOrHover()
  local status, module = pcall(require, 'ufo')
  local ufo = status and module or nil
  local winid = ufo and ufo.peekFoldedLinesUnderCursor() or false
  if winid then
    local bufnr = vim.api.nvim_win_get_buf(winid)
    local keys = { 'a', 'i', 'o', 'A', 'I', 'O', 'gd', 'gr' }
    for _, k in ipairs(keys) do
      -- Add a prefix key to fire `trace` action,
      -- if Neovim is 0.8.0 before, remap yourself
      vim.keymap.set('n', k, '<CR>' .. k, { noremap = false, buffer = bufnr })
    end
  else
    vim.lsp.buf.hover()
  end
end


-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, {
      buffer = bufnr,
      desc = desc,
    })
  end
  local imap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('i', keys, func, {
      buffer = bufnr,
      desc = desc,
    })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

  -- See `:help K` for why this keymap
  nmap('<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('<leader>k', peekOrHover, 'Hover Documentation')
  imap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  local clientName = client.name
  LspServers[clientName]['on_attach'](client, bufnr)
end

return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      -- Setup neovim lua configuration
      require('neodev').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require('mason-lspconfig')

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(LspServers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            root_dir = LspServers[server_name]['root_dir'],
            name = LspServers[server_name]['name'],
            filetypes = LspServers[server_name]['filetypes'],
            autostart = LspServers[server_name]['autostart'],
            single_file_support = LspServers[server_name]['single_file_support'],
            on_new_config = LspServers[server_name]['on_new_config'],
            capabilities = capabilities,
            cmd = LspServers[server_name]['cmd'],
            handlers = LspServers[server_name]['handlers'],
            on_attach = on_attach,
            settings = LspServers[server_name]['settings'],
          }
        end,
      }
    end,
  },
}
