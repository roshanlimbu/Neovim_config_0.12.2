local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  return
end

gitsigns.setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
  },
  current_line_blame = false,
})

vim.keymap.set("n", "]h", function()
  require("gitsigns").next_hunk()
end, { desc = "Next Git Hunk" })

vim.keymap.set("n", "[h", function()
  require("gitsigns").prev_hunk()
end, { desc = "Previous Git Hunk" })

vim.keymap.set("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview Git Hunk" })

vim.keymap.set("n", "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "Git Blame Line" })
