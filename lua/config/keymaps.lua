local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- delete a word backwards
keymap("n", "dw", 'vb"_d', opts)

-- select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- new tab
keymap("n", "te", ":tabedit<Return>", opts)
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "<s-tab>", ":tabprev<Return>", opts)

-- split
keymap("n", "ss", ":split<Return>", opts)
keymap("n", "vs", ":vsplit<Return>", opts)

-- resize window
keymap("n", "<left>", "<C-w><", opts)
keymap("n", "<right>", "<C-w>>", opts)
keymap("n", "<up>", "<C-w>+", opts)
keymap("n", "<down>", "<C-w>-", opts)

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- better navigation terminal
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", {silent = true})
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", {silent = true})
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", {silent = true})
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", {silent = true})

-- visual block
-- move text
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)

-- open lazy
keymap("n", "<leader>l", ":Lazy<CR>", opts)
