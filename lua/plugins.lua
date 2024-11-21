-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --use "github/copilot.vim"

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }
  
  use "echasnovski/mini.icons"

  use "folke/neodev.nvim"
  use { "nvim-neotest/nvim-nio" }

  -- use 'tanvirtin/monokai.nvim' -- theme monokai
 --  use 'doums/darcula' -- jetbrains like theme
  use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }

  use { "catppuccin/nvim", as = "catppuccin" }

  use "akinsho/toggleterm.nvim"


  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  use {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end, -- indents
  }


  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'nvim-treesitter/nvim-treesitter-context'
  use {'nvim-treesitter/playground'}

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    requires = { {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'} }
  }

  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'dawsers/telescope-file-history.nvim'


  use 'nicwest/vim-camelsnek' -- case change

  use {
    'neovim/nvim-lspconfig',
  }

  -- Java lsp (jdtls)  

  use 'mfussenegger/nvim-jdtls'

  use 'mfussenegger/nvim-dap' -- de bu ger
  use 'mfussenegger/nvim-dap-python'
  use 'rcarriga/nvim-dap-ui'

  -- jdtls backend stuff

  use {
    'eclipse/eclipse.jdt.ls', tag = 'v1.38.0',
     run = './mvnw clean install -DskipTests=true'
  }

  -- jdtls extensions (fix java.lua when doing version up)
  use {
    'microsoft/java-debug', run = './mvnw clean install -DskipTests'
  }

  use {
    'microsoft/vscode-java-test', run = 'npm install && npm run build-plugin'
  }

  use 'simonhicks/stacktrace.vim'

  use 'Yggdroot/indentLine'

  use 'mhartington/formatter.nvim'

  use 'chaoren/vim-wordmotion' -- useful camelcase motion

  use 'thinca/vim-qfreplace'

  use 'vim-test/vim-test'

  use 'Iron-E/nvim-libmodal'
  use 'Iron-E/nvim-tabmode'

  use 'j-hui/fidget.nvim'

  use 'MunifTanjim/nui.nvim'

  use "linux-cultist/venv-selector.nvim"

  use 'averms/black-nvim'

  -- jupyter
  -- use 'goerz/jupytext.vim'

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
      end
  }
  
  -- git
  use "sindrets/diffview.nvim"
  use "mhinz/vim-signify"
  use 'f-person/git-blame.nvim'

  -- code completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'rcarriga/cmp-dap'

  -- snippets
  use({
    "L3MON4D3/LuaSnip",
    requires = { "rafamadriz/friendly-snippets" },
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })
  use 'saadparwaiz1/cmp_luasnip'


  -- kotlin
  use({
    "fwcd/kotlin-language-server",
    run = "./gradlew :server:installDist"
  })
  
  use({
    "fwcd/kotlin-debug-adapter",
    run = "./gradlew :adapter:installDist"
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'towolf/vim-helm'

  use {
    "supermaven-inc/supermaven-nvim",
  }

  use {
    "harrisoncramer/gitlab.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
    },
    build = function()
      require("gitlab.server").build()
    end,
    branch = "develop",
    config = function()
      require("diffview") -- We require some global state from diffview
      local gitlab = require("gitlab")
      gitlab.setup()
    end,
  }

  use 'stefandtw/quickfix-reflector.vim'

end)

