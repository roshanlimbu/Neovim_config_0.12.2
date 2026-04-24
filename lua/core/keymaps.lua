local map = vim.keymap.set

-- splits
map("n", "vs", "<cmd>vsplit<cr>", { desc = "Split vertically" })
map("n", "ss", "<cmd>split<cr>", { desc = "Split horizontally" })

-- select all
map("n", "<leader>9", "ggVG", { desc = "Select All" })

-- delete marks
map("n", "dm", "<cmd>delm!<cr>", { desc = "Delete all marks" })

-- comment helpers
map("n", "yc", "yygccp", { remap = true })
map("v", "<leader>C", "ygvgc`>p", { remap = true, desc = "Copy to comment above" })

-- format
map("n", "<leader>7", function()
  vim.lsp.buf.format()
end, { desc = "Format file" })

-- better j/k
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- resize
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==")
map("n", "<A-k>", "<cmd>m .-2<cr>==")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>")
map("n", "<S-l>", "<cmd>bnext<cr>")
map("n", "[b", "<cmd>bprevious<cr>")
map("n", "]b", "<cmd>bnext<cr>")
map("n", "<leader>bb", "<cmd>e #<cr>")

-- delete buffer (no snacks)
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })

-- clear search
map({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>")

-- search navigation
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true })

-- undo breakpoints
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>")

-- indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- comment helpers
map("n", "gco", "o<Esc>gcc", { remap = true })
map("n", "gcO", "O<Esc>gcc", { remap = true })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>")

-- quickfix
map("n", "<leader>xq", "<cmd>copen<cr>")
map("n", "<leader>xl", "<cmd>lopen<cr>")
map("n", "]q", "<cmd>cnext<cr>")
map("n", "[q", "<cmd>cprev<cr>")

-- diagnostics
map("n", "<leader>cd", vim.diagnostic.open_float)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "[d", vim.diagnostic.goto_prev)

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>")

-- window splits
map("n", "<leader>-", "<C-W>s")
map("n", "<leader>|", "<C-W>v")
map("n", "<leader>wd", "<C-W>c")

-- tabs
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>")
map("n", "<leader><tab>d", "<cmd>tabclose<cr>")
map("n", "<leader><tab>]", "<cmd>tabnext<cr>")
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>")
