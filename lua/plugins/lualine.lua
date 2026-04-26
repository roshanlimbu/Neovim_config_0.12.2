local colors = {
  bg     = "#1a1b26",
  fg     = "#c0caf5",

  -- purple = "#bb9af7",
  purple = "#a78bfa",
  blue   = "#7aa2f7",
  green  = "#9ece6a",
  red    = "#f7768e",
  yellow = "#e0af68",

  grey   = "#3b4261",
  black  = "#16161e",
  white  = "#ffffff",
}

local my_theme = {
  normal = {
    a = { bg = colors.purple, fg = colors.black, gui = "bold" }, -- 👈 purple mode
    b = { bg = colors.grey, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },

  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = "bold" },
  },

  visual = {
    a = { bg = "#9d7cd8", fg = colors.black, gui = "bold" }, -- softer purple
  },

  replace = {
    a = { bg = colors.red, fg = colors.black, gui = "bold" },
  },

  inactive = {
    a = { bg = colors.bg, fg = colors.grey },
    b = { bg = colors.bg, fg = colors.grey },
    c = { bg = colors.bg, fg = colors.grey },
  },
}

require("lualine").setup({
  options = {
    theme = my_theme,
    globalstatus = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "│", right = "│" }
  },

  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return str:lower()
        end,
      },
    },

    lualine_b = { "branch" },

    lualine_c = {
      {
        "diff",
        symbols = { added = "+", modified = "~", removed = "-" },
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
      },
      {
        "filename",
        path = 1,
        symbols = {
          modified = " [+]",
          readonly = " ",
          unnamed = "[No Name]",
        },
      },
      {
        function()
          local ok, navic = pcall(require, "nvim-navic")
          if ok and navic.is_available() then
            return navic.get_location()
          end
          return ""
        end,
        cond = function()
          local ok, navic = pcall(require, "nvim-navic")
          return ok and navic.is_available()
        end,
      },
    },

    lualine_x = {
      "encoding",
      {
        "fileformat",
        symbols = {
          unix = "",
          dos = "",
          mac = "",
        },
      },
      "filetype",
    },

    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
