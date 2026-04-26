vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
require("render-markdown").setup({
  enabled = true,

  heading = {
    enabled = true,
  },

  code = {
    enabled = true,
  },

  bullet = {
    enabled = true,
  },

  checkbox = {
    enabled = true,
  },
})
