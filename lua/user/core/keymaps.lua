vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>e", ":Explore<cr>", {desc = "Open Explorer"})
keymap.set("n", "<leader>w", ":w<cr>", {desc = "Save"})
keymap.set("n", "<leader>+", "<C-a>", {desc = "Increment a number"})
keymap.set("n", "<leader>-", "<C-x>", {desc = "Decrement a number"})

-- splits
keymap.set("n", "<leader>es", "<C-w>=", {desc = "Make splits equal width"})
keymap.set("n", "<leader>x", "<cmd>close<cr>", {desc = "Close current split"})

-- buffers
keymap.set("n", "H", "<cmd>bprev<cr>", {desc = "Prev open file"})
keymap.set("n", "L", "<cmd>bnext<cr>", {desc = "Next open file"})

-- exit
keymap.set("n", "<leader>q", "<cmd>qa<cr>", {desc = "Quit"})
keymap.set("n", "<C-w>", "<cmd>q<cr>", {desc = "Close file"})
