return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzf = require("fzf-lua")
    fzf.setup({
      winopts = {
        width = 0.9,
        column = 0.45,
        row = 0.25,
        height = 0.9,
        preview = {
          delay = 300,
        },
        lsp = {
          jump_to_single_result = true
        },
      },
    })
    vim.keymap.set("n", "<leader>f", ":FzfLua files<cr>", { desc = "Find file" })
    vim.keymap.set("n", "<leader>sl", ":FzfLua resume<cr>", { desc = "Open last search" })
    vim.keymap.set("n", "<leader>sr", ":FzfLua oldfiles<cr>", { desc = "Search recent" })
    vim.keymap.set("n", "<leader>ss", ":FzfLua live_grep<cr>", { desc = "Search word" })
    vim.keymap.set("n", "<leader>se", ":FzfLua grep_cword<cr>", { desc = "Search word under cursor" })
    vim.keymap.set("v", "<leader>se", ":FzfLua grep_visual<cr>", { desc = "Search selcted text" })
    vim.keymap.set("n", "<leader>sv", ":FzfLua lsp_document_symbols<cr>", { desc = "Search variables" })
    vim.keymap.set("n", "gD", function() fzf.lsp_declarations() end, { desc = "Go to declaration" })
    vim.keymap.set("n", "gd", function() fzf.lsp_definitions({jump_to_single_result = true}) end, { desc = "Show buffer diagnostics" })
  end
}
