local lush = require('lush')
local hsl = lush.hsl
local darcula = require('lush_theme.darcula-solid')

local yellow = hsl(58, 78, 73)
local purple = hsl(279, 30, 62)
local orange = hsl(27, 61, 50)

local spec = lush.extends({darcula}).with(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Constant { fg=purple };
    -- new style TS groups
    sym "@type.qualifier" { fg=orange };
    sym "@type.builtin" { fg=orange };
    sym "@attribute" { fg=yellow };
    sym "@variable.builtin" { fg=orange };
    sym "@method.call" {};
  }
end)

_G.customise_colorscheme = function()
  lush(spec)
end


vim.cmd 'set termguicolors'
--vim.api.nvim_command('autocmd VimEnter,ColorScheme * lua customise_colorscheme()')

vim.cmd.colorscheme "catppuccin"

