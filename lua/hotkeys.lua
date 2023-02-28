local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<Leader>t', ':NvimTreeFocus<CR>', opts)
map('n', '<Leader>T', ':NvimTreeToggle<CR>', opts)
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
map('n', 'ttb', '<Cmd>ToggleTerm<CR>', opts)
map('n', 'ttw', '<Cmd>ToggleTerm direction=float<CR>', opts)

-- autocomplete
vim.g["lsc_auto_map"] = vim.v["true"]

-- LSP
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- quick fix

-- DAP & DAPUI
map('n', '<leader>dm', '<cmd>lua require("dapui").open()<CR>', opts)
map('n', '<leader>dmc', '<cmd>lua require("dapui").close()<CR>', opts)

-- camelCase motion
vim.g.wordmotion_prefix = '<leader>'
vim.keymap.set('i', '<S-Left>', '<C-o><Plug>WordMotion_b', opts)
vim.keymap.set('i', '<S-Right>', '<C-o><Plug>WordMotion_w', opts)
