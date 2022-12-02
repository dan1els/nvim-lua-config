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

  use 'tanvirtin/monokai.nvim' -- theme
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()  -- embedded terminal
    require("toggleterm").setup()
  end}


  use { 
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}   -- tabs
  }

  use {'neoclide/coc.nvim', branch = 'release'}   -- autocompletion
  
  use {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup {} end, -- indents
  }
end)

