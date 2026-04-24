local ok_tw, tw = pcall(require, "tailwind-tools")
if ok_tw then
  tw.setup({
    -- Tell tailwind-tools to use your existing LSP config
    -- Don't let it try to setup lspconfig itself
    lsp = {
      -- Skip automatic LSP setup since you're using vim.lsp.config
      setup = false,
    },
    -- Optional: Configure other tailwind-tools features
    document_color = {
      enabled = true,
    },
    class_sort = {
      enabled = true,
    },
  })
end
