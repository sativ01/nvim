return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      winopts = {
        width = 0.9,
        column = 0.45,
        row = 0.25,
        height = 0.9,
        preview = {
          delay = 300,
        }
      },
    })
    vim.keymap.set("n", "<leader>f", ":FzfLua files<cr>", {desc = "Find file"} )
    vim.keymap.set("n", "<leader>sl", ":FzfLua resume<cr>", {desc = "Open last search"} )
    vim.keymap.set("n", "<leader>sr", ":FzfLua oldfiles<cr>", {desc = "Search recent"} )
    vim.keymap.set("n", "<leader>ss", ":FzfLua live_grep<cr>", {desc = "Search word"} )
    vim.keymap.set("n", "<leader>se", ":FzfLua grep_cword<cr>", {desc = "Search word under cursor"} )
    vim.keymap.set("v", "<leader>se", ":FzfLua grep_visual<cr>", {desc = "Search selcted text"} )
    -- vim.keymap.set("n", "<leader>/", ":FzfLua grep_curbuf<cr>", {desc = "Search current file"} )
  end
}
