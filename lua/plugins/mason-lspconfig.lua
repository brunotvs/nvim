-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
function OnAttach(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local map = function(mode, keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set(mode, keys, func, {
      buffer = bufnr,
      desc = desc,
    })
  end

  local nmap = function(keys, func, desc)
    map('n', keys, func, desc)
  end

  local imap = function(keys, func, desc)
    map('i', keys, func, desc)
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
  nmap('<leader>k', vim.lsp.buf.hover, 'Hover Documentation')
  imap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('<A-i>', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, 'Inlay hint')
  imap('<A-i>', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, 'Inlay hint')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    vim.lsp.buf.list_workspace_folders()
  end, '[W]orkspace [L]ist Folders')

  local client_name = client.name
  local server_config = LspServers[client_name] or {}
  pcall(server_config['on_attach'], client, bufnr)

  for _, f in ipairs(AdditionalOnAttachFunctions) do
    f(client, bufnr)
  end
end

--- @type LazySpec
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

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(LspServers),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          if LspServers[server_name] == nil then
            vim.notify('Removing server ' .. server_name)
            vim.cmd.LspUninstall(server_name)
            return
          end
          local opts = { on_attach = OnAttach, capabilities = capabilities }

          for key, value in pairs(LspServers[server_name]) do
            if key ~= 'on_attach' then
              opts[key] = value
            end
          end
          require('lspconfig')[server_name].setup(opts)
        end,
      })
    end,
  },
}
