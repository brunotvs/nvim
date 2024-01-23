local ftMap = {
  vim = 'indent',
  python = { 'indent' },
  git = '',
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

local function applyFoldsAndThenCloseAllFolds(providerName)
  require('async')(function()
    local bufnr = vim.api.nvim_get_current_buf()
    -- make sure buffer is attached
    require('ufo').attach(bufnr)
    -- getFolds return Promise if providerName == 'lsp'
    local ranges = await(require('ufo').getFolds(bufnr, providerName))
    if not vim.tbl_isempty(ranges) then
      local ok = require('ufo').applyFolds(bufnr, ranges)
      if ok then
        require('ufo').closeAllFolds()
      end
    end
  end)
end

return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async', 'nvim-treesitter/nvim-treesitter' },
  event = 'BufEnter',
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
  init = function()
    vim.o.foldenable = true
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99

    -- Fold symbols
    -- vim.o.foldcolumn = '1'
    -- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  end,
  config = function(_, opts)
    local ufo = require('ufo')
    ufo.setup(opts)
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
      function()
        goNextClosedAndPeek()
      end,
      desc = 'UFO: Go to next closed and peek',
    },
    {
      'zp',
      function()
        goPreviousClosedAndPeek()
      end,
      desc = 'UFO: Go to previous closed and peek',
    },
  },
}
