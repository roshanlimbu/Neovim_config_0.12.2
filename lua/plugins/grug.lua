local ok, grug = pcall(require, "grug-far")
if not ok then return end

grug.setup({})



vim.keymap.set("n", "<leader>sr", function()
  require("grug-far").open()
end, { desc = "Search & Replace (grug-far)" })
