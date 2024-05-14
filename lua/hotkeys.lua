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

-- Toggleterm
wk.register({
    t = {
        name = "Terminal",
        ["tb"] = {'<Cmd>ToggleTerm<CR>', "Toogle bottom"},
        ["tw"] = {'<Cmd>ToggleTerm direction=float<CR>', "Toggle float"},
        ["tr"] = {'<Cmd>ToggleTerm direction=vertical size=90<CR>', "Toggle right"},
        ["tt"] = {'<Cmd>ToggleTerm direction=tab<CR>', "Toggle tab"},
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
--jukit
wk.register({
    ["<cr>"] = {'<cmd>call jukit#send#line()<cr>', "Send line to repl"},
    ["np"] = {'<cmd>call jukit#convert#notebook_convert(g:jukit_notebook_viewer)<cr>', 'Convert notebook'},
    ["os"] = {'<cmd>call jukit#splits#output()<cr>', 'Open REPL'},
    ["oS"] = {'<cmd>call jukit#splits#close_output_split()<cr>', 'Close REPL'},
    -- cells
    ["cd"] = {'<cmd>call jukit#cells#delete()<cr>', 'Delete cell'},
    ["co"] = {'<cmd>call jukit#cells#create_below(0)<cr>', 'New code cell below'},
    ["cO"] = {'<cmd>call jukit#cells#create_above(0)<cr>', 'New code cell above'},
    ["ct"] = {'<cmd>call jukit#cells#create_below(1)<cr>', 'New text cell below'},
    ["cT"] = {'<cmd>call jukit#cells#create_above(1)<cr>', 'New text cell above'},
    ["<space>"] = {'<cmd>call jukit#send#section(0)<cr>', 'Send section'},
    ["sb"] = {'<cmd>call jukit#send#until_current_section()<cr>', 'Send all before current'},
    ["sa"] = {'<cmd>call jukit#send#all()<cr>', 'Send all'},
    -- nav
    ["j"] = {'<cmd>call jukit#cells#jump_to_next_cell()<cr>',  'Next cell'},
    ["k"] = {'<cmd>call jukit#cells#jump_to_previous_cell()<cr>', 'Previous cell'},
}, {
    prefix = "<leader>",
    noremap = true,
    mode = "n",
})
wk.register({
    ["<cr>"] = {'<esc><cmd>call jukit#send#selection()<cr>', 'Send selection'},
}, {
    prefix = "<leader>",
    mode = "v",
})
