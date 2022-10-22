local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<Leader>t', ':NvimTreeFocus<CR>', opts)


-- Tabs
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<S-W>', '<Cmd>BufferClose<CR>', opts)
