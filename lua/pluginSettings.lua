-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/'

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
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
  ensure_installed = { "c", "lua", "rust", "java", "kotlin", "yaml", "json" },

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


-- search
require('telescope').setup()
require("telescope").load_extension("ui-select")

vim.g["coq_settings"] = { 
  auto_start = vim.v["true"],
 -- display = { pum = { fast_close = vim.v["false"] } }
} 
require('coq')

require("dapui").setup()

require'formatter'.setup{
  filetype = {
    java = {
      function()
        return {
          exe = 'java',
          args = { '-jar', install_path .. 'google-java-format/core/target/google-java-format-HEAD-SNAPSHOT-all-deps.jar', '-a --skip-reflowing-long-strings', vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    }
  }
}


