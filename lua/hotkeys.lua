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
    ["<Tab>"] = { "<Cmd>BufferNext<CR>", "Next tab" },
    ["<S-Tab>"] = { "<Cmd>BufferPrevious<CR>", "Prev tab" },
    ["<S-W>"] = { "<Cmd>BufferClose<CR>", "Close tab" },
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
        i = { builtin.git_status, "Status"},
        i = { builtin.git_stash, "Stash"},
    }}, {
        prefix = "<leader>",
        mode = "n",
    })

-- Toggleterm
wk.register({
    t = {
        name = "Terminal",
        ["tb"] = {'<Cmd>ToggleTerm<CR>', "Toogle bottom"},
        ["tw"] = {'<Cmd>ToggleTerm direction=float<CR>', "Toggle float"}
    }
})

-- ChatGpt
wk.register({
    p = {
        name = "ChatGPT",
        e = {
            function()
                local chatgpt = require("chatgpt")
                chatgpt.edit_with_instructions()
            end,
            "Edit with instructions",
        },
    },
}, {
    prefix = "<leader>",
    mode = "v",
})
-- LSP
wk.register({
    ['<space>'] = {
        name = 'language/lsp',
        r    = { '<cmd>Telescope lsp_references<cr>', 'references' },
        rn    = { vim.lsp.buf.rename, 'rename' },
        D    = { vim.lsp.buf.type_definition, 'type definition' },
        a    = { vim.lsp.buf.code_action, 'code action' },
        e    = { vim.diagnostic.open_float, 'diagnostics' },
        f    = { vim.lsp.buf.format, 'format' },
        i    = { vim.lsp.buf.implementation, 'implementation' },
        s    = { vim.lsp.buf.signature_help, 'signature help' },
        ['<space>'] = { vim.diagnostic.goto_next, 'next issue' },
        ['<bs>'] = { vim.diagnostic.goto_prev, 'prev issue' },
    }
})

-- WordMotion
wk.register({
   ["<S-Left>"] = {'<C-o><Plug>WordMotion_b', "Word prev"}
  }, {
    prefix = "<leader>",
    mode = "i",
})
wk.register({
    ["<S-Right>"] = {'<C-o><Plug>WordMotion_w', "Word next"}
  }, {
    prefix = "<leader>",
    mode = "i",
})

