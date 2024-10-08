vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Save file" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment a number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement a number" })

-- splits
-- keymap.set("n", "<leader>s=", "<C-w>=", {desc = "Make splits equal width"})
keymap.set("n", "<leader>x", "<cmd>close<cr>", { desc = "Close current split" })

-- buffers
keymap.set("n", "H", "<cmd>bprev<cr>", { desc = "Prev open file" })
keymap.set("n", "L", "<cmd>bnext<cr>", { desc = "Next open file" })
keymap.set("n", "<C-x>", "<cmd>w | %bd | e#<cr>", { desc = "Next open file" })

-- exit
keymap.set("n", "<leader>q", vim.cmd.quitall, { desc = "Quit" })
keymap.set("n", "<C-w>", vim.cmd.quit, { desc = "Close file" })
keymap.set("n", "<leader>c", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader>wso", ":w<cr>:so<cr>", { desc = "Write and source" })

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line in Visual mode" })
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line in Visual mode" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap leader
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>u", vim.cmd.nohlsearch, { desc = "Un-hightlight" })

vim.keymap.set({ "n", "i" }, ";;", "<Esc>A;<Esc>")
vim.keymap.set({ "n", "i" }, ",,", "<Esc>A,<Esc>")

-- redo
vim.keymap.set("n", "U", vim.cmd.redo)

-- diagnostics navigation
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- handy dandy
vim.keymap.set("n", "Y", "Y")
vim.keymap.set("n", "|", ":vs<cr>")

-- set default selection to inner
vim.keymap.set("o", "w", "iw", { remap = false })
vim.keymap.set("o", "'", "i'", { remap = false })
vim.keymap.set("o", '"', 'i"', { remap = false })
vim.keymap.set("o", "(", "i(", { remap = false })
vim.keymap.set("o", "[", "i[", { remap = false })
vim.keymap.set("o", "{", "i{", { remap = false })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Open Outline
vim.keymap.set("n", "<leader>o", ":Outline<CR>", { desc = "Toggle Outline" })

-- disable line number
vim.keymap.set("n", "<leader>rn", ":set relativenumber!<cr>")
