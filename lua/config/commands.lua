vim.api.nvim_create_user_command('LspStopAllClients', function()
  local clients = vim.lsp.get_clients()

  local plural = #clients == 1 and '' or 's'
  vim.notify('Stopping ' .. #clients .. ' client' .. plural)
  for _, client in ipairs(clients) do
    vim.lsp.stop_client(client.id)
  end
end, { desc = 'Kill all lsp clients' })
