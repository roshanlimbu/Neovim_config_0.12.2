require("lualine").setup({
    options = {
        theme = "tokyonight",
        globalstatus = true,

        -- separators like your screenshot
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
    },

    sections = {
        -- mode (lowercase like screenshot)
        lualine_a = {
            {
                "mode",
                fmt = function(str)
                    return str:lower()
                end,
            },
        },

        -- git branch
        lualine_b = { "branch" },

        -- diff + diagnostics + filename
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
                path = 1, -- relative path
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

        -- encoding + filetype
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

        -- progress
        lualine_y = { "progress" },

        -- cursor position
        lualine_z = { "location" },
    },
})
