vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})

local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

treesitter.setup({
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "query",
    "php",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "rust",
    "css",
    "json",
    "bash",
    "markdown",
    "markdown_inline"
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "blade" },
  },

  indent = {
    enable = true,
  },

  endwise = {
    enable = true,
  },
})
