local function setPeekOrHover(_, bufnr)
  local function peekOrHover()
    local status, module = pcall(require, 'ufo')
    local ufo = status and module or nil
    local winid = ufo and ufo.peekFoldedLinesUnderCursor() or false
    if winid then
      local localBufnr = vim.api.nvim_win_get_buf(winid)
      local keys = { 'a', 'i', 'o', 'A', 'I', 'O', 'gd', 'gr' }
      for _, k in ipairs(keys) do
        -- Add a prefix key to fire `trace` action,
        -- if Neovim is 0.8.0 before, remap yourself
        vim.keymap.set('n', k, '<CR>' .. k, { noremap = false, buffer = localBufnr })
      end
    else
      vim.lsp.buf.hover()
    end
  end

  vim.keymap.set('n', '<leader>k', peekOrHover, { desc = 'UFO: Peek fold or lsp hover', buffer = bufnr })
end

TableInsert(AdditionalOnAttachFunctions, { setPeekOrHover })

local ftMap = {
  vim = 'indent',
  python = { 'indent' },
  git = '',
  yaml = 'treesitter',
}

local function customizeSelector(bufnr)
  local function handleFallbackException(err, providerName)
    if type(err) == 'string' and err:match('UfoFallbackException') then
      return require('ufo').getFolds(bufnr, providerName)
    else
      return require('promise').reject(err)
    end
  end

  return require('ufo')
    .getFolds(bufnr, 'lsp')
    :catch(function(err)
      return handleFallbackException(err, 'treesitter')
    end)
    :catch(function(err)
      return handleFallbackException(err, 'indent')
    end)
end

local function goPreviousClosedAndPeek()
  require('ufo').goPreviousClosedFold()
  require('ufo').peekFoldedLinesUnderCursor()
end

local function goNextClosedAndPeek()
  require('ufo').goNextClosedFold()
  require('ufo').peekFoldedLinesUnderCursor()
end
--- @type LazySpec
return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async', 'nvim-treesitter/nvim-treesitter' },
  event = 'BufEnter',
  --- @type UfoConfig
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return ftMap[filetype] or customizeSelector
    end,
    preview = {
      win_config = {
        border = 'none',
        winblend = 0,
      },
    },
  },
  main = 'ufo',
  init = function()
    vim.o.foldenable = true
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99

    -- Fold symbols
    -- vim.o.foldcolumn = '1'
    -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  end,
  keys = {
    {
      'zR',
      function()
        require('ufo').openAllFolds()
      end,
      desc = 'UFO: Open all folds',
    },
    {
      'zM',
      function()
        require('ufo').closeAllFolds()
      end,
      desc = 'UFO: Close all folds',
    },
    {
      'zn',
      goNextClosedAndPeek,
      desc = 'UFO: Go to next closed and peek',
    },
    {
      'zp',
      goPreviousClosedAndPeek,
      desc = 'UFO: Go to previous closed and peek',
    },
  },
}
