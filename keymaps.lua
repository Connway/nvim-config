-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Next and prev buffers
vim.keymap.set("n", "<C-,>", "<Cmd>BufferPrevious<CR>", { silent = true })
vim.keymap.set("n", "<C-.>", "<Cmd>BufferNext<CR>", { silent = true })
vim.keymap.set("n", "<C-<>", "<Cmd>BufferMovePrevious<CR>", { silent = true })
vim.keymap.set("n", "<C->>", "<Cmd>BufferMoveNext<CR>", { silent = true })
vim.keymap.set("n", "<C-c>", "<Cmd>BufferClose<CR>", { silent = true })
vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", { silent = true })

vim.keymap.set('n', '<Space>bn', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = "Order [b]uffers by [n]umber.", silent = true })
vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', { desc = "Order [b]uffers by [d]irectory.", silent = true })
vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', { desc = "Order [b]uffers by [l]anguage.", silent = true })
vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { desc = "Order [b]uffers by [w]indow id.", silent = true })

-- Trim whitespace
vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

vim.keymap.set("n", "<leader>rr", function() vim.wo.relativenumber = not vim.wo.relativenumber end, { desc = "Toggle [r]elative numbers.", silent = true })

vim.keymap.set("n", "<C-e>", "<Cmd>Ouroboros<CR>")
