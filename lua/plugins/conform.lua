require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    php = { "pint" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
  },
})
