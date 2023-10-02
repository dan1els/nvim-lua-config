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

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use "folke/neodev.nvim"

  -- use 'tanvirtin/monokai.nvim' -- theme monokai
 --  use 'doums/darcula' -- jetbrains like theme
  use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }

  use "akinsho/toggleterm.nvim"


  use { 
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}   -- tabs
  }
  
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
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'} }
  }

  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-dap.nvim'

  use 'nicwest/vim-camelsnek' -- case change

  use {
    'ms-jpq/coq_nvim',
  }

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
    'eclipse/eclipse.jdt.ls', tag = 'v1.21.0',
     run = 'mvn clean install -DskipTests=true'
  }

  -- jdtls extensions
  use {
    'microsoft/java-debug',
     run = 'mvn clean install'
  }

  use {
    'microsoft/vscode-java-test', tag = '0.38.1',
    run = 'npm install && npm run build-plugin'
  }

  use 'simonhicks/stacktrace.vim'

  use 'Yggdroot/indentLine'
  
  use 'mhartington/formatter.nvim'
  use {
    'google/google-java-format',
     run = 'mvn clean install -DskipTests=true'
  }

  use 'chaoren/vim-wordmotion' -- useful camelcase motion

  use 'thinca/vim-qfreplace'

  use 'vim-test/vim-test'

  use 'Iron-E/nvim-libmodal'
  use 'Iron-E/nvim-tabmode'

  use 'j-hui/fidget.nvim'

  use 'MunifTanjim/nui.nvim'

  use({
  "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

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

  use "linux-cultist/venv-selector.nvim"

  use 'averms/black-nvim'

  -- mac os related stuff to keyboard layout switcher
  -- for oothers check this https://github.com/ivanesmantovich/xkbswitch.nvim
  use {
    'vovkasm/input-source-switcher',
    run = 'mkdir build && cd build && cmake .. && make && make install'
  }

  use {
    'ivanesmantovich/xkbswitch.nvim',
    requires = {
      'vovkasm/input-source-switcher'
    }
  }

end)

