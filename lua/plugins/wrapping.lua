return {
  'andrewferrier/wrapping.nvim',
  config = function()
    require("wrapping").setup({
      auto_enable = true,
      filetype_exclude = {},
      filetype_include = { "markdown", "text" },
    })
  end,
}
