function P(v)
  print(vim.inspect(v))
  return v
end

function RELOAD(...)
  pcall(require('plenary.reload').reload_module, ...)
end

function R(name)
  RELOAD(name)
  return require(name)
end
