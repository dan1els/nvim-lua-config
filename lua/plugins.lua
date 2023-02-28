-- This file can be loaded by calling `lua require('plugins')` from your init.vim
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

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()  -- embedded terminal
    require("toggleterm").setup()
  end}


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
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'nvim-telescope/telescope-ui-select.nvim'

  use 'nicwest/vim-camelsnek' -- case change

  use {
    'ms-jpq/coq_nvim',
    commit = '5eddd31bf8a98d1b893b0101047d0bb31ed20c49' -- autocomplete
  }

  -- Java lsp (jdtls)  
   
  use 'mfussenegger/nvim-jdtls'

  use 'mfussenegger/nvim-dap' -- de bu ger
  use 'rcarriga/nvim-dap-ui'

  -- jdtls backend stuff

  use {
    'eclipse/eclipse.jdt.ls', tag = 'v1.19.0',
     run = 'mvn clean install -DskipTests=true'
  }

  -- jdtls extensions
  use {
    'microsoft/java-debug',
     run = 'mvn clean install'
  }

  use {
    'microsoft/vscode-java-test', tag = '0.37.0',
    run = 'npm install && npm run build-plugin'
  }

  use 'Yggdroot/indentLine'
  
  use 'mhartington/formatter.nvim'
  use {
    'google/google-java-format',
     run = 'mvn clean install -DskipTests=true'
  }

  use 'chaoren/vim-wordmotion' -- useful camelcase motion

end)

