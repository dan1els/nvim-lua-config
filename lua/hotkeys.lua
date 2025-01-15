-- autocomplete
vim.g["lsc_auto_map"] = vim.v["true"]

local wk = require("which-key")

-- tree
wk.register({
    t = {
        name = "Tree",
        t = {"<cmd>NvimTreeFocus<cr>", "Focus"},
        T = {"<cmd>NvimTreeToggle<cr>", "Toggle"},
        f = {"<cmd>NvimTreeFindFile<cr>", "Find file"},
        F = {"<cmd>NvimTreeFindFileToggle<cr>", "Find file toggle"},
    }
}, {
    prefix = "<leader>",
    mode = "n",
})
-- buffers
wk.register({
    ["<Tab>"] = { "<Cmd>BufferLineCycleNext<CR>", "Next tab" },
    ["<S-Tab>"] = { "<Cmd>BufferLineCyclePrev<CR>", "Prev tab" },
    ["<S-W>"] = { "<Cmd>BufferLineCloseOthers<CR>", "Close all other tabs" },
})
-- ttagbar
wk.register({
    ["<S-M>"] = { "<Cmd>TagbarToggle<CR>", "Tagbar" },
})

local builtin = require('telescope.builtin')
-- Telescope files
wk.register({
    f = {
        name = "Telescope files",
        f = { builtin.find_files, "Find files"},
        g = { builtin.live_grep, "Live grep"},
        b = { builtin.buffers, "Buffers"},
        H = { builtin.help_tags, "Help tags"},
        w = { builtin.grep_string, "Grep string"},
        h = { builtin.search_history, "Search history"},
        q = { 
            ["<space>"] = { builtin.quickfix, "Quickfix" },
            h = { builtin.quickfixhistory, "Quickfix history"},
        },
    }}, {
        prefix = "<leader>",
        mode = "n",
    })

-- Telescope LSP
wk.register({
    l = {
        name = "Telescope LSP",
        r = { builtin.lsp_references, "References"},
        w = { builtin.lsp_dynamic_workspace_symbols, "Workspace symbols"},
        d = { builtin.lsp_document_symbols, "Document symbols"},
        f = { builtin.diagnostics, "Diagnostics"},
    }}, {
        prefix = "<leader>",
        mode = "n",
    })
-- Telescope git
wk.register({
    g = {
        name = "Telescope git",
        H = { builtin.git_commits, "Commits"},
        h = { builtin.git_bcommits, "B Commits"},
        b = { builtin.git_branches, "Branches"},
        s = { builtin.git_status, "Status"},
        i = { builtin.git_stash, "Stash"},
    }}, {
        prefix = "<leader>",
        mode = "n",
    })

-- Telescope history
wk.register({
    h = {
        name = "Telescope history",
        b = { '<cmd>Telescope file_history backup<cr>', "Backup file"},
        h = { '<cmd>Telescope file_history history<cr>', "File history"},
        l = { '<cmd>Telescope file_history log<cr>', "File history log"},
        f = { '<cmd>Telescope file_history files<cr>', "Files"},
        q = { '<cmd>Telescope file_history query<cr>', "Query"},
    }}, {
        prefix = "<leader>",
        mode = "n",
    })

-- Telescope project
wk.register({
    P = { '<cmd>Telescope projects<cr>', "Projects"},
    }, {
        prefix = "<leader>",
        mode = "n",
    })

-- Toggleterm
wk.register({
    t = {
        name = "Terminal",
        ["tb"] = {'<Cmd>ToggleTerm<CR>', "Toogle bottom"},
        ["tw"] = {'<Cmd>ToggleTerm direction=float<CR>', "Toggle float"},
        ["tr"] = {'<Cmd>ToggleTerm direction=vertical size=90<CR>', "Toggle right"},
        ["tt"] = {'<Cmd>ToggleTerm direction=tab<CR>', "Toggle tab"},
    }, {
        prefix = "<leader>",
        mode = "n",
    }
})

-- LSP
wk.register({
    t = {
        name = "neotest",
        r = { '<cmd>lua require("neotest").run.run()<cr>', "Run tests" },
        R = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', "Run tests in file" },
        d = { '<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>', "Debug test" },
        s = { '<cmd>lua require("neotest").run.stop()<cr>', "Stop test" },
        o = { '<cmd>lua require("neotest").output.open()<cr>', "Open output" },
        O = { '<cmd>lua require("neotest").summary.toggle()<cr>', "Toggle summary" },
        P = { '<cmd>lua require("neotest").output_panel.toggle()<cr>', "Toggle output panel" },
    }
})

-- neotest
wk.register({
    ['<space>'] = {
        name = 'language/lsp',
        R    = { '<cmd>Telescope lsp_references<cr>', 'references' },
        r    = { vim.lsp.buf.rename, 'rename' },
        D    = { vim.lsp.buf.type_definition, 'type definition' },
        a    = { vim.lsp.buf.code_action, 'code action' },
        e    = { vim.diagnostic.open_float, 'diagnostics' },
        i    = { vim.lsp.buf.implementation, 'implementation' },
        s    = { vim.lsp.buf.signature_help, 'signature help' },
        ['<space>'] = { vim.diagnostic.goto_next, 'next issue' },
        ['<bs>'] = { vim.diagnostic.goto_prev, 'prev issue' },
    }
})

-- Formatter
wk.register({
    ["<S-f>"] = {'<cmd>Format<cr>', 'format'}
})
