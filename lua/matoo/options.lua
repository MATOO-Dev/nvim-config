-- enable relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- ensure tabs are always 4 spaces wide, and are actually tabs instead of spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- disable wrap by default, but if wrap is manually enabled, break between words
vim.opt.wrap = false
vim.opt.linebreak = true

-- ignore capitalization when searching etc, unless specified
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- automatically handle indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- unfold everything when opening a file
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99

-- dont show insert/visual/etc mode, deferred to status bar plugin
vim.opt.showmode = false

-- thin cursor in insert, block otherwise, and make it blink
vim.opt.guicursor = "n-v-r:block,i:ver25,a:blinkwait700-blinkoff400-blinkon250"
