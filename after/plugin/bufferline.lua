local close_func = function(bufnum)
  local bufdelete_avail, bufdelete = pcall(require, "bufdelete")
  if bufdelete_avail then
    bufdelete.bufdelete(bufnum, true)
  else
    vim.cmd.bdelete { args = { bufnum }, bang = true }
  end
end
require("bufferline").setup({
  options = {
    offsets = {
      { filetype = "NvimTree", text = "", padding = 1 },
      { filetype = "neo-tree", text = "", padding = 1 },
      { filetype = "Outline", text = "", padding = 1 },
    },
    close_command = close_func,
    max_name_length = 24,
    max_prefix_length = 23,
    tab_size = 29,
    separator_style = "thin",
  },
})

vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>")
