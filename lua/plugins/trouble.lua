local ok, trouble = pcall(require, "trouble")
if not ok then return end

trouble.setup({})

local map = vim.keymap.set

-- Diagnostics
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })

-- Quickfix & location list
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" })

-- LSP
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions/Refs" })

-- navigation
map("n", "]q", function()
  require("trouble").next({ skip_groups = true, jump = true })
end)

map("n", "[q", function()
  require("trouble").prev({ skip_groups = true, jump = true })
end)
