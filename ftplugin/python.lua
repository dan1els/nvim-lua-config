venv_selector = require("venv-selector")

venv_selector.setup({
	changed_venv_hooks = { venv_selector.hooks.pyright }
})

require('dap-python').setup()

--debug remote (move to the project settings)
local dap = require('dap')
dap.configurations.python = {
  {
    type = 'python';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5678;
    timeout = 60000;
  },
}
