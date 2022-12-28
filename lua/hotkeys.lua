local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<Leader>t', ':NvimTreeFocus<CR>', opts)
map('n', '<Leader>tf', ':NvimTreeFindFile<CR>', opts)
map('n', '<Leader>tF', ':NvimTreeFindFileToggle<CR>', opts)


-- Tabs
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<S-W>', '<Cmd>BufferClose<CR>', opts)

-- Tagbar
map('n', '<S-M>', '<Cmd>TagbarToggle<CR>', opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Toggleterm
map('n', '<leader>tt', '<Cmd>ToggleTerm<CR>', opts)
map('n', '<leader>tT', '<Cmd>ToggleTerm direction=float<CR>', opts)

-- coc
map('n', 'gi', '<Plug>(coc-implementation)', opts)
map('n', 'gd', '<Plug>(coc-definition)', opts)
map('n', 'gy', '<Plug>(coc-type-definition)', opts)
map('n', 'gr', '<Plug>(coc-references)', opts)
map('n', 'qf', '<Plug>(coc-fix-current)', opts)

