-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local fn = vim.fn

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- indents
require('guess-indent').setup {
  auto_cmd = true,  -- Set to false to disable automatic execution
  filetype_exclude = {  -- A list of filetypes for which the auto command gets disabled
    "netrw",
    "tutor",
  },
  buftype_exclude = {  -- A list of buffer types for which the auto command gets disabled
    "help",
    "nofile",
    "terminal",
    "prompt",
  },
}

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "java", "kotlin", "yaml", "json", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  indent = { enable = true },

  -- List of parsers to ignore installing (for "all")
    highlight = {
    -- `false` will disable the whole extension
    enable = true,

    additional_vim_regex_highlighting = true
  }
}

-- statusbar
require('lualine').setup()
require('lualineColors')


-- search
require('telescope').setup()
require("telescope").load_extension("ui-select")
require("telescope").load_extension("dap")


require"fidget".setup{}

vim.g["coq_settings"] = { 
  auto_start = vim.v["true"],
  -- display = { pum = { fast_close = vim.v["false"] } }
}
require'coq'


require("chatgpt").setup({
    api_key_cmd = "cat /Users/evgenii/.config/chatgpt"
})

-- auto layout switcher
require('xkbswitch').setup()

require('toggleterm').setup()

-- linters
-- (requires additional software to be installed)
require('lint').linters_by_ft = {
  java = {'checkstyle'},
  python = {'mypy'},
  lua = {'luacheck'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_user_command("TryLint", function()
    require("lint").try_lint()
  end, {}
)
