require("core.options")
require("core.keymaps")

-- plugin list
require("plugins")

-- core (load immediately)
require("plugins.mason")
require("plugins.lsp")
require("plugins.blink")
require("plugins.conform")
require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.fzf")
require("plugins.autopairs")
require("plugins.lualine")
require("plugins.whichkey")
require("plugins.gitsigns")

-- =========================
-- FILETYPE LAZY LOADING
-- =========================

-- Laravel + Tailwind (only when needed)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "php", "blade" },
  callback = function()
    require("plugins.laravel")
    require("plugins.tailwind")
  end,
})

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    require("plugins.markdown")
  end,
})

-- Rust
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function()
    require("plugins.rust")
  end,
})

-- =========================
-- COMMAND / KEYMAP LAZY LOAD
-- =========================

vim.keymap.set("n", "<leader>e", function()
  require("plugins.neotree")
  vim.cmd("Neotree toggle")
end)

vim.keymap.set("n", "<leader>gg", function()
  require("plugins.lazygit")
  vim.cmd("LazyGit")
end)

vim.keymap.set("n", "<leader>xx", function()
  require("plugins.trouble")
  vim.cmd("Trouble diagnostics toggle")
end)

vim.keymap.set("n", "<leader>sr", function()
  require("plugins.grug")
  vim.cmd("GrugFar")
end)

vim.keymap.set("n", "<C-\\>", function()
  require("plugins.toggleterm")
  vim.cmd("ToggleTerm")
end, { desc = "Toggle Terminal" })

-- =========================
-- DEFERRED (NON-CRITICAL UI)
-- =========================

vim.defer_fn(function()
  pcall(require, "plugins.neoscroll")
  pcall(require, "plugins.symbols-usage")
  pcall(require, "plugins.flash")
  pcall(require, "plugins.comment")
  pcall(require, "plugins.dashboard")
end, 100)
