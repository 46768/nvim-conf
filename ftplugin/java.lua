local opts = require('fn')

local config = {
    cmd = {opts.fixMasonBin(opts.normalizePath(opts.DATA .. '/mason/bin/jdtls'))},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
