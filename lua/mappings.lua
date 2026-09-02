require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map('n', '<Leader>tt', require('whitespace-nvim').trim, { desc = "Trim whitespace." })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
