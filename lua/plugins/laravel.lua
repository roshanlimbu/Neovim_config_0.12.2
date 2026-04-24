local ok, laravel = pcall(require, "laravel")
if not ok then
  return
end

laravel.setup({
  features = {
    pickers = {
      enabled = true,
    },
  },
})

vim.keymap.set("n", "<leader>la", "<cmd>Laravel artisan<cr>", { desc = "Laravel Artisan" })
vim.keymap.set("n", "<leader>lr", "<cmd>Laravel routes<cr>", { desc = "Laravel Routes" })
vim.keymap.set("n", "<leader>lm", "<cmd>Laravel related<cr>", { desc = "Laravel Related" })
vim.keymap.set("n", "<leader>lv", "<cmd>Laravel view_finder<cr>", { desc = "Laravel View Finder" })

-- gd override for PHP files: jump to Laravel view/resource when cursor is on one,
-- otherwise fall through to normal LSP definition
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function(event)
    vim.keymap.set("n", "gd", function()
      local laravel_ok, l = pcall(require, "laravel")
      if laravel_ok and l.app then
        local gf_ok, is_resource = pcall(function()
          return l.app:make("gf"):cursor_on_resource()
        end)
        if gf_ok and is_resource then
          vim.cmd("Laravel gf")
          return
        end
      end
      -- cursor is NOT on a Laravel resource string → use LSP gd normally
      vim.lsp.buf.definition()
    end, { buffer = event.buf, desc = "Go to Definition / Laravel View" })
  end,
})

-- gf: go to Laravel view/resource under cursor (falls back to built-in gf)
vim.keymap.set("n", "gf", function()
  local laravel = require("laravel")
  local ok, is_resource = pcall(function()
    return laravel.app:make("gf"):cursor_on_resource()
  end)
  if ok and is_resource then
    vim.cmd("Laravel gf")
  else
    vim.cmd("normal! gf")
  end
end, { noremap = true, desc = "Laravel: Go To Resource" })
