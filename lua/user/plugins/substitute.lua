return{
  "gbprod/substitute.nvim",
  event = {"BufReadPre", "BufNewFile"},
  opts = {},
  config = function ()
    local substitute = require("substitute")
    substitute.setup()
    -- keymaps
    local keymap = vim.keymap.set
    keymap("n", "S", substitute.operator, {desc = "Substitute with motion"})
    keymap("n", "Sl", substitute.line, {desc = "Substitute line"})
    keymap("n", "SL", substitute.eol, {desc = "Substitute to the end of line"})
    keymap("x", "S", substitute.visual, {desc = "Substitute in visual mode"})
  end
}
