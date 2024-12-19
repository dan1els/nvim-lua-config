local fn = vim.fn
local util = require("lspconfig.util")


local function resolve_classname()
  --[[ if (vim.bo.filetype ~= "kotlin") then
    print("filetype")
    print(vim.bo.filetype)
    return
  end ]]
  local root_dir = util.root_pattern(root_files)(vim.fn.fnamemodify(vim.fn.expand("%"), ":p:h"))
  if root_dir == nil then
    return
  end

  local grep_res = vim.api.nvim_exec('! grep "fun main(arg[sv]: Array<String>)" -r ' .. root_dir, true)
  if not grep_res or string.match(grep_res, "shell returned 1") then
    vim.notify("Unable to find main func", vim.log.levels.WARN)
    return
  end

  local files = {}
  local mainfile, pkgname

  for f in string.gmatch(grep_res, "([%w+%p]+[%w+.]kt)") do
    if not contains(files, f) then
      table.insert(files, f)
    end
  end

  if #files > 1 then
    return
  else
    mainfile = files[1]
  end
  assert(mainfile, "Could not find a file matching \'fun main(args: Array<String>)\'")

  for line in io.lines(mainfile) do
    local match = line:match("package ([a-z\\.]+)")
    if match then
      pkgname = match
      break
    end
  end
  assert(pkgname, "Could not find package name for current class")
  return pkgname .. "." .. vim.fn.fnamemodify(mainfile, ":t:r") .. "Kt"
end



local dap = require('dap')

dap.adapters.kotlin = {
    type = 'executable';
    command = fn.stdpath('data')..'/site/pack/packer/start/kotlin-debug-adapter/adapter/build/install/adapter/bin/kotlin-debug-adapter';
}

dap.configurations.kotlin = {
  {
    type = "kotlin",
    request = "attach",
    hostName = "127.0.0.1",
    projectRoot = "${workspaceFolder}",
    port = 5005,
    timeout = 2000,
    auto_continue_if_many_stopped = false,
    mainClass = function() resolve_classname() end,
  },
}

vim.api.nvim_create_user_command('DebugNearest', function()
  vim.g["test#java#gradletest#options"] = '--debug-jvm'
  vim.g["test#java#maventest#options"] = '-Dmaven.surefire.debug'
  vim.cmd("TestNearest")
  vim.g["test#java#gradletest#options"] = ''
  vim.g["test#java#maventest#options"] = ''
end,{})

vim.api.nvim_create_user_command('DebugFile', function()
  vim.g["test#java#gradletest#options"] = '--debug-jvm'
  vim.g["test#java#maventest#options"] = '-Dmaven.surefire.debug'
  vim.cmd("TestFile")
  vim.g["test#java#gradletest#options"] = ''
  vim.g["test#java#maventest#options"] = ''
end,{})
vim.cmd("LspStart")
