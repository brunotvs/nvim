vim.api.nvim_create_user_command('LspStopAllClients', function()
  local clients = vim.lsp.get_clients()

  local plural = #clients == 1 and '' or 's'
  vim.notify('Stopping ' .. #clients .. ' client' .. plural)
  for _, client in ipairs(clients) do
    vim.lsp.get_client_by_id(client.id):stop()
  end
end, { desc = 'Kill all lsp clients' })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(mode, keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set(mode, keys, func, {
        buffer = event.buf,
        desc = desc,
      })
    end

    local nmap = function(keys, func, desc)
      map('n', keys, func, desc)
    end

    local imap = function(keys, func, desc)
      map('i', keys, func, desc)
    end

    local vmap = function(keys, func, desc)
      map('v', keys, func, desc)
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('td', vim.lsp.buf.type_definition, 'Type [D]efinition')

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
    vmap('<A-i>', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, 'Inlay hint')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      vim.lsp.buf.list_workspace_folders()
    end, '[W]orkspace [L]ist Folders')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    for _, f in ipairs(AdditionalOnAttachFunctions) do
      f(client, event.buf)
    end

    if client and client:supports_method('textDocument/documentHighlight', event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      nmap('<A-i>', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, 'Inlay hint')
      imap('<A-i>', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, 'Inlay hint')
      vmap('<A-i>', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, 'Inlay hint')
    end
  end,
})
