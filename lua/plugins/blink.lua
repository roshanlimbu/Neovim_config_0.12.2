require("blink.cmp").setup({
  snippets = {
    preset = "luasnip",
  },
  keymap = {
    preset = "enter",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  completion = {
    menu = {
      auto_show = true,
    },
    trigger = {
      show_on_keyword = true,
      show_on_trigger_character = true,
      show_on_insert_on_trigger_character = true,
    },
  },
})
