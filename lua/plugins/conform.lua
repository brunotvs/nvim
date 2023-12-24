local slow_format_filetypes = {}
return {
  'stevearc/conform.nvim',
  optional = true,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    format_on_save = function(bufnr)
      if slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      local function on_format(err)
        if err and err:match("timeout$") then
          slow_format_filetypes[vim.bo[bufnr].filetype] = true
        end
      end

      return { timeout_ms = 200, lsp_fallback = "always", filter = FilterServers }, on_format
    end,

    format_after_save = function(bufnr)
      if not slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      return { lsp_fallback = "always", filter = FilterServers }
    end,
  },
  init = function()
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = "always", range = range, filter = FilterServers })
    end, { range = true })
    vim.keymap.set('n', '<leader>f', '<cmd>Format<CR>', { desc = 'Format current buffer with LSP' })
  end
}
