local fn = vim.fn

local luasnip = require('luasnip')
local s, sn   = luasnip.snippet, luasnip.snippet_node
local t, i, d = luasnip.text_node, luasnip.insert_node, luasnip.dynamic_node

luasnip.config.setup { history = true }
luasnip.filetype_extend('all', {'global'})
require('luasnip.loaders.from_vscode').lazy_load() -- loads default paths
require('luasnip.loaders.from_vscode').load({
  paths = { '~/.config/nvim/snippets' },
})

local function clipboad_oneline_node()
  local clipboard, _ = fn.getreg('+'):gsub('\n', ' ')
  return clipboard
end

local luasnip_clipboard = function()
  return sn(nil, i(1, clipboad_oneline_node()))
end

local function uuid()
  local id, _ = vim.fn.system('uuidgen'):gsub('\n', '')
  return id
end

luasnip.add_snippets('global', {
  s({
    trig = 'uuid',
    name = 'UUID',
    dscr = 'Generate a unique UUID'
  }, {
      d(1, function() return sn(nil, i(1, uuid())) end)
    })
})
luasnip.add_snippets('markdown', {
  s({
    trig = 'link',
    name = 'hyperlink',
    dscr = 'Hyperlink with the content in the clipboard'
  }, {
      t '[', i(1, 'text'), t ']',
      t '(', d(2, luasnip_clipboard), t ') ',
    })
})
