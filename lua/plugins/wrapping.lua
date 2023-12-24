return {
  "andrewferrier/wrapping.nvim",
  lazy = false,
  opts = {
    auto_set_mode_filetype_allowlist = {
      "asciidoc",
      "gitcommit",
      "latex",
      "mail",
      "markdown",
      "rst",
      "tex",
      "text",
    },
  },
  config = function(_, opts)
    require('wrapping').setup(opts)
  end
}
