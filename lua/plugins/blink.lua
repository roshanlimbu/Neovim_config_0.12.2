local cmp = require("blink.cmp")
local autopairs = require("nvim-autopairs")

pcall(require, "blink.compat")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippets = {
    preset = "luasnip",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer", "laravel" },
    providers = {
      laravel = {
        name = "laravel",
        module = "blink.compat.source",
        score_offset = 100,
      },
    },
  },

  keymap = {
    ["<CR>"] = {
      function(cmp)
        if cmp.is_visible() then
          return cmp.accept()
        else
          return autopairs.autopairs_cr()
        end
      end,
      "fallback",
    },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
  },

  completion = {
    menu = {
      auto_show = true,
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },

  signature = {
    enabled = true,
  },
})
