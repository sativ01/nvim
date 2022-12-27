--[[ require('project_nvim').setup({
    manual = true,
    patterns = {".git", "package.json"},
    silent_chdir = false,
})
require('telescope').load_extension('project')
require('telescope').setup {
  extensions = {
   project = {
--     base_dirs = {
--       '~/dev/src',
--       {'~/dev/src2'},
--       {'~/dev/src3', max_depth = 4},
--       {path = '~/dev/src4'},
--       {path = '~/dev/src5', max_depth = 2},
--     },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      sync_with_nvim_tree = true, -- default false
    }
  }
}
-- nvim-tree integration
require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})

vim.keymap.set('n', '<leader>p', ":lua require'telescope'.extensions.project.project{}<CR>", {}) ]]
