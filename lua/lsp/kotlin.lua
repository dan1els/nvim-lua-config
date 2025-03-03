local fn = vim.fn
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local util = require("lspconfig.util")


local root_files = {
  'settings.gradle', -- Gradle (multi-project)
  'settings.gradle.kts', -- Gradle (multi-project)
  'build.xml', -- Ant
  'pom.xml', -- Maven
  'build.gradle', -- Gradle
  'build.gradle.kts', -- Gradle
}

local root_dir = util.root_pattern(unpack(root_files))

local function resolve_classname()
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
    command = vim.g.lazy_plugin_path..'/kotlin-debug-adapter/adapter/build/install/adapter/bin/kotlin-debug-adapter';
}

dap.configurations.kotlin = {
  {
    type = "kotlin",
    request = "attach",
    hostName = "127.0.0.1",
    projectRoot = root_dir,
    port = 5005,
    timeout = 2000,
    auto_continue_if_many_stopped = false,
    mainClass = function() resolve_classname() end,
  },
}

require'lspconfig'.kotlin_language_server.setup{
  autostart = true,
  capabilities = capabilities,
  root_dir = root_dir,
  cmd = {vim.g.lazy_plugin_path..'/kotlin-language-server/server/build/install/server/bin/kotlin-language-server'},
  init_options = {
    -- Enables caching and use project root to store cache data.
    storagePath = util.root_pattern(unpack(root_files))(vim.fn.expand '%:p:h'),
  },
}
