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
vim.keymap.set('n', '<leader>fH', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fh', builtin.search_history, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fqh', builtin.quickfixhistory, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
-- Telescope LSP
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>lw', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>ld', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>lf', builtin.diagnostics, {})
-- Telescope git
vim.keymap.set('n', '<leader>gH', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gh', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gf', builtin.git_status, {})
vim.keymap.set('n', '<leader>gs', builtin.git_stash, {})

vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})


-- Toggleterm
map('n', 'ttb', '<Cmd>ToggleTerm<CR>', opts)
map('n', 'ttw', '<Cmd>ToggleTerm direction=float<CR>', opts)
vim.keymap.set('n', '<leader>g', '<cmd>TermExec cmd="lazygit" direction=float<CR>', opts)


-- autocomplete
vim.g["lsc_auto_map"] = vim.v["true"]

-- LSP
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- quick fix

-- DAP & DAPUI
--map('n', '<leader>dm', '<cmd>lua require("dapui").open()<CR>', opts)
--map('n', '<leader>dmc', '<cmd>lua require("dapui").close()<CR>', opts)

-- camelCase motion
vim.g.wordmotion_prefix = '<leader>'
vim.keymap.set('i', '<S-Left>', '<C-o><Plug>WordMotion_b', opts)
vim.keymap.set('i', '<S-Right>', '<C-o><Plug>WordMotion_w', opts)

-- lazygit
-- ChatGpt
local chatgpt = require("chatgpt")
require("which-key").register({
    p = {
        name = "ChatGPT",
        e = {
            function()
                chatgpt.edit_with_instructions()
            end,
            "Edit with instructions",
        },
    },
}, {
    prefix = "<leader>",
    mode = "v",
})
