vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to space
opt.smartindent = true 

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign column to prevent text shifting

opt.backspace = "indent,eol,start" -- allow backspace on indent

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- window splits
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal to the bottom

vim.opt.updatetime = 250
vim.opt.colorcolumn = "90"

-- Highlight on yank
local highlightGroup = vim.api.nvim_create_augroup('YankHighlight', {clear = true})
 vim.api.nvim_create_autocmd('TextYankPost',{
    callback = function ()
       vim.highlight.on_yank()
    end,
    group = highlightGroup,
    pattern = '*',
})
