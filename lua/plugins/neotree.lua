vim.pack.add({
    "https://github.com/nvim-neo-tree/neo-tree.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/MunifTanjim/nui.nvim",

    -- Required for choosing split/window
    "https://github.com/s1n7ax/nvim-window-picker",
})

require("neo-tree").setup({
    filesystem = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },

        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
    },

    window = {
      mappings = {
        ["<cr>"] = "open_with_window_picker",
      },
    },
  })

vim.keymap.set(
    "n",
    "<leader>e",
    "<cmd>Neotree toggle<CR>",
    { desc = "Toggle Neo-tree" }
)

vim.keymap.set(
    "n",
    "<leader>E",
    "<cmd>Neotree reveal<CR>",
    { desc = "Reveal current file" }
)
