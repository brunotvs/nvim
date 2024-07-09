--- @type LazySpec
return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.vimtex_view_automatic = 1
    vim.g.vimtex_quickfix_open_on_warning = 0

    vim.g.vimtex_view_method = 'zathura'
    if vim.fn.has('win32') == 1 or (vim.fn.has('unix') == 1 and vim.fn.exists('$WSLENV') == 1) then
      if vim.fn.executable('sioyek.exe') == 1 then
        vim.g.vimtex_view_method = 'sioyek'
        vim.g.vimtex_view_sioyek_exe = 'sioyek.exe'
        vim.g.vimtex_callback_progpath = 'wsl nvim'
      elseif vim.fn.executable('mupdf.exe') == 1 then
        vim.g.vimtex_view_general_viewer = 'mupdf.exe'
      elseif vim.fn.executable('SumatraPDF.exe') == 1 then
        vim.g.vimtex_view_general_viewer = 'SumatraPDF.exe'
      end
    end
  end,

  keys = {
    { '<M-p>', '<cmd>VimtexTocToggle<cr>', desc = 'Vimtex: Document ToC' },
  },
}
