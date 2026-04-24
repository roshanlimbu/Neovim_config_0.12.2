local wk = require("which-key")

wk.setup({})

wk.add({
  { "<leader>f", group = "find" },
  { "<leader>s", group = "search" },
  { "<leader>g", group = "git" },
  { "<leader>t", group = "terminal" },
  { "<leader>u", group = "ui" },
  { "<leader>e", desc = "Toggle Neo-tree" },
})
