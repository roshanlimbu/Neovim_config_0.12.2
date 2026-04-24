local capabilities = require("blink.cmp").get_lsp_capabilities()

-- =========================
-- LSP SERVERS
-- =========================

-- lua 
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})

-- typescript
-- vim.lsp.config("ts_ls", {
--   capabilities = capabilities,
--   settings = {
--     javascript = {
--       validate = true,
--       suggest = {
--         completeFunctionCalls = true,
--       },
--     },
--     typescript = {
--       validate = true,
--       suggest = {
--         completeFunctionCalls = true,
--       },
--     },
--   },
-- })

vim.lsp.config("vtsls", {
  capabilities = capabilities,
  settings = {
    -- vtsls specific settings
    vtsls = {
      enable = true,
    },
  },
})

-- eslint
vim.lsp.config("eslint", {
  capabilities = capabilities,
})

-- intelephense
vim.lsp.config("intelephense", {
  capabilities = capabilities,
  settings = {
    intelephense = {
      diagnostics = {
        undefinedMethods = false,
      },
    },
  },
})

-- tailwindcss
vim.lsp.config("tailwindcss", {
  capabilities = capabilities,
})


-- Enable servers
vim.lsp.enable({
  "lua_ls",
  "eslint",
  "intelephense",
  "tailwindcss",
  "vtsls",
})

-- =========================
-- DIAGNOSTICS (LazyVim style)
-- =========================

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 4,
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
})

-- Diagnostic icons (like LazyVim)
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    numhl = "",
  })
end

-- =========================
-- KEYMAPS (on LSP attach)
-- =========================

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)


    -- smooth scroll
    local ok, navic = pcall(require, "nvim-navic")
    if ok then
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client.server_capabilities.documentSymbolProvider then
        navic.attach(client, event.buf)
      end
    end

    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, {
        buffer = event.buf,
        desc = desc,
      })
    end

    map("gd", vim.lsp.buf.definition, "Go to Definition")
    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
    map("gr", vim.lsp.buf.references, "References")
    map("gi", vim.lsp.buf.implementation, "Implementation")
    map("K", vim.lsp.buf.hover, "Hover")
    -- map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("<leader>ca", function()
        vim.lsp.buf.code_action({
            filter = function(action)
                return not action.disabled
            end,
        })
    end, "Code Action")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")

    map("<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
    map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
    map("[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
  end,
})
