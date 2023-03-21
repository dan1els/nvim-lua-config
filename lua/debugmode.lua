local libmodal = require 'libmodal'

local dap, dapui = require("dap"), require("dapui")

local consoleConf = {
  elements = {
    {
      id = "console",
      size = 0.5,
    },
    {
      id = "repl",
      size = 0.5
    }
  },
  position = "bottom",
  size = 20,
}
local debugConf = {
  elements = {
    {
      id = "breakpoints",
      size = 0.25,
    },
    {
      id = "stacks",
      size = 0.25,
    },
    {
      id = "scopes",
      size = 0.25,
    },
    {
      id = "watches",
      size = 0.25
    }
  },
  position = "bottom",
  size = 20,
} 
dapui.setup({
  layouts = { consoleConf }
})
local view = "console"
local switch = function() 
  if view == "console" then 
    dapui.close() 
    dapui.setup({
      layouts = { debugConf }
    })
    dapui.open() 
    view = "debug" 
  else 
    dapui.close() 
    dapui.setup({
      layouts = { consoleConf }
    })
    dapui.open() 
    view = "console" 
  end
end


-- require'telescope'.extensions.dap.configurations{}

local debugmode = libmodal.layer.new({})
debugmode:map("n", "uu", function() dapui.toggle() end, {})
debugmode:map("n", "+", switch, {})
debugmode:map("n", "-", switch, {})
debugmode:map("n", "e", function() dapui.eval()  end, {})
debugmode:map("n", "R", function() dap.continue()  end, {})
debugmode:map("n", "b", function() dap.toggle_breakpoint()  end, {})
debugmode:map("n", "n", function() dap.step_over()  end, {})
debugmode:map("n", "N", function() dap.step_into()  end, {})
debugmode:map("n", "k", function() dap.up()  end, {})
debugmode:map("n", "j", function() dap.down()  end, {})
debugmode:map("n", "C", function() require'telescope'.extensions.dap.commands {} end, {})
debugmode:map("n", "B", function() require'telescope'.extensions.dap.list_breakpoints{} end, {})
debugmode:map("n", "V", function() require'telescope'.extensions.dap.variables{} end, {})
debugmode:map("n", "F", function() require'telescope'.extensions.dap.frames{} end, {})
debugmode:map("n", "<esc>", function()  vim.g.libmodalActiveLayerName = nil debugmode:exit() end, {})

vim.keymap.set("n", "<leader>d", function() debugmode:enter() vim.g.libmodalActiveLayerName = 'DEBUG' end, {})

dap.listeners.after.event_initialized["dapui_config"] = function()
  debugmode:enter()
  vim.g.libmodalActiveLayerName = 'DEBUG'
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  debugmode:exit()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  debugmode:exit()
  dapui.close()
end
