require('plugins')
require('pluginSettings')
require('hotkeys')

-- auto changedir 
vim.opt.autochdir = true


vim.fn.setenv("JAVA_TOOL_OPTIONS", "-javaagent:/Users/evgenii/.m2/repository/org/projectlombok/lombok-1.18.24.jar -Xbootclasspath/p:/Users/evgenii/.m2/repository/org/projectlombok/lombok-1.18.24.jar")
