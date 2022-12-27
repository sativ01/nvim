require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = "25%",
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<cr>")
