-- autocomplete
vim.g["lsc_auto_map"] = vim.v["true"]

local wk = require("which-key")

-- tree
wk.add({
    { "<leader>t", group = "Tree" },
    { "<leader>tF", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Find file toggle" },
    { "<leader>tT", "<cmd>NvimTreeToggle<cr>", desc = "Toggle" },
    { "<leader>tf", "<cmd>NvimTreeFindFile<cr>", desc = "Find file" },
    { "<leader>tt", "<cmd>NvimTreeFocus<cr>", desc = "Focus" },
})

-- buffers
wk.add({
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    { "<S-W>", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close all other tabs" },
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
})
-- ttagbar
wk.add({
    { "<S-M>", "<Cmd>TagbarToggle<CR>", desc = "Tagbar" },
})

local builtin = require('telescope.builtin')
-- Telescope files
wk.add({
    { "<leader>f", group = "Telescope files" },
    { "<leader>fH", builtin.help_tags, desc = "Help tags" },
    { "<leader>fb", builtin.buffers, desc = "Buffers" },
    { "<leader>ff", builtin.find_files, desc = "Find files" },
    { "<leader>fg", builtin.live_grep, desc = "Live grep" },
    { "<leader>fh", builtin.search_history, desc = "Search history" },
    { "<leader>fq<space>", builtin.quickfix, desc = "Quickfix" },
    { "<leader>fqh", builtin.quickfixhistory, desc = "Quickfix history" },
    { "<leader>fw", builtin.grep_string, desc = "Grep string" },
})

-- Telescope LSP
wk.add({
    { "<leader>l", group = "Telescope LSP" },
    { "<leader>ld", builtin.lsp_document_symbols, desc = "Document symbols" },
    { "<leader>lf", builtin.diagnostics, desc = "Diagnostics" },
    { "<leader>lr", builtin.lsp_references, desc = "References" },
    { "<leader>lw", builtin.lsp_dynamic_workspace_symbols, desc = "Workspace symbols" },
})
-- Telescope git
wk.add({
    { "<leader>g", group = "Telescope git" },
    { "<leader>gH", builtin.git_commits, desc = "Commits" },
    { "<leader>gb", builtin.git_branches, desc = "Branches" },
    { "<leader>gh", builtin.git_bcommits, desc = "B Commits" },
    { "<leader>gi", builtin.git_stash, desc = "Stash" },
    { "<leader>gs", builtin.git_status, desc = "Status" },
})

-- Telescope history
wk.add({
    { "<leader>h", group = "Telescope history" },
    { "<leader>hb", "<cmd>Telescope file_history backup<cr>", desc = "Backup file" },
    { "<leader>hf", "<cmd>Telescope file_history files<cr>", desc = "Files" },
    { "<leader>hh", "<cmd>Telescope file_history history<cr>", desc = "File history" },
    { "<leader>hl", "<cmd>Telescope file_history log<cr>", desc = "File history log" },
    { "<leader>hq", "<cmd>Telescope file_history query<cr>", desc = "Query" },
})

-- Telescope project
wk.add({
    { "<leader>P", "<cmd>Telescope projects<cr>", desc = "Projects" },
})

-- Toggleterm
wk.add({
    { "t", group = "Terminal" },
    { "ttb", "<Cmd>ToggleTerm<CR>", desc = "Toogle bottom" },
    { "ttr", "<Cmd>ToggleTerm direction=vertical size=90<CR>", desc = "Toggle right" },
    { "ttt", "<Cmd>ToggleTerm direction=tab<CR>", desc = "Toggle tab" },
    { "ttw", "<Cmd>ToggleTerm direction=float<CR>", desc = "Toggle float" },
})

-- LSP
wk.add({
    { "t", group = "neotest" },
    { "tO", '<cmd>lua require("neotest").summary.toggle()<cr>', desc = "Toggle summary" },
    { "tP", '<cmd>lua require("neotest").output_panel.toggle()<cr>', desc = "Toggle output panel" },
    { "tR", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = "Run tests in file" },
    { "td", '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', desc = "Debug test" },
    { "to", '<cmd>lua require("neotest").output.open()<cr>', desc = "Open output" },
    { "tr", '<cmd>lua require("neotest").run.run()<cr>', desc = "Run tests" },
    { "ts", '<cmd>lua require("neotest").run.stop()<cr>', desc = "Stop test" },
})

-- neotest
wk.add({
    { "<space>", group = "language/lsp" },
    { "<space><bs>", vim.diagnostic.goto_prev, desc = "prev issue" },
    { "<space><space>", vim.diagnostic.goto_next, desc = "next issue" },
    { "<space>D", vim.lsp.buf.type_definition, desc = "type definition" },
    { "<space>R", "<cmd>Telescope lsp_references<cr>", desc = "references" },
    { "<space>a", vim.lsp.buf.code_action, desc = "code action" },
    { "<space>e", vim.diagnostic.open_float, desc = "diagnostics" },
    { "<space>i", vim.lsp.buf.implementation, desc = "implementation" },
    { "<space>r", vim.lsp.buf.rename, desc = "rename" },
    { "<space>s", vim.lsp.buf.signature_help, desc = "signature help" },
})

-- Formatter
wk.add({
    { "<S-f>", "<cmd>Format<cr>", desc = "format" },
})

