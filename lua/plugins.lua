return {

  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should build as the first plugin in your config.
    config = true,
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  },

  "echasnovski/mini.icons",

  "folke/neodev.nvim",
  "nvim-neotest/nvim-nio",

  -- 'tanvirtin/monokai.nvim' -- theme monokai
 --  'doums/darcula' -- jetbrains like theme
  { "briones-gabriel/darcula-solid.nvim", dependencies = "rktjmp/lush.nvim" },

  { "catppuccin/nvim", as = "catppuccin" },

  "akinsho/toggleterm.nvim",


  {'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},

  {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end, -- indents
  },


  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  'nvim-treesitter/nvim-treesitter-context',
  {'nvim-treesitter/playground'},

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },

  'archibate/lualine-time',

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'} }
  },

  'nvim-telescope/telescope-ui-select.nvim',
  'nvim-telescope/telescope-dap.nvim',
  'dawsers/telescope-file-history.nvim',


  'nicwest/vim-camelsnek', -- case change

  {
    'neovim/nvim-lspconfig',
  },

  -- Java lsp (jdtls)  

  'mfussenegger/nvim-jdtls',

  'mfussenegger/nvim-dap', -- de bu ger
  'mfussenegger/nvim-dap-python',
  'rcarriga/nvim-dap-ui',

  -- jdtls backend stuff

  {
    'eclipse/eclipse.jdt.ls', tag = 'v1.46.1',
     build = './mvnw clean install -DskipTests=true'
  },

  -- jdtls extensions (fix java.lua when doing version up)
  {
    'microsoft/java-debug', build = './mvnw clean install -DskipTests'
  },

  {
    'microsoft/vscode-java-test', build = 'npm install && npm build build-plugin'
  },

  'simonhicks/stacktrace.vim',

  'Yggdroot/indentLine',

  'mhartington/formatter.nvim',

  'chaoren/vim-wordmotion', -- useful camelcase motion

  'thinca/vim-qfreplace',

  'vim-test/vim-test',

  'Iron-E/nvim-libmodal',
  'Iron-E/nvim-tabmode',

  'j-hui/fidget.nvim',

  'MunifTanjim/nui.nvim',

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to the default settings
        -- refer to the configuration section below
      }
      end
  },

  -- git
  "sindrets/diffview.nvim",
  "mhinz/vim-signify",
  'f-person/git-blame.nvim',

  -- code completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'rcarriga/cmp-dap',

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    -- install jsregexp (optional!:).
    build = "make install_jsregexp"
   },

  'saadparwaiz1/cmp_luasnip',


  -- kotlin
  {
    "dan1els/kotlin-language-server",
    branch = "feature/java-21",
    build = "./gradlew :server:installDist"
  },

  {
    "fwcd/kotlin-debug-adapter",
    build = "./gradlew :adapter:installDist"
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  'towolf/vim-helm',

  'stefandtw/quickfix-reflector.vim',

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },

--  'rcasia/neotest-java'
  'weilbith/neotest-gradle',

  {
    "ahmedkhalf/project.nvim",
  },
}
