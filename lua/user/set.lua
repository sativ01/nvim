vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250

vim.opt.colorcolumn = "120"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.cmd [[colorscheme rose-pine]]

-- better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Highlight on yank
local highlightGroup = vim.api.nvim_create_augroup('YankHighlight', {clear = true})
 vim.api.nvim_create_autocmd('TextYankPost',{
    callback = function ()
       vim.highlight.on_yank()
    end,
    group = highlightGroup,
    pattern = '*',
})

