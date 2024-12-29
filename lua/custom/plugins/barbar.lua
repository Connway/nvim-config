return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  opts = {},
  config = function()
    -- Next and prev buffers
    vim.keymap.set('n', '<C-,>', '<Cmd>BufferPrevious<CR>', { silent = true })
    vim.keymap.set('n', '<C-.>', '<Cmd>BufferNext<CR>', { silent = true })
    vim.keymap.set('n', '<C-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true })
    vim.keymap.set('n', '<C->>', '<Cmd>BufferMoveNext<CR>', { silent = true })
    vim.keymap.set('n', '<C-c>', '<Cmd>BufferClose<CR>', { silent = true })
    vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', { silent = true })
    vim.keymap.set('n', '<A-,>', '<Cmd>BufferMovePrevious<CR>', { silent = true })
    vim.keymap.set('n', '<A-.>', '<Cmd>BufferMoveNext<CR>', { silent = true })

    vim.keymap.set('n', '<Space>bn', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = 'Order [b]uffers by [n]umber.', silent = true })
    vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', { desc = 'Order [b]uffers by [d]irectory.', silent = true })
    vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', { desc = 'Order [b]uffers by [l]anguage.', silent = true })
    vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { desc = 'Order [b]uffers by [w]indow id.', silent = true })
  end,
}
