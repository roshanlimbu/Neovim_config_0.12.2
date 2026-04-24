local fzf = require("fzf-lua")

fzf.setup({
    grep = {
        rg_opts = "--smart-case",
    },
    winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        border = "rounded",
        preview = {
            layout = "horizontal",
            vertical = "right:50%",
        },
    },
})

fzf.register_ui_select({
    winopts = {
        width = 0.5,
        height = 0.4,
        border = "rounded",
        title = " Code actions ",
        title_pos = "center",
    },
})

-- ===== KEYMAPS (LazyVim style) =====

local map = vim.keymap.set

-- core
map("n", "<leader><space>", fzf.files, { desc = "Find Files (root)" })
map("n", "<leader>/", fzf.live_grep, { desc = "Grep (root)" })
map("n", "<leader>,", fzf.buffers, { desc = "Switch Buffer" })

-- find
map("n", "<leader>ff", fzf.files, { desc = "Find Files" })
map("n", "<leader>fF", function() fzf.files({ cwd = vim.fn.getcwd() }) end, { desc = "Find Files (cwd)" })
map("n", "<leader>fg", fzf.git_files, { desc = "Git Files" })
map("n", "<leader>fr", fzf.oldfiles, { desc = "Recent Files" })
map("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
map("n", "<leader>fB", function() fzf.buffers({ sort_mru = false }) end, { desc = "All Buffers" })

-- git
map("n", "<leader>gc", fzf.git_commits, { desc = "Commits" })
map("n", "<leader>gs", fzf.git_status, { desc = "Git Status" })
map("n", "<leader>gS", fzf.git_stash, { desc = "Git Stash" })

-- search
map("n", "<leader>sb", fzf.lines, { desc = "Buffer Lines" })
map("n", "<leader>sc", fzf.command_history, { desc = "Command History" })
map("n", "<leader>sC", fzf.commands, { desc = "Commands" })
map("n", "<leader>sd", fzf.diagnostics_workspace, { desc = "Diagnostics" })
map("n", "<leader>sD", fzf.diagnostics_document, { desc = "Buffer Diagnostics" })
map("n", "<leader>sg", fzf.live_grep, { desc = "Grep" })
map("n", "<leader>sh", fzf.help_tags, { desc = "Help" })
map("n", "<leader>sk", fzf.keymaps, { desc = "Keymaps" })
map("n", "<leader>sl", fzf.loclist, { desc = "Location List" })
map("n", "<leader>sq", fzf.quickfix, { desc = "Quickfix" })
map("n", "<leader>sr", fzf.resume, { desc = "Resume" })

-- word / visual search
map("n", "<leader>sw", function() fzf.grep_cword() end, { desc = "Word under cursor" })
map("x", "<leader>sw", function() fzf.grep_visual() end, { desc = "Selection" })

-- LSP
map("n", "<leader>ss", fzf.lsp_document_symbols, { desc = "Document Symbols" })
map("n", "<leader>sS", fzf.lsp_live_workspace_symbols, { desc = "Workspace Symbols" })
