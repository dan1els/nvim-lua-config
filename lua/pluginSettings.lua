-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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


local coq = require "coq" -- add this

local jdtls = require('jdtls')
local root_markers = {'gradlew', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local workspace_folder = home .. "/Users/evgenii/.jdtls_workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local config = require('me.lsp.conf').mk_config()
config.settings = {
  java = {
    signatureHelp = { enabled = true };
    contentProvider = { preferred = 'fernflower' };
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*"
      },
      filteredTypes = {
        "com.sun.*",
        "io.micrometer.shaded.*",
        "java.awt.*",
        "jdk.*",
        "sun.*",
      },
    };
    sources = {
      organizeImports = {
        starThreshold = 9999;
        staticStarThreshold = 9999;
      };
    };
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
      },
      hashCodeEquals = {
        useJava7Objects = true,
      },
      useBlocks = true,
    };
    configuration = {
      runtimes = {
        {
          name = "JavaSE-11",
          path = "/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home",
        },
        {
          name = "JavaSE-17",
          path = "/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home",
        },
      }
    };
  };
}
config.cmd = {
  '/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home/bin/java',
  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  '-Dosgi.bundles.defaultStartLevel=4',
  '-Declipse.product=org.eclipse.jdt.ls.core.product',
  '-Dlog.protocol=true',
  '-Dlog.level=ALL',
  '-Xmx4g',
  '--add-modules=ALL-SYSTEM',
  '--add-opens', 'java.base/java.util=ALL-UNNAMED',
  '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  '-jar', vim.fn.glob(home .. '/Users/evgenii/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
  '-configuration', home .. '/Users/evgenii/.local/share/jdtls/config_mac',
  '-data', workspace_folder,
}
config.on_attach = function(client, bufnr)
  require('me.lsp.conf').on_attach(client, bufnr, {
    server_side_fuzzy_completion = true,
  })

  jdtls.setup_dap({hotcodereplace = 'auto'})
  jdtls.setup.add_commands()
  local opts = { silent = true, buffer = bufnr }
  vim.keymap.set('n', "<A-o>", jdtls.organize_imports, opts)
  vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
  vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
  vim.keymap.set('n', "crv", jdtls.extract_variable, opts)
  vim.keymap.set('v', 'crm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
  vim.keymap.set('n', "crc", jdtls.extract_constant, opts)
  local create_command = vim.api.nvim_buf_create_user_command
  create_command(bufnr, 'W', require('me.lsp.ext').remove_unused_imports, {
    nargs = 0,
  })
end
jdtls.start_or_attach(config)
