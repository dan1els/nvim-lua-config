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


require('toggleterm').setup()


local bufferline = require("bufferline")
bufferline.setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "number",
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
              or (e == "warning" and " " or "" )
            s = s .. n .. sym
          end
          return s
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Tree",
                text_align = "center",
                separator = true,
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        separator_style = "thick",
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
    }
}
